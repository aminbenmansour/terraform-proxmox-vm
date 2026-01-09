remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform-states"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "proxmox" {
  endpoint  = "https://pve-01:8006"
  api_token = "${get_env("PROXMOX_API_TOKEN")}"
  insecure  = true
}
EOF
}
