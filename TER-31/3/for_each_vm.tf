data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}
resource "yandex_compute_instance" "web" {
    depends_on = [yandex_compute_instance.platform]
    for_each = { for key ,value in var.vm_resources : key => value}
    name = each.value.name
    platform_id = each.value.platform_id 
    resources {
        cores  = each.value.cores 
        memory = each.value.memory 
        core_fraction = each.value.core_fraction
    }

  boot_disk {
    initialize_params {
    image_id  = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = each.value.type
      size = each.value.size
    }   
  }
  metadata = {
    ssh-keys = "ubuntu:${local.ssh-key}"
  }
  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    
  }
  allow_stopping_for_update = true
}