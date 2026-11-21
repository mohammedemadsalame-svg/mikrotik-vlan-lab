terraform {
  required_providers {
    routeros = {
      source  = "terraform-routeros/routeros"
      version = "~> 1.70"
    }
  }
}

provider "routeros" {
  hosturl  = var.router_host
  username = var.router_username
  password = var.router_password
  insecure = var.router_insecure
}

resource "routeros_interface_vlan" "dept_vlans" {
  for_each = var.vlans

  name      = each.key
  vlan_id   = each.value.vlan_id
  interface = each.value.interface
}
