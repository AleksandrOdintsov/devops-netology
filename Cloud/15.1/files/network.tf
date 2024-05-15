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


# Создание приватной подсети 
resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.vps.id
  v4_cidr_blocks = var.default_cidr_priv
  route_table_id = yandex_vpc_route_table.private-rt.id
}
# Создание таблицы маршрутизации
resource "yandex_vpc_route_table" "private-rt" {
  network_id = yandex_vpc_network.vps.id
  name              = "private-rt"
  static_route {
    destination_prefix  = "0.0.0.0/0"
    next_hop_address    = yandex_compute_instance.nat.network_interface[0].ip_address
  }
}
