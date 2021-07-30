Role Name kubernetesUpgrade 
===========================

A brief description of the role goes here.

Requirements
------------

The role will install / update the following packages:

- kubelet
- kubeadm
- kubectl

Also the user should have installed the following pip package in either python2 / python3:

```bash
sudo -H python -m pip install jmespath --upgrade # Python2
sudo -H python3 -m pip install jmespath --upgrade # Python3
```

As a next step the role will list the images that k8s expects to have in order to launch the pods e.g.:

```bash
$ kubeadm config images list --kubernetes-version=v1.19.6
k8s.gcr.io/kube-apiserver:v1.19.6
k8s.gcr.io/kube-controller-manager:v1.19.6
k8s.gcr.io/kube-scheduler:v1.19.6
k8s.gcr.io/kube-proxy:v1.19.6
k8s.gcr.io/pause:3.2
k8s.gcr.io/etcd:3.4.13-0
k8s.gcr.io/coredns:1.7.0
```

The script will query the repo for if it containes the images. If any of the images is not uploaded in Artifactory then it will be downloaded locally taged and pushed to the repo e.g.:

```bash
$ kubeadm config images list --image-repository rmy.private.docker.domain --kubernetes-version=v1.19.6
rmy.private.docker.domain/kube-apiserver:v1.19.6
rmy.private.docker.domain/kube-controller-manager:v1.19.6
rmy.private.docker.domain/kube-scheduler:v1.19.6
rmy.private.docker.domain/kube-proxy:v1.19.6
rmy.private.docker.domain/pause:3.2
rmy.private.docker.domain/etcd:3.4.13-0
rmy.private.docker.domain/coredns:1.7.0
```

Role Variables
--------------

All variables related with this role are located in the roles/kubernetesUpgrade/vars/main.yml file.

Dependencies
------------

No dependencies for this role.

Example Playbook
----------------

`ansible-playbook -i inventories/development/hosts.yml -e ansible_user=<username> -e target_hosts=<target_hosts> roles/addRepo/tasks/main.yml -v`

License
-------

BSD

Author Information
------------------

Athanasios Garyfalos. Email: garyfalos@cpan.org
