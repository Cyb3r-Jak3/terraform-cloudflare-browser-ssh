locals {
  tunnel_name = var.tunnel_name ? var.tunnel_name : "${var.domain}-ssh"
}