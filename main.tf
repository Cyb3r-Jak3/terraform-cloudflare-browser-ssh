terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.40.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.1"
    }
  }
}

resource "random_password" "tunnel_secret" {
  length = 128
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "ssh_tunnel" {
  account_id = var.account_id
  name       = local.tunnel_name
  secret     = base64encode(random_password.tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "ssh_tunnel" {
  account_id = var.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.ssh_tunnel.id
  config {
    warp_routing {
      enabled = false
    }
    ingress_rule {
      hostname = var.domain
      service  = "ssh://${var.ssh_host}:${var.ssh_port}"
      origin_request {
        access {
          required  = true
          team_name = var.team_name
          aud_tag   = [cloudflare_zero_trust_access_application.app.aud]
        }
      }
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_zero_trust_access_application" "app" {
  account_id                 = var.account_id
  allowed_idps               = var.allowed_idps
  app_launcher_visible       = var.app_launcher_visible
  auto_redirect_to_identity  = length(var.allowed_idps) == 1 ? true : false
  domain                     = var.domain
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = var.access_application_name != "" ? var.access_application_name : "SSH for ${var.domain}"
  session_duration           = var.session_duration
  skip_interstitial          = var.skip_interstitial
  type                       = "ssh"
  policies                   = var.policies
}

resource "cloudflare_zero_trust_access_short_lived_certificate" "ssh_cert" {
  account_id     = var.account_id
  application_id = cloudflare_zero_trust_access_application.app.id
}