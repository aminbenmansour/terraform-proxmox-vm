# terraform-proxmox-vm

Reusable Terraform module to create Proxmox VE virtual machines using
the bpg/proxmox provider.

## Inputs & Outputs
### Inputs

| Name                   | Description                                | Type             | Default |
|------------------------|--------------------------------------------|------------------|---------|
| name                   | VM name                                    | string           | n/a     |
| node_name              | Proxmox node name                          | string           | n/a     |
| vm_id                  | Proxmox VM ID                              | number           | n/a     |
| instances              | Number of instances                        | map(object{})    | n/a     |
| memory                 | Memory size in MB                          | number           | 2048    |
| vcpu                   | Number of vCPUs                            | number           | 2       |
| disk_size              | Disk size (e.g. `16G`)                     | string           | "16G"   |
| cloud_image_url        | Cloud image download URL                   | string           | n/a     |
| cloud_image_filename   | Cloud image filename                       | string           | n/a     |
| ssh_public_key         | SSH public key for the `ubuntu` user       | string           | n/a     |
| timezone               | VM timezone                                | string           | "Europe/Berlin" |


### Outputs

| Name      | Description                     |
|-----------|---------------------------------|
| vm_id     | Created VM ID                   |
| vm_ipv4   | VM IPv4 address(es)             |
| vm_ipv6   | VM IPv6 address(es)             |



