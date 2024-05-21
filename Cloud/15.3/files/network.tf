# Создание сети 
resource "yandex_vpc_network" "vps" {
  name = var.vpc_name
}
# Создание публичной подсети 
resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.vps.id
  v4_cidr_blocks = var.default_cidr_pub
}


