# terraform-cloudflare-browser-ssh

This is a simple terraform modules that creates a tunnel to a host using Cloudflare's browser ssh.
Includes a configured Tunnel, Access Application, Access Policy, and SSH CA certificate.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 4.21.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | >= 4.21.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_access_application.app](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/access_application) | resource |
| [cloudflare_access_ca_certificate.ssh_cert](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/access_ca_certificate) | resource |
| [cloudflare_tunnel.ssh_tunnel](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/tunnel) | resource |
| [cloudflare_tunnel_config.ssh_tunnel](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/tunnel_config) | resource |
| [random_password.tunnel_secret](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_application_name"></a> [access\_application\_name](#input\_access\_application\_name) | Name of the Access Application. Defaults to 'SSH for ${var.domain}' | `string` | n/a | yes |
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Cloudflare Account ID | `string` | n/a | yes |
| <a name="input_allowed_idps"></a> [allowed\_idps](#input\_allowed\_idps) | List of IDPs allowed to authenticate to the application | `list(string)` | n/a | yes |
| <a name="input_app_launcher_visible"></a> [app\_launcher\_visible](#input\_app\_launcher\_visible) | Whether to show the app launcher | `bool` | `true` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain to use for the SSH Tunnel | `string` | n/a | yes |
| <a name="input_session_duration"></a> [session\_duration](#input\_session\_duration) | Session duration for the application | `string` | `"24h"` | no |
| <a name="input_skip_interstitial"></a> [skip\_interstitial](#input\_skip\_interstitial) | Whether to skip the interstitial page | `bool` | `false` | no |
| <a name="input_ssh_host"></a> [ssh\_host](#input\_ssh\_host) | Host to connect to via SSH | `string` | `"localhost"` | no |
| <a name="input_ssh_port"></a> [ssh\_port](#input\_ssh\_port) | Port to connect to via SSH | `number` | `22` | no |
| <a name="input_tunnel_name"></a> [tunnel\_name](#input\_tunnel\_name) | Name of the SSH Tunnel | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_id"></a> [application\_id](#output\_application\_id) | Browser SSH Access Application ID |
| <a name="output_aud"></a> [aud](#output\_aud) | Audience tag for the SSH Access Application |
| <a name="output_ssh_cert"></a> [ssh\_cert](#output\_ssh\_cert) | SSH Certificate for the SSH Access Application |
| <a name="output_tunnel_cname"></a> [tunnel\_cname](#output\_tunnel\_cname) | CNAME for the SSH Tunnel |
| <a name="output_tunnel_id"></a> [tunnel\_id](#output\_tunnel\_id) | Tunnel ID |
| <a name="output_tunnel_token"></a> [tunnel\_token](#output\_tunnel\_token) | Token for the SSH Tunnel. Needed to connect to the tunnel. |
<!-- END_TF_DOCS -->