Role Name: Vault
================

This role will reach to [Vault (consul)](https://www.vaultproject.io/docs/configuration/storage/consul) and retrieve all the necessary files (CA / password). The role will collect the relevant information based on deployment environment. The role is using a token to connect to Vault. Token can be found also relevant links [Credentials in Development Environment](https://www.vaultproject.io/docs/configuration/storage/consul). Once the CA are retrieved from Vault the CA need to be decoded using the password also extracted from Vault. All these steps are applied through this role. 

Requirements
------------

No prerequicites for this roles it should be running directly.

Role Variables
--------------

Parameters required for this role as loaded from dir vars/main.yml and also from group vars relevant to the environment.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

CA Certificates
------------

All the certificates necessary for this role are copied from [Vault dev](https://www.vaultproject.io/docs/configuration/storage/consul). Different 

Example Playbook
----------------

`ansible-playbook -i inventories/development/hosts.yml -e ansible_user=<username> -e target_hosts=<target_hosts> roles/vault/tasks/main.yml -v`

License
-------

BSD

Author Information
------------------

Athanasios Garyfalos. Email: garyfalos@cpan.org
