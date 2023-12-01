terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "2.10.0"
    }
  }
}

variable "linode_api_token" {
    type = string
}

variable "root_pass" {
    type = string
}

provider "linode" {
  token = var.linode_api_token
}

resource "linode_instance" "terraform-web" {
        image = "linode/ubuntu22.04"
        label = "Terraform-Webserver-RITSEC"
        group = "Terraform"
        region = "us-east"
        type = "g6-nanode-1"
        authorized_keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHnfYAO8Hpz9GDzwBArt6P00WApO8QkuG5tfFmq8sUJa teja juluru@LAPTOP-A5F2K969" ]
        root_pass = var.root_pass
}