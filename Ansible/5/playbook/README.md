### Molecule

1. Запустите  `molecule test -s centos_7` внутри корневой директории clickhouse-role, посмотрите на вывод команды. Данная команда может отработать с ошибками, это нормально. Наша цель - посмотреть как другие в реальном мире используют молекулу.
2. Перейдите в каталог с ролью vector-role и создайте сценарий тестирования по умолчанию при помощи `molecule init scenario --driver-name docker`.
3. Добавьте несколько разных дистрибутивов (centos:8, ubuntu:latest) для инстансов и протестируйте роль, исправьте найденные ошибки, если они есть.
4. Добавьте несколько assert в verify.yml-файл для  проверки работоспособности vector-role (проверка, что конфиг валидный, проверка успешности запуска и др.). 
```
    - name: Check vector service
      assert:
        that: vector_pid.stdout != 0
        success_msg: "Service is running"
        fail_msg: "Service not running"

    - name: Check vector config
      assert:
        that: valid_config.rc == 0
        success_msg: "Config valid"
        fail_msg: "Config not valid "
```
5. Запустите тестирование роли повторно и проверьте, что оно прошло успешно.
```
TASK [vector : Configure Service | Template systemd unit] **********************
changed: [ubuntu]
changed: [centos8]

TASK [vector : Vector template] ************************************************
changed: [ubuntu]
changed: [centos8]

TASK [vector : Flush handlers] *************************************************

TASK [vector : Flush handlers] *************************************************

TASK [vector : Vector config validate] *****************************************
changed: [centos8]
changed: [ubuntu]

TASK [vector : Check vector process PID] ***************************************
changed: [ubuntu]
changed: [centos8]

PLAY RECAP *********************************************************************
centos8                    : ok=8    changed=7    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0
ubuntu                     : ok=8    changed=7    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0
```
5. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

### Tox

1. Добавьте в директорию с vector-role файлы из [директории](./example).
2. Запустите `docker run --privileged=True -v <path_to_repo>:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash`, где path_to_repo — путь до корня репозитория с vector-role на вашей файловой системе.
3. Внутри контейнера выполните команду `tox`, посмотрите на вывод.
```
Redmi-Note-8-Pro:vector aleksandrodincov$ docker run --privileged=True -v /Users/aleksandrodincov/devops-netology/5/playbook/roles/vector:/opt/vec
tor-role -w /opt/vector-role -it aragast/netology:latest /bin/bash
[root@5bcd86d7c6c3 vector-role]# tox
py37-ansible210 create: /opt/vector-role/.tox/py37-ansible210
py37-ansible210 installdeps: -rtox-requirements.txt, ansible<3.0
py37-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==1.0.0,ansible-lint==5.1.3,arrow==1.2.3,bcrypt==4.0.1,binaryornot==0.4.4,bracex==2.3.post1,cached-property==1.5.2,Cerberus==1.3.5,certifi==2023.7.22,cffi==1.15.1,chardet==5.2.0,charset-normalizer==3.2.0,click==8.1.7,click-help-colors==0.9.2,cookiecutter==2.3.1,cryptography==41.0.4,distro==1.8.0,enrich==1.2.7,idna==3.4,importlib-metadata==6.7.0,Jinja2==3.1.2,jmespath==1.0.1,lxml==4.9.3,markdown-it-py==2.2.0,MarkupSafe==2.1.3,mdurl==0.1.2,molecule==3.5.2,molecule-podman==1.1.0,packaging==23.1,paramiko==2.12.0,pathspec==0.11.2,pluggy==1.2.0,pycparser==2.21,Pygments==2.16.1,PyNaCl==1.5.0,python-dateutil==2.8.2,python-slugify==8.0.1,PyYAML==5.4.1,requests==2.31.0,rich==13.5.3,ruamel.yaml==0.17.32,ruamel.yaml.clib==0.2.7,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,tenacity==8.2.3,text-unidecode==1.3,typing_extensions==4.7.1,urllib3==2.0.5,wcmatch==8.4.1,yamllint==1.26.3,zipp==3.15.0
py37-ansible210 run-test-pre: PYTHONHASHSEED='3044157154'
py37-ansible210 run-test: commands[0] | molecule test -s compatibility --destroy always
CRITICAL 'molecule/compatibility/molecule.yml' glob failed.  Exiting.
ERROR: InvocationError for command /opt/vector-role/.tox/py37-ansible210/bin/molecule test -s compatibility --destroy always (exited with code 1)
py37-ansible30 create: /opt/vector-role/.tox/py37-ansible30
py37-ansible30 installdeps: -rtox-requirements.txt, ansible<3.1
^CERROR: got KeyboardInterrupt signal
____________________________________________________________________ summary _____________________________________________________________________
ERROR:   py37-ansible210: commands failed
ERROR:   py37-ansible30: keyboardinterrupt
ERROR:   py39-ansible210: undefined
ERROR:   py39-ansible30: undefined
[root@5bcd86d7c6c3 vector-role]# 
```
5. Создайте облегчённый сценарий для `molecule` с драйвером `molecule_podman`. Проверьте его на исполнимость.
6. Пропишите правильную команду в `tox.ini`, чтобы запускался облегчённый сценарий.
```
commands =
    {posargs:molecule -vvv test -s light}
```
8. Запустите команду `tox`. Убедитесь, что всё отработало успешно.
```
GKILL\"",
    "stderr_lines": [
        "time=\"2023-09-27T13:20:47Z\" level=warning msg=\"StopSignal SIGTERM failed to stop container ubuntu in 10 seconds, resorting to SIGKILL\""
    ],
    "stdout": "21167a8e586bc487e1189d6bb39141567b970cf7ecc243eb9e6bdcaaf31f44f4",
    "stdout_lines": [
        "21167a8e586bc487e1189d6bb39141567b970cf7ecc243eb9e6bdcaaf31f44f4"
    ]

META: ran handlers
META: ran handlers

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
```
9. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

После выполнения у вас должно получится два сценария molecule и один tox.ini файл в репозитории. Не забудьте указать в ответе теги решений Tox и Molecule заданий. В качестве решения пришлите ссылку на  ваш репозиторий и скриншоты этапов выполнения задания. 
