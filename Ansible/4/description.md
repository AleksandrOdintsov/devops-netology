## Clichouse , Vector and Ligthouse  Ansible-Playbook
Данный playbook скачивает и устанавливает роли Clichouse , Vector и Ligthouse  на указанное в файле inventory окружения для 


ClickHouse — это колоночная аналитическая СУБД с открытым кодом, позволяющая выполнять аналитические запросы в режиме реального времени на структурированных больших данных

Vector — это высокопроизводительный конвейер данных наблюдения, который позволяет организациям контролировать свои данные логов.

LightHouse — это легкий графический интерфейс ClickHouse

Nginx - web сервер , необходимы для работы LightHouse 

## Версия ОС рабочих станций
Centos7
## Версия ПО и Теги
| Имя | Тег | Версия по умолчанию | 
| :-----:| :-----:|:-----:|
|Clickhouse |сlickhouse |21.1.9.41-2 |
|Vector|vector|0.21.1|
|LightHouse |ligthouse| laster |
|Nginx|nginx | laster|

можно указать нужную версию в дерриктории с названием роли после скачиванию 



## Работа Ролей 
### Clickhouse 
Download  distr  - скачивает дистрибутив clickhouse 
Install clickhouse packages - устанавилвает пакеты для клиента  сервара 
Create database - создает БД с таблицей 

### Vector  
Install Vector - устанавилвает дистрибутив  Vector
Config template - настроит vector используя файл конфигурации jinja2 из папки templates


### LightHouse
Install Lighthouse - устанавливает дистрибутив LightHouse с репозитория git указанного в переменных в group_vars
Lighthouse | Create ligthouse config - настроивает конфигурацию Lighthouse  по шаблону template файла lighthouse.conf.j2 

### Nginx
Install nginx - устанавилвает последнюю версию nginx 
NGINX | Create general config - настроивает конфигурацию Nginx по шаблону template файла nginx.conf.j2

