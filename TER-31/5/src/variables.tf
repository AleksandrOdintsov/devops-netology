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
variable "valid_ip" {
  type        = string
  description = "ip-адрес" 
  default     = "192.168.0.1"
  validation {
    condition = can(cidrhost("${var.valid_ip}/32", 0))
    error_message = "Invalide ip addres" 
  }
}

variable "valid_ip_pool" {
  type        = list(string)
  description="список ip-адресов"
  default     = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
  validation {
    condition = can([for ip in var.valid_ip_pool : regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$", ip)])
    error_message = "Invalide ip addres" 
  }
}