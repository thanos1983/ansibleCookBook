AnsibleCookBook
===============

## Table of contents
* [General info](#general-info)
* [Roles](#roles)
* [Group Vars](#group-vars)
* [Technologies](#technologies)
* [Setup](#setup)
* [Virtualenv](#virtualenv)

## General info

This project was created with scope to minimize the human interaction / configurations on the new / old nodes. We have decided to extend the roles to do much more than simply deploy and configuring new nodes.
The following tasks can be applied through this playbook:

	- dockerLookUp
	- addRepo
	- addPipConf
	- dockerPruneCron
	- installPackages
	- removeUser
	- removeDirectories
	- createUser
	- changeDirOwnership
	- changeGroupID
	- logicalVolumeManagementK8s
	- logicalVolumeManagement
	- kubernetesCore
	- kubernetesUpgrade
	- kubernetesMaster
	- kubernetesSecondaryMaster
	- kubernetesWorker
	- kubernetesIngress
	- kubernetesDemos
	- kubernetesDestroy
	- minio
	- activeUiRbac
	- activeUiBackEnd
	- activeUiFrontEnd
	- activeUiRestApi
	- consul
	- vault
	- haproxy
	- sshping
	- webSocket

## Roles

The user who intents to use this playbook he / she needs to configure / choose the right parameters. Sample of deployment script:

```bash
ansible-playbook \
	-i ${bamboo_inventory_file} \
	--tags ${bamboo_ansible_tags} \
	--skip-tags ${bamboo_ansible_skip_tags} \
	-e env_variable=${bamboo_env} \
	-e token=${bamboo_vault_token} \
	-e ansible_user=${bamboo_ansible_user} \
	-e target_hosts=${bamboo_target_hosts_group} \
	deploy.yml -v || error "deploy"
```

`-i ${bamboo_inventory_file}` Is the file that the playbook will load where the playbook will deploy towards these hosts.
`--tags ${bamboo_ansible_tags}` This is the variable where the user chooses which role wants to execute towards the hosts from the inventory (e.g. dev / pre-prod / prod).
`--skip-tags ${bamboo_ansible_skip_tags}` Is a variable that the user should not change as it is used in variety of roles. It is recommended the user to follow the preconfigured string.
`-e env_variable=${bamboo_env}` This is the variable that defines the environment (e.g. dev / pre-prod / prod) that the user wish to use in order to deploy towards the hosts that he / she desires.
`-e token=${bamboo_vault_token}` This variable that the playbook will use to connect to the HashiCorp vault to retrieve the key / values based on the path that will used from the role.
`-e ansible_user=${bamboo_ansible_user}` This is the variable that defines the user that the script will use to ssh to the remote hosts. Usually on most roles on this playbook the user needs to have sudo access.
`-e target_hosts=${bamboo_target_hosts_group}` This variable defines the group of nodes to be provisioned.

### Example

The most common usage of the script is when the user wants to provision / depoloy towards new or existing set of nodes.

For example if the user wants to update the packages of an existing group of nodes the user needs to choose the tag as (e.g. `bamboo_ansible_tags=${bamboo_ansible_tags:="old"`). If the user wants to provision a new set of nodes then the variable tag needs to be set to new (e.g. `bamboo_ansible_tags=${bamboo_ansible_tags:="new"`).

## Group Vars

On this project we have common group vars for all groups. So all group vars should be common indepently the group. For more information: [Alternative Directory Layout](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#alternative-directory-layout)

## Technologies

Project is created with:
* Ansible version: 2.11.3
* Python version: 3.9.5
	
## Setup

To run this project, prerequicites are Python and Ansible. Also is required to have already exchange ssh keys with all destination nodes. Alternatively the user need to add the ssh password in the bash script "deploy.sh". To run the project simply cd in the dir that you have clone it and run:

```
$ ./deploy.sh
```

## Virtualenv

The user has the ability to run the script even if there is no ansible installed on the node (reccommended way). This can be done by applying the following commands in sequence:

```bash
# Launch virtualenv
cd project_folder e.g # test
$ virtualenv -p /usr/bin/python3.6 venv # path to what ever binary we have of python 
$ source venv/bin/activate
$ python3 -m pip install ansible hvac k8s openshift -U
$ deactivate # to deactivate
$ rm -rf test # remove test dir
```
