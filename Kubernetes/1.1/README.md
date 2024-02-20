[Домашнее задание "Kubernetes. Причины появления. Команда kubectl"](https://github.com/netology-code/kuber-homeworks/blob/main/1.1/1.1.md?plain=1)

### Задание 1. Установка MicroK8S

1. Установить MicroK8S на локальную машину или на удалённую виртуальную машину.

<p align="center">
  <img width="" height="" src="./scr/1.png">
</p>

2. Установить dashboard.

<p align="center">
  <img width="" height="" src="./scr/2.png">
</p>

3. Сгенерировать сертификат для подключения к внешнему ip-адресу.
Добавлям внешний ip-адрес для подкючения 

<p align="center">
  <img width="" height="" src="./scr/3.png">
</p>

перевыпускаем сертификаты

<p align="center">
  <img width="" height="" src="./scr/4.png">
</p>

------

### Задание 2. Установка и настройка локального kubectl
1. Установить на локальную машину kubectl.

<p align="center">
  <img width="" height="" src="./scr/5.png">
</p>

<p align="center">
  <img width="" height="" src="./scr/6.png">
</p>

2. Настроить локально подключение к кластеру.

Берем  сертификаты из конфигурации microk8s

<p align="center">
  <img width="" height="" src="./scr/7.png">
</p>

Упаковываем сетификаты в файлы

<p align="center">
  <img width="" height="" src="./scr/8.png">
</p>

Создаем конфигурацию для kuberctl

<p align="center">
  <img width="" height="" src="./scr/9.png">
</p>

Проверяем подключени к кластеру 

<p align="center">
  <img width="" height="" src="./scr/14.png">
</p>

3. Подключиться к дашборду с помощью port-forward.

 Запускаем port-forward
 <p align="center">
  <img width="" height="" src="./scr/10.png">
</p>

Узнаем , где у нас лежит токен для подключения к дашборду

 <p align="center">
  <img width="" height="" src="./scr/11.png">
</p>

Забераем токен для входа в дашборд

 <p align="center">
  <img width="" height="" src="./scr/12.png">
</p>

Логинимся по токену в дашборд 

 <p align="center">
  <img width="" height="" src="./scr/13.png">
</p>
------

