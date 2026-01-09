module "k8s_cp_nodes" {
  source = "git::https://github.com/aminbenmansour/terraform-proxmox-vm.git?ref=v1.0.0"

  # map keys are the VM name and hostname
  instances = {
    cp-01 = { vm_id = 300, node_name = "pve-01" }
    cp-02 = { vm_id = 301, node_name = "pve-02" }
    cp-03 = { vm_id = 302, node_name = "pve-03" }
  }

  memory    = 2048
  vcpu      = 2
  disk_size = "16G"

  cloud_image_url      = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  cloud_image_filename = "ubuntu-24.04-cloud.img"

  ssh_public_key = file("~/.ssh/id_ed25519.pub")
}


module "k8s_worker_nodes" {
  source = "git::https://github.com/aminbenmansour/terraform-proxmox-vm.git?ref=v1.0.0"

  # map keys are the VM name and hostname
  instances = {
    k8s-worker-01 = { vm_id = 304, node_name = "pve-01" }
    k8s-worker-02 = { vm_id = 305, node_name = "pve-02" }
    k8s-worker-03 = { vm_id = 306, node_name = "pve-03" }
  }

  memory    = 2048
  vcpu      = 2
  disk_size = "16G"

  cloud_image_url      = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  cloud_image_filename = "ubuntu-24.04-cloud.img"

  ssh_public_key = file("~/.ssh/id_ed25519.pub")
}
