output "external_ip_web"{
    value = "${yandex_compute_instance.platform.network_interface.0.nat_ip_address}"
}
output "external_ip-bd"{
    value = "${yandex_compute_instance.platform-bd.network_interface.0.nat_ip_address}"

}