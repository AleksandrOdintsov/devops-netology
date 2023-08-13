
output "develop_net" {
  value = yandex_vpc_network.develop_net.id
}
output "develop_subnet" {
  value = yandex_vpc_subnet.develop_subnet.id
}
output "develop_subnet_zone" {
    value = yandex_vpc_subnet.develop_subnet.zone
}