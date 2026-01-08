# terraform-proxmox-vm

Reusable Terraform module to create Proxmox VE virtual machines using
the bpg/proxmox provider.

## Usage

```hcl
module "vm" {
  source = "git::https://github.com/aminbenmansour/terraform-proxmox-vm.git?ref=v1.0.0"

  name      = "vm-1"
  node_name = "pve-01"
  vm_id     = 200
}
```

### Inputs
| Name      | Description   |
|-----------|---------------|
| name      | VM name       |
| node_name | Proxmox node  |
| vm_id     | VM ID         |


### Outputs
| Name     | Description   |
|----------|---------------|
| vm_id    | Created VM ID |
| vm_ipv4  | VM IPV4       |
| vm_ipv6  | VM IPV6       |


