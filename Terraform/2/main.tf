resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.family_ubuntu_image
}
resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name
  platform_id = "standard-v1"
  resources {
    cores         = var.resources_web.cpu
    memory        = var.resources_web.ram
    core_fraction = var.resources_web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.ssh.serial-port-enable
    ssh-keys           = var.ssh.ssh-keys
  }

}

resource "yandex_compute_instance" "platform-bd" {
  name        = local.vm_bd_name
  platform_id = "standard-v1"
  resources {
   cores         = var.resources_db.cpu
    memory        = var.resources_db.ram
    core_fraction = var.resources_db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.ssh.serial-port-enable
    ssh-keys           = var.ssh.ssh-keys
  }

}