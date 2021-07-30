Role Name: addPipConf
=====================

This role is implemented for adding the pip conf file.

Requirements
------------

Pre-requisites for this role is the user to have sudo access on the node(s). If the playbook is executed as it is defined the prerequisites will be met as the roles are using become (sudo) process.

Role Variables
--------------

Variables for this role are located in the files/pip.conf of the current role. This role does not have any global variables defined.

Dependencies
------------

No dependencies for this role.

Example Playbook
----------------

`ansible-playbook -i inventories/development/hosts.yml -e ansible_user=<username> -e target_hosts=<target_hosts> roles/addRepo/tasks/main.yml -v`

License
-------

BSD

Author Information
------------------

Athanasios Garyfalos. Email: garyfalos@cpan.org
