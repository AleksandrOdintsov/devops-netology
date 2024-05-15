#Создаем NAT

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
    ip_address  = "192.168.10.254"  # Указываем статический IP для NAT
  }
      metadata = {
      user-data          = data.template_file.cloudinit.rendered
      serial-port-enable = 1
  }

}

# ВМ для public subnet

resource "yandex_compute_instance" "vm1" {
    name        = "vm1"
  platform_id = "standard-v1"


resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      size = 20
    }
  }
  scheduling_policy {
    preemptible = false
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }
      metadata = {
      user-data          = data.template_file.cloudinit.rendered
      serial-port-enable = 1
  }

}
# ВМ для private subnet
resource "yandex_compute_instance" "vm2" {
    name        = "vm2"
  platform_id = "standard-v1"


resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      size = 20
    }
  }
  scheduling_policy {
    preemptible = false
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
    nat       = true
 
  }
      metadata = {
      user-data          = data.template_file.cloudinit.rendered
      serial-port-enable = 1
  }

}
