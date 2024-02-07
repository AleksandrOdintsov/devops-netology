## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.
```
TASK [Print fact] *******************************************************************************************
ok: [localhost] => {
    "msg": 12
}
```
2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.
````
some_fact: all default fact
```
3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.
```
Redmi-Note-8-Pro:playbook aleksandrodincov$ docker ps
CONTAINER ID   IMAGE                      COMMAND           CREATED              STATUS              PORTS     NAMES
168a9e00a788   pycontribs/ubuntu:latest   "sleep 6000000"   About a minute ago   Up About a minute             ubuntu
ae7eedddf493   pycontribs/centos:7        "sleep 6000000"   2 minutes ago        Up 2 minutes                  centos7
```
4. Проведите запуск playbook на окружении из `prod.yml`. 
```
Redmi-Note-8-Pro:playbook aleksandrodincov$ ansible-playbook -i inventory/prod.yml site.yml
```
Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.
```
TASK [Print fact] *******************************************************************************************
ok: [centos7] => {
    "msg": "el"
}
ok: [ubuntu] => {
    "msg": "deb"
}
```
5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`
```
some_fact: "deb default fact`"
```
для `el` — `el default fact`.
```
some_fact: "el default fact"
```
6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.
```
TASK [Print fact] *******************************************************************************************
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact`"
}
```
7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.
```
Redmi-Note-8-Pro:playbook aleksandrodincov$ ansible-vault encrypt group_vars/deb/examp.yml 
New Vault password: 
Confirm New Vault password: 
Encryption successful
Redmi-Note-8-Pro:playbook aleksandrodincov$ ansible-vault encrypt group_vars/el/examp.yml 
New Vault password: 
Confirm New Vault password: 
Encryption successful
```
8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.
```
Redmi-Note-8-Pro:playbook aleksandrodincov$ ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass 
 
Vault password: 

PLAY [Print os facts] ***************************************************************************************

TASK [Gathering Facts] **************************************************************************************
ok: [ubuntu]
ok: [centos7]
```
9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. 
```
Redmi-Note-8-Pro:playbook aleksandrodincov$ ansible-doc -t connection -l
ansible.builtin.local          execute on controller                                                    
ansible.builtin.paramiko_ssh   Run tasks via python ssh (paramiko)                                      
ansible.builtin.psrp           Run tasks over Microsoft PowerShell Remoting Protocol                    
ansible.builtin.ssh            connect via SSH client binary 
```
Выберите подходящий для работы на `control node`.
```
community.docker.docker        Run tasks in docker containers 
```
10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.
```
local:
  hosts:
    localhost:
      ansible_connection: local
      ansible_host: localhost
```
11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.
```
TASK [Print fact] *******************************************************************************************
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact`"
}
ok: [localhost] => {
    "msg": "all default fact"
}
```
12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.

