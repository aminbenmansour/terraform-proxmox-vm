resource "proxmox_virtual_environment_download_file" "cloud_image" {
  content_type = "iso"
  node_name    = var.node_name
  datastore_id = "local-lvm"

  url       = var.cloud_image_url
  file_name = var.cloud_image_filename
}

resource "proxmox_virtual_environment_vm" "instance" {
  for_each = var.instances

  name      = each.key
  vm_id     = each.value.vm_id
  node_name = each.value.node_name

  agent {
    enabled = true
  }

  cpu {
    cores = var.vcpu
  }

  memory {
    dedicated = var.memory
  }

  disk {
    datastore_id = "local-lvm"
    import_from  = proxmox_virtual_environment_download_file.cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.disk_size
  }

  network_device {
    bridge = "vmbr0"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data.id
    meta_data_file_id = proxmox_virtual_environment_file.meta_data[each.key].id
  }
}

resource "proxmox_virtual_environment_file" "user_data" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.node_name

  source_raw {
    data = <<-EOF
      #cloud-config
      timezone: ${var.timezone}
      users:
        - default
        - name: ubuntu
          groups: [sudo]
          shell: /bin/bash
          sudo: ALL=(ALL) NOPASSWD:ALL
          ssh_authorized_keys:
            - ${trimspace(var.ssh_public_key)}
      package_update: true
      packages:
        - qemu-guest-agent
        - curl
        - net-tools
      runcmd:
        - systemctl enable qemu-guest-agent
        - systemctl start qemu-guest-agent
    EOF

    file_name = "${var.name}-user-data.yaml"
  }
}

resource "proxmox_virtual_environment_file" "meta_data" {
  for_each = var.instances
  
  content_type = "snippets"
  datastore_id = "local"
  node_name    = each.value.node_name

  source_raw {
    data = <<-EOF
      instance-id: ${each.key}
      local-hostname: ${each.key}
    EOF

    file_name = "${each.key}-meta-data.yaml"
  }
}

data "proxmox_virtual_environment_vm" "instances" {
  for_each = var.instances

  node_name = each.value.node_name
  vm_id     = each.value.vm_id
}

