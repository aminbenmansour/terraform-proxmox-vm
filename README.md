# terraform-proxmox-vm

Reusable Terraform module to create Proxmox VE virtual machines using
the bpg/proxmox provider.

## Usage

```hcl
module "vm" {
  source = "git::https://github.com/aminbenmansour/terraform-proxmox-vm.git?ref=v1.0.0"

  name      = "vm-01"
  node_name = "pve-01"
  vm_id     = 200

  memory   = 2048
  vcpu     = 2
  disk_size = "16G"

  cloud_image_url      = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  cloud_image_filename = "ubuntu-24.04-cloud.img"

  ssh_public_key = file("~/.ssh/id_ed25519.pub")
}
```

## Inputs & Outputs
### Inputs

| Name                   | Description                                | Type     | Default |
|------------------------|--------------------------------------------|----------|---------|
| name                   | VM name                                    | string   | n/a     |
| node_name              | Proxmox node name                          | string   | n/a     |
| vm_id                  | Proxmox VM ID                              | number   | n/a     |
| memory                 | Memory size in MB                          | number   | 2048    |
| vcpu                   | Number of vCPUs                            | number   | 2       |
| disk_size              | Disk size (e.g. `16G`)                     | string   | "16G"   |
| cloud_image_url        | Cloud image download URL                   | string   | n/a     |
| cloud_image_filename   | Cloud image filename                       | string   | n/a     |
| ssh_public_key         | SSH public key for the `ubuntu` user       | string   | n/a     |
| timezone               | VM timezone                                | string   | "Europe/Berlin" |


### Outputs

| Name      | Description                     |
|-----------|---------------------------------|
| vm_id     | Created VM ID                   |
| vm_ipv4   | VM IPv4 address(es)             |
| vm_ipv6   | VM IPv6 address(es)             |



