variable "api_cert" {
  description = "REQUIRED: F5 Distributed Cloud API certificate file path"
  type        = string
  default     = "/PATH/certificate.cert"
}

variable "api_key" {
  description = "REQUIRED: F5 Distributed Cloud API certificate private key file path"
  type        = string
  default     = "/PATH/private_key.key"
}

variable "f5xc_tenant_name" {
  description = "REQUIRED: F5 Distributed Cloud tenant ID"
  type        = string
}

variable "f5xc_tenant_id" {
  description = "REQUIRED: F5 Distributed Cloud tenant ID"
  type        = string
}

variable "f5xc_namespace" {
  description = "REQUIRED: F5 Distributed Cloud namespace to deploy objects into"
  type        = string
  default     = "default"
}

variable "pool_name" {
  description = "REQUIRED: F5 Distributed Cloud origin pool name"
  type        = string
}

variable "private_ips" {
  description = "REQUIRED: List of server IP addresses and the F5 Distributed Cloud sites they are reachable from"
  type = list(object({
    private_ip = string
    site       = string
  }))
}

variable "server_port" {
  description = "REQUIRED: F5 Distributed Cloud origin server port number"
  type        = string
  default     = "80"
}

variable "lb_name" {
  description = "REQUIRED: F5 Distributed Cloud load balancer name"
  type        = string
}

variable "lb_domain_names" {
  description = "REQUIRED: List of F5 Distributed Cloud load balancer domain names"
  type        = list(string)
}

variable "lb_advertise_sites" {
  description = "REQUIRED: F5 Distributed Cloud site name to advertise lb on"
  type        = list(string)
}