Role Name kubernetesCore
========================

This is the core of the kubernetes deployment. This role should be deployed as a prerequisite before the user desires to deploy the Master of Worker nodes. All nodes that we are planning to deploy the k8s independently the character the user should run this configuration script.

Requirements
------------

Packages:

- [CRI-O](https://github.com/cri-o/cri-o)
- [conmon](https://github.com/containers/conmon)
- [cni](https://github.com/containernetworking/plugins)

Be aware that all packages are relevant to the k8s version. In vars we are defining / pulling the versions from Artifactory. The user need to keep up to date the variables / versions there. 

Role Variables
--------------

The core variables should be defnined in the vars file or the role.


Dependencies
------------

For this role there are no dependencies, all tasks are located in the role.

Example Playbook
----------------

Example on how to use the role:

    - hosts: servers
      roles:
        - kubernetesCore

License
-------

BSD

Author Information
------------------

Athanasios Garyfalos. Email: garyfalos@cpan.org
