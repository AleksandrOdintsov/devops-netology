## Основная часть

1. Подготовьте свой inventory-файл `prod.yml`.
```
clickhouse:
  hosts:
    centos7:
      ansible_connection: docker
vector:
  hosts:
    vector:
      ansible_connection: docker
```
2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2.
```
- name: Install Vector
  hosts: vector
  tasks:
    - name: Get Vector distrib
      ansible.builtin.get_url: 
        url: "https://packages.timber.io/vector/{{ vector_version }}/vector-{{ vector_version }}-1.x86_64.rpm"
        dest: "./vector-{{ vector_version }}-1.x86_64.rpm"
    - name: Install vector packages
      become: true
      ansible.builtin.yum:
        name:
        - ./vector-{{ vector_version }}-1.x86_64.rpm
        state: present
    - name : Config template
      ansible.builtin.template:
        src: vector.j2
        dest: vector.yml
        mode: "0644"
        owner: "{{ ansible_user_id }}"
        group: "{{ ansible_user_gid }}"
        validate: vector validate --no-environment --config-yaml %s
```
3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.

4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.
5. Запустите `ansible-lint site.yml` 
```
Redmi-Note-8-Pro:playbook aleksandrodincov$ ansible-lint site.yml
WARNING  Listing 8 violation(s) that are fatal
name[missing]: All tasks should be named.
site.yml:11 Task/Handler: block/always/rescue 

fqcn[action-core]: Use FQCN for builtin module actions (meta).
site.yml:32 Use `ansible.builtin.meta` or `ansible.legacy.meta` instead.

jinja[spacing]: Jinja2 spacing could be improved: create_db.rc != 0 and create_db.rc !=82 -> create_db.rc != 0 and create_db.rc != 82 (warning)
site.yml:34 Jinja2 template rewrite recommendation: `create_db.rc != 0 and create_db.rc != 82`.

risky-file-permissions: File permissions unset or incorrect.
site.yml:44 Task/Handler: Get Vector distrib

yaml[trailing-spaces]: Trailing spaces
site.yml:45

yaml[indentation]: Wrong indentation: expected 10 but found 8
site.yml:52

yaml[colons]: Too many spaces before colon
site.yml:54

yaml[new-line-at-end-of-file]: No new line character at the end of file
site.yml:59

Read documentation for instructions on how to ignore specific rule violations.

                       Rule Violation Summary                        
 count tag                           profile    rule associated tags 
     1 jinja[spacing]                basic      formatting (warning) 
     1 name[missing]                 basic      idiom                
     1 yaml[colons]                  basic      formatting, yaml     
     1 yaml[indentation]             basic      formatting, yaml     
     1 yaml[new-line-at-end-of-file] basic      formatting, yaml     
     1 yaml[trailing-spaces]         basic      formatting, yaml     
     1 risky-file-permissions        safety     unpredictability     
     1 fqcn[action-core]             production formatting           

Failed: 7 failure(s), 1 warning(s) on 1 files. Last profile that met the validation criteria was 'min'.
```
и исправьте ошибки, если они есть.
```
Redmi-Note-8-Pro:playbook aleksandrodincov$ ansible-lint site.yml
WARNING  Listing 1 violation(s) that are fatal
jinja[spacing]: Jinja2 spacing could be improved: create_db.rc != 0 and create_db.rc !=82 -> create_db.rc != 0 and create_db.rc != 82 (warning)
site.yml:35 Jinja2 template rewrite recommendation: `create_db.rc != 0 and create_db.rc != 82`.

Read documentation for instructions on how to ignore specific rule violations.

              Rule Violation Summary               
 count tag            profile rule associated tags 
     1 jinja[spacing] basic   formatting (warning) 

Passed: 0 failure(s), 1 warning(s) on 1 files. Last profile that met the validation criteria was 'min'.
Redmi-Note-8-Pro:playbook aleksandrodincov$ 
```

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
```
TASK [Create database] *********************************************************************************************
skipping: [centos7]

PLAY [Install Vector] **********************************************************************************************

TASK [Gathering Facts] *********************************************************************************************
ok: [vector]

TASK [Get Vector distrib] ******************************************************************************************
ok: [vector]

TASK [Install vector packages] *************************************************************************************
ok: [vector]

TASK [Config template] *********************************************************************************************
ok: [vector]

PLAY RECAP *********************************************************************************************************
centos7                    : ok=3    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
vector                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
```
TASK [Flush handlers] **********************************************************************************************

TASK [Create database] *********************************************************************************************
ok: [centos7]

PLAY [Install Vector] **********************************************************************************************

TASK [Gathering Facts] *********************************************************************************************
ok: [vector]

TASK [Get Vector distrib] ******************************************************************************************
ok: [vector]

TASK [Install vector packages] *************************************************************************************
ok: [vector]

TASK [Config template] *********************************************************************************************
ok: [vector]

PLAY RECAP *********************************************************************************************************
centos7                    : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
vector                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook).


10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.
