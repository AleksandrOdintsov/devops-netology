resource "yandex_compute_disk" "disk" {
    count = 3
  name       = "disk-${count.index + 1}"
  type       = "network-hdd"
  zone       = var.default_zone
  size       = 10
}
resource "yandex_compute_instance" "storage" {
    count = 1
  name        = "storage"
  platform_id = "standard-v1"
  resources {
    cores  = 2
    memory = 1
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = "network-hdd"
      size = 5
    }   
  }
  metadata = {
    ssh-keys = "ubuntu:${local.ssh-key}"
  }

  
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk.*.id
    content {
      disk_id = secondary_disk.value
    }
  }
  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true

    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  allow_stopping_for_update = true

  
}