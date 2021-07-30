Role Name kubernetesRbac
========================

This role is designed in order the user being able to create user - credentials (CAs) for users that we want to provide specific access to the kubernetes (k8s) cluster. The role will also create RBAC rules for the user.

Requirements
------------

The user needs to have root access to one of the k8s master nodes that we will be using in order to create the credentials and also being able to retrieve the k8s CAs from the dir.

Role Variables
--------------

This role is using variables in the default dir 'vars' but also pulls vars from the inventory files 'development / production'.

Dependencies
------------

This role does not have any dependencies but if the user desires to take a look on other k8s roles he / she can view the roles.

Example Playbook
----------------

Including an example of how to use the role:

    - hosts: servers
      remote_user: remote_user
      any_errors_fatal: true
      roles:
         - kubernetesRbac

Ansible Modules Used for CA(s)
------------------------------
* [community.crypto.openssl_csr](https://docs.ansible.com/ansible/latest/collections/community/crypto/openssl_csr_module.html?)
* [community.crypto.openssh_keypair](https://docs.ansible.com/ansible/latest/collections/community/crypto/openssh_keypair_module.html)
* [community.crypto.x509_certificate](https://docs.ansible.com/ansible/latest/collections/community/crypto/x509_certificate_module.html)

License
-------

BSD

Author Information
------------------

Athanasios Garyfalos. Email: garyfalos@cpan.org
