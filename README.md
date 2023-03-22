# F5XC INTERNAL HTTP LB

## Introduction

This sample Terraform creates a F5 Distributed Cloud Load Balancer that utilizes a Customer Edge (CE) to establish connectivity to the origin server(s) and creates the LB advertisement on a CE(s). 

## Prerequisites
- A F5 Distributed Cloud account with API access
- An existing dual nic CE deployment
- An origin server(s) that is IP reachable by the CE inside interface
- A site token used to register the Customer Edge to Distributed Cloud.

## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 1.3.0 |

## Providers

| Name | Version |
|------|---------|
| volterra | ~> 0.11.20 |

## Inputs
| Name                       | Description | Type | Default |
| -----                      | ----------- | ---- | ------- | 
| api_cert | REQUIRED: F5 Distributed Cloud API certificate file path | string | /PATH/certificate.cert |
| api_key | REQUIRED: F5 Distributed Cloud API certificate private key file path | string | /PATH/private_key.key |
| f5xc_tenant_name | REQUIRED: F5 Distributed Cloud tenant ID | string | |
| f5xc_tenant_id | REQUIRED: F5 Distributed Cloud tenant ID | string | |
| f5xc_namespace | REQUIRED: F5 Distributed Cloud namespace to deploy objects into | string | default |
| pool_name | REQUIRED: F5 Distributed Cloud origin pool name | string | |
| private_ips | REQUIRED: List of server IP addresses and the F5 Distributed Cloud sites they are reachable from | list(object) | |
| server_port | REQUIRED: F5 Distributed Cloud origin server port number | string | 80 |
| lb_name | REQUIRED: F5 Distributed Cloud load balancer name | string | |
| lb_domain_names | REQUIRED: List of F5 Distributed Cloud load balancer domain names | list(string) | |
| lb_advertise_sites | REQUIRED: F5 Distributed Cloud site names to advertise lb on | list(string) | |

## Outputs

## Deployment
For deployment you can use the traditional terraform commands.

```bash
terraform init
terraform plan
terraform apply
```

## Destruction

For destruction / tear down you can use the trafitional terraform commands.

```bash
terraform destroy
```
