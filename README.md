# terraform-openstack-app

Deploy on-premise modules in openstack tenant with terraform.
This modules create the following resources
  * network/subnet
  * Floating ip (for bastion and http_proxy)
  * security group/rule for bastion/http_proxy/other
  * 1 root volume acting as template snapshot volume for other instances
  * 1 bastion instance (for ssh only)
  * 1 http_proxy instance (corporate proxy)
  * N app instances
  * Terraform backend state stored in swift


# Notes:

Prereq:
  * openstack credentials / tenant
  * (optional) dockerhub credentials
  * (optional) corporate http proxy credentials

### Terraform variables
See details in `terraform/variables.tf` file

Common variables
| Name | description | Value |
| --- | --- | --- |
| `prefix_name` | environment prefix | `test` |
| `image` | cloud image | `debian9-latest` |
| `flavor` | cloud flavor | `standard-2.2` |
| `vol_size` | volume size (Go) | `10` |
| `vol_type` | volume type | `ceph` |
| `key_name` | key_name to allow ssh connection  | `debian` |
| `bastion_count` | bastion count (0 = disable, 1=enable) | `1` |
| `http_proxy_count` | http_proxy count (0 = disable, 1=enable) | `1` |
| `tinyproxy_upstream` | default tinyproxy_upstream | `["upstream proxy1:3128"]` |
| `tinyproxy_proxy_authorization` | tinyproxy_proxy_authorization | `base64(login:password)` |
| `dockerhub_login` | dockerhub_login | `login` |
| `dockerhub_token` | dockerhub_token | `token` |
| `github_token` | github_token | `github_token` |
| `docker_registry_username` | docker_registry_username | `docker_registry_username` |
| `docker_registry_token` | docker_registry_token | `docker_registry_token` |
| `app_count` | app instance count (0 = disable, 1,2,3...N) | `1` |
| `app_install_script` | app install script url to deploy (https://mysite.org/install-script.sh)  | |

### Variables
You can override terraform variables
```
Variable Openstack credentials
OS_PROJECT_NAME=<CHANGE_DEV_TENANT>
OS_USERNAME=<CHANGE_USER>
OS_PASSWORD=<CHANGE_PASSWORD>
OS_AUTH_URL=https://identity.api.my-cloud.org/v3
OS_CACERT=/etc/ssl/certs/ca-certificates.crt
OS_IDENTITY_API_VERSION=3
OS_INTERFACE=public
OS_PROJECT_DOMAIN_NAME=tech
OS_REGION_NAME=region1
OS_USER_DOMAIN_NAME=tech
OS_INSECURE=true
export OS_AUTH_URL OS_CACERT OS_IDENTITY_API_VERSION OS_INTERFACE OS_PROJECT_DOMAIN_NAME OS_USER_DOMAIN_NAME OS_REGION_NAME OS_PROJECT_NAME OS_USERNAME OS_PASSWORD OS_INSECURE

Variable TF_VAR_xxxx
TF_VAR_tinyproxy_proxy_authorization = base64(login:password)

```

## Local build terraform

You can also test,validate,plan,apply terraform file from the local docker image before commit your work

* Build docker image with terraform/terragrunt
```
make build
```
* Test, plan, deploy
```
make tf-format PROJECT="terraform"
make tf-validate PROJECT="terraform"
make tf-plan PROJECT="terraform" TF_VAR_FILE="-var-file=/data/terraform/env/dev/config.auto.vars"
make tf-apply PROJECT="terraform" TF_VAR_FILE="-var-file=/data/terraform/env/dev/config.auto.vars"
# ou 
make tf-deploy PROJECT="terraform" TF_VAR_FILE="-var-file=/data/terraform/env/dev/config.auto.vars"
```
## TODO
* doc/schema
