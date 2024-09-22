locals {
  tunnel_name = length(var.tunnel_name) > 0 ? var.tunnel_name : "${var.domain}-ssh"
}