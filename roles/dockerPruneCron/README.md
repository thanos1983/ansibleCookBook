Role Name dockerPruneCron 
=========

This role is implemented to add a cron job to apply `docker prune` on the remote node(s).

Requirements
------------

Pre-requisites for this role is the user to have sudo access on the node(s). If the playbook is executed as it is defined the prerequisites will be met as the roles are using become (sudo) process.

Role Variables
--------------

The role does not inherit any variables.

Dependencies
------------

No dependencies it can be used as standalone.

Example Playbook
----------------

`ansible-playbook -i inventories/development/hosts.yml --skip-tags bash -e ansible_user=<username> -e target_hosts=<target_hosts> roles/dockerPruneCron/tasks/main.yml -v`

License
-------

BSD

Author Information
------------------

Athanasios Garyfalos. Email: garyfalos@cpan.org
