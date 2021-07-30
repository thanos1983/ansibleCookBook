Role Name (consul)
=========

This role is intended to automate the instalation / configurations of the consul client / server for development (dev) and production (prod) environment (env). The difference between dev / prod env is the consul server nodes that the client will be connecting to push / retrieve information from.

Requirements
------------

The node that the script will be launched needs to have ansible installed locally and also the user should have root access (sudo) to the remote nodes. Also the script is designed based on the prencible that ssh-keys have already being exchanged and ssh connection is password less from the localhost to the remote node(s).

Role Variables
--------------

This role is using the local vars in role and also inventory based on environment variables. The role variables can be found at roles/consulClient/vars/main.yml. The environment inventory variables can vary for (dev / prod) and can be found in relevant paths e.g. (inventories/development/group_vars/all.yml). This playbook is also loading the global variables from the ansible.cfg file but those variables are related to the ansible configurations and not related to the role.

Dependencies
------------

Vault role will pull the CA certificates for dev / prod environment from Vault. Since I do not have access to the dev/ prod consult server nodes I can not see the configurations so I can not prepare the CAs, but I prepared a demo role that can dynamically be reused by other roles. The variables should be used on each role in order to overide the inventory default variables.

Example Playbook
----------------

```bash
ansible-playbook \
	-i inventories/development/hosts.yml
	-e ansible_user=<user> \
	-e target_hosts=<host group> \
	deploy.yml -v
```

Roles Tasks
----------------

This playbook has 5 subtasks under the main task:

	- oldConsulConf.yml
	- vault.yml
	- install.yml
	- agent.yml
	- service.yml

`oldConsulConf.yml`: Zip and remove the old consul dir that contains configurations / data.
`vault.yml`: Retrieves the CA (sensitive information) to be used between client / server communication.
`install.yml`: Creates the necessary directories, retrieves and deploys tha consul binary from Artifactory and also copies the general-info.sh script
`agent.yml`: Loads the configuration file based on the environment parameters and also copies the CA certificates (if exist) to the remote node expected location for SSL verification.
`service.yml`: Creates the consul.service based on the environment parameters. Enables and restarts the service.


Tokens
------

How to retrieve, update, delete process tokens etc through the API. Official documentation [ACL System in Legacy Mode](https://www.consul.io/docs/security/acl/acl-legacy)

```bash
# List all Tokens
curl --request PUT --header "X-Consul-Token: 57b1ed6e-b03a-416e-93cd-f50b0207f695" -s http://127.0.0.1:8500/v1/acl/list | jq .[]

# Agent Token
curl --request PUT --header "X-Consul-Token: 57b1ed6e-b03a-416e-93cd-f50b0207f695" --data '{"Name": "Agent Token", "Type": "client","Rules": "node \"\" { policy = \"write\" } service \"\" { policy = \"write\" } key \"\" { policy = \"write\" }"}' http://127.0.0.1:8500/v1/acl/create

# UI Token
curl --request PUT --header "X-Consul-Token: 57b1ed6e-b03a-416e-93cd-f50b0207f695" --data '{"Name": "UI Token", "Type": "client", "Rules": "key \"\" { policy = \"write\" } node \"\" { policy = \"read\" } service \"\" { policy = \"read\" }"}' http://127.0.0.1:8500/v1/acl/create

# Anonymous Token
curl --request PUT --header "X-Consul-Token: 57b1ed6e-b03a-416e-93cd-f50b0207f695" --data '{"ID": "anonymous", "Type": "client", "Rules": "node \"\" { policy = \"read\" }"}' http://127.0.0.1:8500/v1/acl/update

# Anonymous Token Update
curl --request PUT --header "X-Consul-Token: 57b1ed6e-b03a-416e-93cd-f50b0207f695" --data '{"ID": "anonymous", "Type": "client", "Rules": "node \"\" { policy = \"read\" } service \"consul\" { policy = \"read\" }"}' http://127.0.0.1:8500/v1/acl/update

curl -H "X-Consul-Namespace: *" http://127.0.0.1:8500/v1/health/node/<hostname>
```

License
-------

BSD

Author Information
------------------

Athanasios Garyfalos. Email: garyfalos@cpan.org
