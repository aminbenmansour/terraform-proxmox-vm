include {
  path = find_in_parent_folders()
}

include "env" {
  path = find_in_parent_folders("env.hcl")
}

terraform {
  source = "git::https://github.com/aminbenmansour/terraform-proxmox-vm.git//.?ref=v1.0.0"
}

inputs = {

  instances = {
    worker-01 = { vm_id = 303, node_name = "pve-01" }
    worker-02 = { vm_id = 304, node_name = "pve-02" }
    worker-03 = { vm_id = 305, node_name = "pve-03" }
  }
  
  memory    = 2048
  vcpu      = 2
  disk_size = "16G"

  # k8s_apiserver = dependency.k8s_cp_nodes.outputs.apiserver

  cloud_image_url      = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  cloud_image_filename = "ubuntu-24.04-cloud.img"

  ssh_public_key = file("~/.ssh/id_ed25519.pub")
}

dependency "k8s_cp_nodes" {
  config_path = "../k8s-cp-nodes"
}