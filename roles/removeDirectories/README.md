Role Name: removeDirectories
=========

This role is responsible for removing all directories defined by the user.

Requirements
------------

Pre-requisites for this role is the user to have sudo access on the node(s). If the playbook is executed as it is defined the prerequisites will be met as the roles are using become (sudo) process.

Role Variables
--------------

Variables for this role are located in the vars/main.yml of the current role. This role does not have any global variables defined.

Dependencies
------------

A list of other roles hosted on this playbook:

      - update
      - addRepo
      - addPipConf
      - docker
      - dockerDaemonOperations
      - installPackages
      - installPipPackages
      - removeUser
      - removeDirectories
      - createUser
      - createDirectories
      - logicalVolumeManagement

Variables that are used from other roles are always stored in vars/main.yml file on each role.

Example Playbook
----------------

Example of how the role is called through the playbook. The variables passed in as parameters are coming from Bamboo plan or through the deploy.sh script:

  - hosts: "{{ target_hosts }}"
    remote_user: "{{ ansible_user }}"
    any_errors_fatal: true
    order: sorted

    pre_tasks:
      - name: Validate we run with the correct Ansible version
        assert:
          that:
            - ansible_version is defined
            - ansible_version.full is version('2.8.0.0', '>=')
        run_once:   True

    roles:
      - update
      - addRepo
      - addPipConf
      - docker
      - dockerDaemonOperations
      - installPackages
      - installPipPackages
      - removeUser
      - removeDirectories
      - createUser
      - createDirectories
      - logicalVolumeManagement

License
-------

BSD

Author Information
------------------

Athanasios Garyfalos. Email: garyfalos@cpan.org
