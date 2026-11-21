variable "router_host" {
  description = "RouterOS HTTPS REST API URL"
  type        = string
}

variable "router_username" {
  description = "RouterOS API username"
  type        = string
  default     = "admin"
}

variable "router_password" {
  description = "RouterOS API password"
  type        = string
  sensitive   = true
}

variable "router_insecure" {
  description = "Allow self-signed TLS certificate for lab HTTPS"
  type        = bool
  default     = true
}

variable "vlans" {
  description = "Map of department VLANs to create on RouterOS"
  type = map(object({
    vlan_id   = number
    interface = string
  }))
}
