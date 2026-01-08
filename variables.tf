variable "name" {
  description = "VM name"
  type        = string
}

variable "node_name" {
  description = "Proxmox node name"
  type        = string
}

variable "vm_id" {
  description = "Proxmox VM ID"
  type        = number
}

variable "memory" {
  description = "Memory in MB"
  type        = number
  default     = 2048
}

variable "vcpu" {
  description = "Number of vCPUs"
  type        = number
  default     = 2
}

variable "disk_size" {
  description = "Disk size"
  type        = string
  default     = "16G"
}

variable "cloud_image_url" {
  description = "Cloud image download URL"
  type        = string
}

variable "cloud_image_filename" {
  description = "Cloud image filename"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key for default user"
  type        = string
}

variable "timezone" {
  description = "VM timezone"
  type        = string
  default     = "Europe/Berlin"
}
