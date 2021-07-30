Role Name: createUser
=====================

This role is responsible for creating the user and populating ssh keys for this user (technicalUser).

Requirements
------------

Pre-requisites for this role is the user to have sudo access on the node(s). If the playbook is executed as it is defined the prerequisites will be met as the roles are using become (sudo) process.

Role Variables
--------------

Variables for this role are located in the inventories/<env>/hosts.yml. This role needs to have environment variables defined as they can be different from one environment to another.

Dependencies
------------

No dependencies for this role.

Example Playbook
----------------

`ansible-playbook -i inventories/development/hosts.yml -e ansible_user=<username> -e target_hosts=<target_hosts> roles/createUser/tasks/main.yml -v`

License
-------

BSD

Author Information
------------------

Athanasios Garyfalos. Email: garyfalos@cpan.org
