### Name vars

variable "family_ubuntu_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family yandex_compute_image"
}
### resources  vars 

variable "resources_db" {
type = map
default = {
cpu = 2
ram = 2
core_fraction = 20
}
}
variable "resources_web" {
type = map
default = {
cpu = 2
ram = 2
core_fraction = 5
}
}
