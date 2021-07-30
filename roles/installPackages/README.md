Role Name: installPackages
=========

This role is implemented for installing the latest version of yum package(s).

Requirements
------------

Pre-requisites for this role is the user to have sudo access on the node(s). If the playbook is executed as it is defined the prerequisites will be met as the roles are using become (sudo) process.

Role Variables
--------------

Variables for this role are located in the vars/main.yml of the current role. This role does not have any global variables defined.

Dependencies
------------

The role must be run only with python interpreter default to the package manager of the node. For example if we are modifying nodes and we use the yum package we can only use Python 2 as interpreter. If we want to modify nodes with dnf module then we can only use Python 3 as interpreter. The role is able to understand which OS version is running on the remote node so it will use the relevant module (e.g. yum.yml or dnf.yml).

Example Playbook
----------------

`ansible-playbook -i inventories/development/hosts.yml -e ansible_user=<username> -e target_hosts=<target_hosts> roles/installPackages/tasks/main.yml -v`

License
-------

BSD

Author Information
------------------

Athanasios Garyfalos. Email: garyfalos@cpan.org
