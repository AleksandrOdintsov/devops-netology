# [Домашнее задание к занятию "15.1. Организация сети"](https://github.com/netology-code/clokub-homeworks/blob/clokub-5/15.1/README.md)
---
## Задание 1. Яндекс.Облако (обязательное к выполнению)

1. Создать VPC.
- Создать пустую VPC. Выбрать зону.
```
resource "yandex_vpc_network" "vpc" {
  name = var.vpc_name
}
```
2. Публичная подсеть.
- Создать в vpc subnet с названием public, сетью 192.168.10.0/24.
```
resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.vps.id
  v4_cidr_blocks = var.default_cidr_pub
}

```
- Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1

```
resource "yandex_compute_instance" "nat" {
    name        = "nat-subnet-public"
  platform_id = "standard-v1"


resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.nat-instance-ubuntu-2204.image_id
      size = 20
    }
  }
  scheduling_policy {
    preemptible = false
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
    ip_address  = "192.168.10.254"
  }
  

}
```
- Создать в этой публичной подсети виртуалку с публичным IP и подключиться к ней, убедиться что есть доступ к интернету.
<p align="center">
  <img width="" height="" src="./scr/1.png">
</p>

<p align="center">
  <img width="" height="" src="./scr/2.png">
</p>

3. Приватная подсеть.
- Создать в vpc subnet с названием private, сетью 192.168.20.0/24.
```
resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.vps.id
  v4_cidr_blocks = var.default_cidr_priv
}
```
- Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс
```
resource "yandex_vpc_route_table" "private-rt" {
  network_id = yandex_vpc_network.vps.id
  name              = "private-rt"
  static_route {
    destination_prefix  = "0.0.0.0/0"
    next_hop_address    = yandex_compute_instance.nat.network_interface[0].ip_address
  }
}

```
- Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее и убедиться что есть доступ к интернету
<p align="center">
  <img width="" height="" src="./scr/3.png">
</p>
<p align="center">
  <img width="" height="" src="./scr/4.png">
</p>

Resource terraform для ЯО
- [VPC subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet)
- [Route table](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_route_table)
- [Compute Instance](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance)
---


