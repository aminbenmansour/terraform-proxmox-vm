terraform {
  backend "s3" {
    bucket  = "terraform-states"
    key     = "PATH/TO/terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}
