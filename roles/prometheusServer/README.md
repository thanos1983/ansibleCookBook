Role Name prometheusServer
==========================

This role deploys the Prometheus Server on "n+1" amount of nodes. The role is also downloading from consul vault the necessary CAs for https communication between Server and Client.

Requirements
------------

Requirements is the node to have installed Ansible with Python3 and latest version of pip packages (docker and hvac). Also in order to create hash token for users to login the node requires the package "httpd-tools".

Role Variables
--------------

Variables are on the role var file.

Dependencies
------------

No dependencies.

Example Playbook
----------------

`ansible-playbook -i inventories/development/hosts.yml -e ansible_user=<username> -e target_hosts=<target_hosts> roles/prometheusServer/tasks/main.yml -v`

Extra Notes
-----------

In order to add extra htpasswd for other users we can produce it like this:

```bash
$ htpasswd -nBC 10 "" | tr -d ':\n'
New password:
Re-type new password:
$2y$10$WcRSWpBkYGNrqbc.onQ3ke6bIJCnX2VGmwVdZzXUTzuWn9vb3BIFq
```

We have added a demo user/password "technicalUser/technicalUser" for demo purposes. The extra users needed to be added on the template located `web-config.yml.j2`.

More information from the official GitHub page: [prometheus/exporter-toolkit/docs/web-configuration.md](https://github.com/prometheus/exporter-toolkit/blob/master/docs/web-configuration.md#about-bcrypt)

Importand Note
--------------
The url that Prometheus is listening and routed through the NGINX proxy needs to be synced with the repo: [thanos1983/proxyMonitoring](https://github.com/thanos1983/proxyMonitoring)

License
-------

BSD

Author Information
------------------

Athanasios Garyfalos. Email: garyfalos@cpan.org
