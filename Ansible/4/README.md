1. Создайте в старой версии playbook файл `requirements.yml` и заполните его содержимым:


2. При помощи `ansible-galaxy` скачайте себе эту роль.
3. Создайте новый каталог с ролью при помощи `ansible-galaxy role init vector-role`.
4. На основе tasks из старого playbook заполните новую role. Разнесите переменные между `vars` и `default`. 
5. Перенести нужные шаблоны конфигов в `templates`.
6. Опишите в `README.md` обе роли и их параметры. Пример качественной документации ansible role [по ссылке](https://github.com/cloudalchemy/ansible-prometheus).
7. Повторите шаги 3–6 для LightHouse. Помните, что одна роль должна настраивать один продукт.
8. Выложите все roles в репозитории. 
[Lighthouse role](https://github.com/AleksandrOdintsov/ansible-lighthouse-role)
[Clickhouse role](https://github.com/AleksandrOdintsov/ansible-clickhouse-role)
[Vector role](https://github.com/AleksandrOdintsov/ansible-vector-role/tree/master)
Проставьте теги, используя семантическую нумерацию. Добавьте roles в `requirements.yml` в playbook.
   ```
---
- name: clickhouse
  src: git@github.com:AleksandrOdintsov/ansible-clickhouse-role.git
  scm: git
  version: "master"

- name: vector
  src: git@github.com:AleksandrOdintsov/ansible-vector-role.git
  scm: git
  version: "master"

- name: lighthouse
  src: git@github.com:AleksandrOdintsov/ansible-lighthouse-role.git
  scm: git
  version: "master"

   ```

9. Переработайте playbook на использование roles. Не забудьте про зависимости LightHouse и возможности совмещения `roles` с `tasks`.
```
---
- name: Install Lighthouse
  hosts: lighthouse
  roles:
    - lighthouse

- name: Install Clickhouse
  hosts: clickhouse
  roles:
    - clickhouse

- name: Install Vector
  hosts: vector
  roles:
    - vector
```
10. Выложите playbook в репозиторий.
11. В ответе дайте ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.