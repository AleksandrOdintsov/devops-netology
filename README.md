## Задача 1

- Опишите основные преимущества применения на практике IaaC-паттернов.
- Какой из принципов IaaC является основополагающим?


 ## Ответ 1 

- Опишите основные преимущества применения на практике IaaC-паттернов.

Непрерывная интеграции

разработка ПО , при котором сливаются рабочие ветки в основную , частичная 
сборка проекта 

Непрерывная доставка

Можно выкатывать изменения небольшими частями ,и в случае неполадок , 
откататься на старые версии 

Непрерывное развёртывание
 
Автоматизация процесса развертывания , что экономит время 

- Какой из принципов IaaC является основополагающим?

Индемпатентность - унифицированное свойство , позволяющее получать 
ожидаемый результат от выполнения операции

## Задача 2

- Чем Ansible выгодно отличается от других систем управление 
конфигурациями?
- Какой, на ваш взгляд, метод работы систем конфигурации более надёжный — 
push или pull?

 ## Ответ 2

- Чем Ansible выгодно отличается от других систем управление 
конфигурациями?

Низкий пирог входа , нет необходимости устанавливать агента 

- Какой, на ваш взгляд, метод работы систем конфигурации более надёжный — 
push или pull?

 Push т.к. потому что мы можем центролезованно накатывать конфигурации по 
образу 

Например;
В Ansible это происходит по хостам заданных в HOSTS 

## Задача 3

Установите на личный компьютер:

- [VirtualBox](https://www.virtualbox.org/),
- [Vagrant](https://github.com/netology-code/devops-materials),
- [Terraform](https://github.com/netology-code/devops-materials/blob/master/README.md),
- Ansible.

*Приложите вывод команд установленных версий каждой из программ, 
оформленный в Markdown.*

 ## Ответ 2

- [VirtualBox](https://www.virtualbox.org/),

7.0.8r156879

- [Vagrant](https://github.com/netology-code/devops-materials),

Vagrant 2.3.7

- [Terraform](https://github.com/netology-code/devops-materials/blob/master/README.md),

Terraform v1.5.2
on darwin_amd64

- Ansible.

ansible [core 2.15.1]
  config file = None
  configured module search path = 
['/Users/aleksandrodincov/.ansible/plugins/modules', 
'/usr/share/ansible/plugins/modules']
  ansible python module location = 
/usr/local/Cellar/ansible/8.1.0/libexec/lib/python3.11/site-packages/ansible
  ansible collection location = 
/Users/aleksandrodincov/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.11.4 (main, Jun 20 2023, 16:51:49) [Clang 14.0.0 
(clang-1400.0.29.202)] 
(/usr/local/Cellar/ansible/8.1.0/libexec/bin/python3.11)
  jinja version = 3.1.2
  libyaml = True

## Задача 4 

Воспроизведите практическую часть лекции самостоятельно.

- Создайте виртуальную машину.
- Зайдите внутрь ВМ, убедитесь, что Docker установлен с помощью команды
```
docker ps,
```
Vagrantfile из лекции и код ansible находятся в 
[папке](https://github.com/netology-code/virt-homeworks/tree/virt-11/05-virt-02-iaac/src).

Примечание. Если Vagrant выдаёт ошибку:
```
URL: ["https://vagrantcloud.com/bento/ubuntu-20.04"]     
Error: The requested URL returned error: 404:
```

выполните следующие действия:

1. Скачайте с [сайта](https://app.vagrantup.com/bento/boxes/ubuntu-20.04) 
файл-образ "bento/ubuntu-20.04".
2. Добавьте его в список образов Vagrant: "vagrant box add 
bento/ubuntu-20.04 <путь к файлу>".


## Ответ 4 
```
vagrant@server1:~$ sudo docker ps

CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

vagrant@server1:~$ sudo docker version

Client: Docker Engine - Community
 Version:           24.0.2
 API version:       1.43
 Go version:        go1.20.4
 Git commit:        cb74dfc
 Built:             Thu May 25 21:52:13 2023
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Engine - Community
 Engine:
  Version:          24.0.2
  API version:      1.43 (minimum version 1.12)
  Go version:       go1.20.4
  Git commit:       659604f
  Built:            Thu May 25 21:52:13 2023
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.21
  GitCommit:        3dce8eb055cbb6872793272b4f20ed16117344f8
 runc:
  Version:          1.1.7
  GitCommit:        v1.1.7-0-g860f061
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```
