sshping
=======

The role is installing the sshping package ans also add the man page.

Requirements
------------

The only requirement is that the user should have sudo access on the remote hosts that is planned to be install the package.

Role Variables
--------------

All variables are inherited from the default var file in the role.

Dependencies
------------

No other role dependecy.

Example Playbook
----------------

`ansible-playbook -i inventories/development/hosts.yml -e ansible_user=<username> -e target_hosts=<target_hosts> roles/sshping/tasks/main.yml -v`

License
-------

BSD

Author Information
------------------

Athanasios Garyfalos. Email: garyfalos@cpan.org
