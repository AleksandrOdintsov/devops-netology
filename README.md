# devops-netology
'new line'

**/.terraform/*  # игнорировать все вложенные каталоги в terraform

*.tfstate   #файл состояния terraform 
*.tfstate.* 

crash.log  # исключить файлы лога сбоев 
crash.*.log

*.tfvars       #исключить все файлы с расширением .tfvars 
*.tfvars.json  # исключить все файлы в которых могут содержать пароли ,
закрыте  ключи
 

override.tf
override.tf.json
*_override.tf
*_override.tf.json # исключить все файлы ссылающиеся на локальные файлы

.terraformrc  # исключить файлы конфигурации CLI
terraform.rc 
