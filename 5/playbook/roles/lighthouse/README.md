Ligthouse
=========

This role can install Ligthouse and Nginx

Role Variables
--------------

|vars|description|
|-----|-----------|
|lighthouse_vcs | provide path to ligthouse from git|

Dependencies
------------
|Dependencies|description|
|-----|-----------|
|git |install git| 


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: ligthouse }

License
-------

MIT

Author Information
------------------

Aleksandr Odintsov 
