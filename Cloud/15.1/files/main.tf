# Узкаываем локальные ключи SSH
locals {
  ssh-keys = "${file("~/.ssh/id_rsa.pub")}"
  ssh-private-keys = "${file("~/.ssh/id_rsa")}"
}
# образ для ВМ
data "yandex_compute_image" "ubuntu-2004-lts" {
  family = "ubuntu-2004-lts"
}

# образ для NAT
data "yandex_compute_image" "nat-instance-ubuntu-2204" {
  family = "nat-instance-ubuntu-2204"
}

data "template_file" "cloudinit" {
 template = file("${path.module}/cloud-init.yml")
 vars = {
   ssh_public_key = local.ssh-keys
   ssh_private_key = local.ssh-private-keys
 }
}