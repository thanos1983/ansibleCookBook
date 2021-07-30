Role Name webSocket 
=========

This role is implemented for installing / configuring websocket / cockpit on the remote node(s).

Requirements
------------

Pre-requisites for this role is the user to have sudo access on the node(s). If the playbook is executed as it is defined the prerequisites will be met as the roles are using become (sudo) process.

Role Variables
--------------

The role uses the local variables located in vars/main.yml and also the inventory variables located in inventories/<environment variable>/group_vars/all.yml. The reason that we use also the inventory variables as well is to be able to differentiate them as production env connects to production vault to retrieve the SSL Certificates. The default port that we setup for the cockpit to listen is 4040 defined in the inventory (if not overrided localy).

Dependencies
------------

This role is calling in an Object Oriented way the vaul role in order to retrieve the SSL certificates for cockpit / websocket. Because of the hierarchy inheritance of variables (documented: [Ansible variable precedence](https://gist.github.com/ekreutz/301c3d38a50abbaad38e638d8361a89e)) we need to overide the default inventory variables locally on the default roles file vars/main.yml.

Example Playbook
----------------

`ansible-playbook -i inventories/development/hosts.yml -e ansible_user=<username> -e target_hosts=<target_hosts> roles/webSocket/tasks/main.yml -v`

License
-------

BSD

Author Information
------------------

Athanasios Garyfalos. Email: garyfalos@cpan.org
