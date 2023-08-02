###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"

  
}
###ssh vars
variable "public_key" {
  type    = string
  default = ""
}
  
variable "vm_resources"{
type = list(object(
    {
    name        = string
    platform_id  = string
    cores        = number
    memory        = number
    core_fraction = number
    type          = string
    size        = number
    }))
      default = [
    { 
    name        = "main"
    platform_id = "standard-v1"
    cores        = 2
    memory        = 2
    core_fraction = 20
    type          = "network-hdd"
    size        = 7
    },
    {
     name       = "replica"
    platform_id = "standard-v1"
    cores        = 2
    memory        = 1
    core_fraction = 5
    type          = "network-hdd"
    size        = 5
    }
  ]
}
