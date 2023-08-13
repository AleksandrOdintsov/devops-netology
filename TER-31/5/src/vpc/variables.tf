variable "vpc_name" {
  type    = string
  default = null
}

variable "vpc_subnet_name" {
  type = string
  default = null
}

variable "zone" {
  type = string
}

variable "cidr" {
  type = list(string)
}