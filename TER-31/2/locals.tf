locals {

  type = "platform"
  rules_web = "web"
  rules_bd = "bd"
  vm_web_name = "netology-develop-${local.type}-${local.rules_web}"
  vm_bd_name = "netology-develop-${local.type}-${local.rules_bd}"
}

