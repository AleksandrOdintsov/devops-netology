terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}



resource "yandex_vpc_network" "develop_net" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop_subnet" {
  name           = var.vpc_subnet_name
  zone           = var.zone
  network_id     = yandex_vpc_network.develop_net.id
  v4_cidr_blocks = var.cidr
}



