##Задача 1

Дайте письменые ответы на вопросы:

* В чём отличие режимов работы сервисов в Docker Swarm-кластере: replication и global?
* Какой алгоритм выбора лидера используется в Docker Swarm-кластере?
* Что такое Overlay Network?

##Ответ 1

Дайте письменые ответы на вопросы:
* В чём отличие режимов работы сервисов в Docker Swarm-кластере: replication и global?

global - запускает одну задачу на каждом кластере , в replication сервисе надо указать сколько идентичных задач надо запустить 

* Какой алгоритм выбора лидера используется в Docker Swarm-кластере?

Алгоритм поддержания распределенного консенсуса — Raft  .это алгоритм заключается в том что как между нодами идет постоянные опрос на доступность лидера , если лидер не доступен  то идет пересогласование , по такому же принципу (кто первый) отправлением запросов между нодами , и назначается новый лидер 

* Что такое Overlay Network?

Логическая сеть создаваемая поверх  другой сети .Пример VPN , работающий поверх сети интернет 



##Задача 2
Создайте ваш первый Docker Swarm-кластер в Яндекс Облаке.

Чтобы получить зачёт, предоставьте скриншот из терминала (консоли) с выводом команды:

```
docker node ls
```



##Ответ 2
```
[centos@node01 ~]$ sudo docker node ps
ID             NAME                                                          IMAGE                                          NODE                 DESIRED STATE   CURRENT STATE            ERROR     PORTS
ylacio42pmu1   swarm_monitoring_caddy.1                                      stefanprodan/caddy:latest                      node01.netology.yc   Running         Running 6 minutes ago              
5mzi3p9kddhl    \_ swarm_monitoring_caddy.1                                  stefanprodan/caddy:latest                      node01.netology.yc   Shutdown        Complete 6 minutes ago             
ejuncgu4fapk   swarm_monitoring_cadvisor.hzl7s1nzq4tbhzsyodfv117ye           google/cadvisor:latest                         node01.netology.yc   Running         Running 6 minutes ago              
j5f8wmrfmimq   swarm_monitoring_dockerd-exporter.hzl7s1nzq4tbhzsyodfv117ye   stefanprodan/caddy:latest                      node01.netology.yc   Running         Running 6 minutes ago              
lg3856sj2kkp   swarm_monitoring_node-exporter.hzl7s1nzq4tbhzsyodfv117ye      stefanprodan/swarmprom-node-exporter:v0.16.0   node01.netology.yc   Running         Running 6 minutes ago              
smqnxs3bhmjs   swarm_monitoring_prometheus.1                                 stefanprodan/swarmprom-prometheus:v2.5.0       node01.netology.yc   Running         Running 6 minutes ago              
[centos@node01 ~]$

```
##Задача 3
Создайте ваш первый, готовый к боевой эксплуатации кластер мониторинга, состоящий из стека микросервисов.

Чтобы получить зачёт, предоставьте скриншот из терминала (консоли), с выводом команды:
```
docker service ls
```

##Ответ 3

```
[centos@node01 ~]$ sudo docker service ls
ID             NAME                                MODE         REPLICAS   IMAGE                                          PORTS
9pqnof7b7f4c   swarm_monitoring_alertmanager       replicated   1/1        stefanprodan/swarmprom-alertmanager:v0.14.0    
m205p0k3zg0h   swarm_monitoring_caddy              replicated   1/1        stefanprodan/caddy:latest                      *:3000->3000/tcp, *:9090->9090/tcp, *:9093-9094->9093-9094/tcp
tudluzqbwqqh   swarm_monitoring_cadvisor           global       6/6        google/cadvisor:latest                         
ma76uja8qk39   swarm_monitoring_dockerd-exporter   global       6/6        stefanprodan/caddy:latest                      
soyeq234eq5t   swarm_monitoring_grafana            replicated   1/1        stefanprodan/swarmprom-grafana:5.3.4           
dzm8vrgz4v5y   swarm_monitoring_node-exporter      global       6/6        stefanprodan/swarmprom-node-exporter:v0.16.0   
s2kyddgoru7z   swarm_monitoring_prometheus         replicated   1/1        stefanprodan/swarmprom-prometheus:v2.5.0       
9ueaviorwop6   swarm_monitoring_unsee              replicated   1/1        cloudflare/unsee:v0.8.0                        
[centos@node01 ~]$ 
```

##Задача 4 (*)

Выполните на лидере Docker Swarm-кластера команду, указанную ниже, и дайте письменное описание её функционала — что она делает и зачем нужна:

```
# см.документацию: https://docs.docker.com/engine/swarm/swarm_manager_locking/
docker swarm update --autolock=true
```
##Ответ 4 

команда включает автоблокировку swarm при запуске Docker и сообщает нам ключ для ручной разблакировки
по умолчанию при запуске Docker в память кажого узла загружается ключ TLC , если мы выполняем  docker swarm update --autolock=true  , то получаем ключ в ручном режиме и при следующем перезапуске docker запросит разблокироваку в ручном режиме 
