provider "proxmox" {
  endpoint  = "https://pve-01:8006"
  api_token = var.proxmox_api_token
  insecure  = true
}
