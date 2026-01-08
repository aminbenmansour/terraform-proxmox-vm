output "vm_id" {
  value = proxmox_virtual_environment_vm.this.vm_id
}

output "vm_ipv4" {
  description = "VM IPv4 addresses"
  value       = proxmox_virtual_environment_vm.this.ipv4_addresses
}

output "vm_ipv6" {
  description = "VM IPv6 addresses"
  value       = proxmox_virtual_environment_vm.this.ipv6_addresses
}