terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.7.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "cloudflare" {
}

variable "account_id" {
  type = string
}

resource "random_string" "tunnel_name" {
  length  = 32
  special = false
  numeric = true
  upper = false
}

module "test1" {
    source = "../.."
    account_id = var.account_id
    tunnel_name = "actions_testing"
    domain = "${random_string.tunnel_name.result}.terraform.cyberjake.xyz"
}