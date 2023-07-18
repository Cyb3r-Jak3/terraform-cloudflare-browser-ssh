output "application_id" {
  description = "Browser SSH Access Application ID"
  value       = cloudflare_access_application.app.id
}

output "aud" {
  description = "Audience tag for the SSH Access Application"
  value       = cloudflare_access_application.app.aud
}

output "ssh_cert" {
  description = "SSH Certificate for the SSH Access Application"
  value       = cloudflare_access_ca_certificate.ssh_cert.public_key
}

output "tunnel_cname" {
  description = "CNAME for the SSH Tunnel"
  value       = cloudflare_tunnel.ssh_tunnel.cname
}

output "tunnel_token" {
  description = "Token for the SSH Tunnel. Needed to connect to the tunnel."
  value       = cloudflare_tunnel.ssh_tunnel.tunnel_token
  sensitive   = true
}