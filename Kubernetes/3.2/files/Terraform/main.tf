
# Узкаываем локальные ключи SSH
locals {
  ssh-keys = "${file("~/.ssh/id_rsa.pub")}"
  ssh-private-keys = "${file("~/.ssh/id_rsa")}"
}
# Создание сети 
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
# Создание подсети 
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu-2004-lts" {
  family = "ubuntu-2004-lts"
}


data "template_file" "cloudinit" {
 template = file("${path.module}/cloud-init.yml")
 vars = {
   ssh_public_key = local.ssh-keys
   ssh_private_key = local.ssh-private-keys
 }
}
