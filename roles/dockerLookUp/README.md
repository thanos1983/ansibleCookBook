Role Name dockerLookUp
======================

This role is implemented to run docker commands and lookup the relevant information to docker daemon. The information that we would like to fetch are the following:

	- Ansible Version
	- Docker Version
	- Docker Storage Driver
	- Docker Root Dir
	- Which volume group owns the Docker Root Dir 

Requirements
------------

Pre-requisites for this role is the user to have sudo access on the node(s). If the playbook is executed as it is defined the prerequisites will be met as the roles are using become (sudo) process. The role has the ability to either run the commands using the pip docker package or the docker-client commands from the command line (on remote host).

Role Variables
--------------

The role does not inherit any variables.

Dependencies
------------

No dependencies apart from the pip package if the user chooses to use it. Alternatively the user needs to use the tag ansible (as skipping tag).

Example Playbook
----------------

The role has two tasks located in roles/dockerLookUp/tasks/main.yml file. One is using the docker pip package (through Ansible) and the other for using the docker client commands on the remote system. The user should use the --skip-tags flag to avoid using the other. For example:

ansible-playbook -i inventories/development/hosts.yml --skip-tags bash -e ansible_user=<username> -e target_hosts=<target_hosts> roles/dockerLookUp/tasks/main.yml -v

```bash
- name: include ansible
  include_tasks: ansible.yml
  tags: [ ansible ]

- name: include bash
  include_tasks: bash.yml
  tags: [ bash ]
```

License
-------

BSD

Author Information
------------------

Athanasios Garyfalos. Email: garyfalos@cpan.org
