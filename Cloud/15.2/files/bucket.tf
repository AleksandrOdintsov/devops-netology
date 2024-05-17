resource "yandex_storage_bucket" "odinsov160524" {
  access_key    = yandex_iam_service_account_static_access_key.srvac-static-key.access_key
  secret_key    = yandex_iam_service_account_static_access_key.srvac-static-key.secret_key
  bucket        = "odinsov160524"
  acl           = "public-read"
  force_destroy = "true"
}

# Создаем обьект в корзине
resource "yandex_storage_object" "image-object" {
  access_key    = yandex_iam_service_account_static_access_key.srvac-static-key.access_key
  secret_key    = yandex_iam_service_account_static_access_key.srvac-static-key.secret_key
  bucket        = "odinsov160524"
  acl           = "public-read"
  key           = "test.jpeg"
  source        = "~/devops-netology/Cloud/15.2/scr/test.jpeg"
  depends_on    = [yandex_storage_bucket.odinsov160524]
}