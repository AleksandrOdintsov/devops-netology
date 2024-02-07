## Clichouse and Vector  Ansible-Playbook
Данный playbook скачивает и устанавливает Clichouse и Vector на укащанное в файле inventory окружения для 


ClickHouse — это колоночная аналитическая СУБД с открытым кодом, позволяющая выполнять аналитические запросы в режиме реального времени на структурированных больших данных

Vector — это высокопроизводительный конвейер данных наблюдения, который позволяет организациям контролировать свои данные логов.

## Версия ОС рабочих станций
Centos7
## Версия ПО
### Clickhouse 
версия 21.1.9.41-2 
можно указать нужную в group_vars\сlickhouse\vars.yml 

### Vector 
версия 0.21.1 
можно указать нужную в group_vars\vector\vars.yml 

## Работа Ansible-Playbook (Task)
### Clickhouse 
Download  distr  - скачивает дистрибутив clickhouse 
Install clickhouse packages - устанавилвает пакеты для клиента  сервара 
Create database - создает БД с таблицей 

### Vector  
Install Vector - устанавилвает дистрибутив  Vector
Config template - настроит vector используя файл конфигурации jinja2 из папки templates