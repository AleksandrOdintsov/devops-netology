terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"

 
backend "s3" {
  endpoint   = "storage.yandexcloud.net"
  bucket     = "tfstate-homework5"
  region     = "ru-central1"
  key        = "terraform.tfstate"

  skip_region_validation      = true
  skip_credentials_validation = true

  dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1gk9numsd7mrc6eaphb/etndocsf83n7ra9vbfhb"
  dynamodb_table    = "tflock-develop"
}
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}

module "vpc_dev" {
  source       = "./vpc"
  vpc_name        = "net"
  vpc_subnet_name     = "subnet"
  zone = "ru-central1-a"
  cidr = ["10.0.1.0/24"]
}



module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = "develop"
  network_id      = module.vpc_dev.develop_net
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = [ module.vpc_dev.develop_subnet]
  instance_name   = "web"
  instance_count  = 2
  image_family    = "ubuntu-2004-lts"
  public_ip       = true
  
  metadata = {
      user-data          = data.template_file.cloudinit.rendered 
      serial-port-enable = 1
  }

}
data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")
 vars = {
  ssh_public_key     = file("~/.ssh/id_ed25519.pub")
 }
}

