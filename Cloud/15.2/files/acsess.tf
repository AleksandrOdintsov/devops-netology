# Создаем сервисный аккаунт для  Object Storage
resource "yandex_iam_service_account" "srvac" {
  name = "srvac"
}
# Назначаем роли сервисному аккаунту для работы с Object Storage
resource "yandex_resourcemanager_folder_iam_member" "srvac-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.srvac.id}"
}

# Создаем статический ключ доступа
resource "yandex_iam_service_account_static_access_key" "srvac-static-key" {
  service_account_id = yandex_iam_service_account.srvac.id
  description        = "static access key for object storage"
}

# Создаем сервисный аккаунт для работы Instance Group 
resource "yandex_iam_service_account" "srvac-ig" {
  name = "srvac-ig"
}

# Назначение роли сервисному аккаунту для работы с Instance Group 
resource "yandex_resourcemanager_folder_iam_member" "srvac-ig-editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.srvac-ig.id}"
}