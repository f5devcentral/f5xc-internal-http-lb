# Create Origin Pool
resource "volterra_origin_pool" "http-origin-pool" {
  name      = var.pool_name
  namespace = var.f5xc_namespace

  origin_servers {

    dynamic "private_ip" {
      for_each = var.private_ips
      content {
        ip             = private_ip.value["private_ip"]
        inside_network = true
        site_locator {
          site {
            tenant    = var.f5xc_tenant_id
            namespace = "system"
            name      = private_ip.value["site"]
          }
        }
      }
    }

    labels = {
    }
  }

  no_tls                 = true
  port                   = var.server_port
  endpoint_selection     = "LOCALPREFERED"
  loadbalancer_algorithm = "LB_OVERRIDE"
}

# Create Load Balancer
resource "volterra_http_loadbalancer" "http-lb" {
  name      = var.lb_name
  namespace = var.f5xc_namespace

  domains = var.lb_domain_names
  http {
    dns_volterra_managed = false
  }

  default_route_pools {
    pool {
      name      = volterra_origin_pool.http-origin-pool.name
      namespace = var.f5xc_namespace
    }
    weight = 1
  }

  advertise_custom {
    advertise_where {
      dynamic "site" {
        for_each = var.lb_advertise_sites
        content {
          network = "SITE_NETWORK_INSIDE"
          site {
            tenant    = var.f5xc_tenant_id
            namespace = "system"
            name      = site.value
          }
        }
      }
      use_default_port = true
    }
  }

  # Mandatory "Security configuration"
  no_service_policies = true
  no_challenge        = true
  disable_rate_limit  = true
  disable_waf         = true
  multi_lb_app        = true
  user_id_client_ip   = true

  source_ip_stickiness = true
}