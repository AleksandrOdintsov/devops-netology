## Задача 1

Создать собственный образ  любой операционной системы (например, ubuntu-20.04) с 
помощью Packer 
([инструкция](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/packer-quickstart))

Для получения зачета вам необходимо предоставить скриншот страницы с созданным образом 
из личного кабинета YandexCloud.

## Ответ 1

<p align="center">
  <img width="1200" height="600" src="./5.4/5.4.1.png">
</p>

## Задача 2

**2.1.** Создайте вашу первую виртуальную машину в YandexCloud с помощью web-интерфейса 
YandexCloud.        

**2.2.*** **(Необязательное задание)**      
Создайте вашу первую виртуальную машину в YandexCloud с помощью Terraform (вместо 
использования веб-интерфейса YandexCloud).
Используйте Terraform-код в директории 
([src/terraform](https://github.com/netology-group/virt-homeworks/tree/virt-11/05-virt-04-docker-compose/src/terraform)).

Чтобы получить зачёт, вам нужно предоставить вывод команды terraform apply и страницы 
свойств, созданной ВМ из личного кабинета YandexCloud.

## Ответ 2.1

<p align="center">
  <img width="1200" height="600" src="./5.4/5.4.2.png">
</p> 

## Ответ 2.2

```
Terraform used the selected providers to generate the following execution 
plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_instance.node01 will be created
  + resource "yandex_compute_instance" "node01" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = "node01.netology.cloud"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-ed25519 
AAAAC3NzaC1lZDI1NTE5AAAAIHuz1IzMPicCiMQVtPWUFNjqmWeiR3BEOxkExmjr5CQ5 
aleksandrodincov@Redmi-Note-8-Pro.local
            EOT
        }
      + name                      = "node01"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd84rn4bs1kka282sgkc"
              + name        = "root-node01"
              + size        = 50
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 8
          + memory        = 8
        }
    }

  # yandex_vpc_network.default will be created
  + resource "yandex_vpc_network" "default" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "net"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_subnet.default will be created
  + resource "yandex_vpc_subnet" "default" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "192.168.101.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + external_ip_address_node01_yandex_cloud = (known after apply)
  + internal_ip_address_node01_yandex_cloud = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_vpc_network.default: Creating...
yandex_vpc_network.default: Creation complete after 1s 
[id=enp974pl9hcrd4qsc2p3]
yandex_vpc_subnet.default: Creating...
yandex_vpc_subnet.default: Creation complete after 1s 
[id=e9b71etrea5on4icufdn]
yandex_compute_instance.node01: Creating...
yandex_compute_instance.node01: Still creating... [10s elapsed]
yandex_compute_instance.node01: Still creating... [20s elapsed]
yandex_compute_instance.node01: Still creating... [30s elapsed]
yandex_compute_instance.node01: Still creating... [40s elapsed]
yandex_compute_instance.node01: Still creating... [50s elapsed]
yandex_compute_instance.node01: Creation complete after 56s 
[id=fhmqipfamlj4pbu9d13q]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:

external_ip_address_node01_yandex_cloud = "158.160.97.161"
internal_ip_address_node01_yandex_cloud = "192.168.101.17"
```
## Задача 3

С помощью Ansible и Docker Compose разверните на виртуальной машине из предыдущего 
задания систему мониторинга на основе Prometheus/Grafana.
Используйте Ansible-код в директории 
([src/ansible](https://github.com/netology-group/virt-homeworks/tree/virt-11/05-virt-04-docker-compose/src/ansible)).

Чтобы получить зачёт, вам нужно предоставить вывод команды "docker ps" , все 
контейнеры, описанные в 
[docker-compose](https://github.com/netology-group/virt-homeworks/blob/virt-11/05-virt-04-docker-compose/src/ansible/stack/docker-compose.yaml),  
должны быть в статусе "Up".


## Ответ 3

```
[centos@node01 ~]$ sudo docker ps
CONTAINER ID   IMAGE                              COMMAND                  CREATED          
STATUS                    PORTS                                                                              
NAMES
b2af4549a27d   grafana/grafana:7.4.2              "/run.sh"                26 minutes 
ago   Up 26 minutes             3000/tcp                                                                           
grafana
86ce1ef53b43   stefanprodan/caddy                 "/sbin/tini -- caddy…"   26 minutes 
ago   Up 26 minutes             0.0.0.0:3000->3000/tcp, 
0.0.0.0:9090-9091->9090-9091/tcp, 0.0.0.0:9093->9093/tcp   caddy
e9020e49b9d9   prom/pushgateway:v1.2.0            "/bin/pushgateway"       26 minutes 
ago   Up 26 minutes             9091/tcp                                                                           
pushgateway
2328464aeb33   prom/node-exporter:v0.18.1         "/bin/node_exporter …"   26 minutes 
ago   Up 26 minutes             9100/tcp                                                                           
nodeexporter
7df87ea3dbdb   gcr.io/cadvisor/cadvisor:v0.47.0   "/usr/bin/cadvisor -…"   26 minutes 
ago   Up 26 minutes (healthy)   8080/tcp                                                                           
cadvisor
c67c44278a34   prom/prometheus:v2.17.1            "/bin/prometheus --c…"   26 minutes 
ago   Up 26 minutes             9090/tcp                                                                           
prometheus
64fbd2f76f1b   prom/alertmanager:v0.20.0          "/bin/alertmanager -…"   26 minutes 
ago   Up 26 minutes             9093/tcp                                                                           
alertmanager
[centos@node01 ~]$ 
```
## Задача 4

1. Откройте веб-браузер, зайдите на страницу http://<внешний_ip_адрес_вашей_ВМ>:3000.
2. Используйте для авторизации логин и пароль из 
[.env-file](https://github.com/netology-group/virt-homeworks/blob/virt-11/05-virt-04-docker-compose/src/ansible/stack/.env).
3. Изучите доступный интерфейс, найдите в интерфейсе автоматически созданные 
docker-compose-панели с 
графиками([dashboards](https://grafana.com/docs/grafana/latest/dashboards/use-dashboards/)).
4. Подождите 5-10 минут, чтобы система мониторинга успела накопить данные.

## Ответ 4

<p align="center">
  <img width="1200" height="600" src="./5.4/5.4.4.png">
</p>

