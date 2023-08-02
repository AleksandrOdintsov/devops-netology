resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",
    {
       webservers =  yandex_compute_instance.platform 
       databases = yandex_compute_instance.web  
       storage = yandex_compute_instance.storage
    }
  )
  filename = "${abspath(path.module)}/hosts.cfg"
}