variable "account_id" {
  description = "Cloudflare Account ID"
  type        = string
}

variable "allowed_idps" {
  description = "List of IDPs allowed to authenticate to the application"
  type        = list(string)
}

variable "domain" {
  description = "Domain to use for the SSH Tunnel"
  type        = string
}

variable "session_duration" {
  description = "Session duration for the application"
  type        = string
  default     = "24h"
}

variable "app_launcher_visible" {
  description = "Whether to show the app launcher"
  type        = bool
  default     = true
}

variable "skip_interstitial" {
  description = "Whether to skip the interstitial page"
  type        = bool
  default     = false
}

variable "tunnel_name" {
  description = "Name of the SSH Tunnel"
  type        = string
  default     = ""
}

variable "ssh_host" {
  description = "Host to connect to via SSH"
  type        = string
  default     = "localhost"
}

variable "ssh_port" {
  description = "Port to connect to via SSH"
  type        = number
  default     = 22
}