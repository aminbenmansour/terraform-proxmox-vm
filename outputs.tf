output "instances" {
  value = {
    for name, vm in data.proxmox_virtual_environment_vm.instances :
    name => {
      name     = vm.name
      status   = vm.status
      tags     = vm.tags
      template = vm.template
    }
  }
}