#!/usr/bin/env bash
# set -x
# set -e

function error() {
  echo "'${1-parameter}' failed with exit code $? in function '${FUNCNAME[1]}' at line ${BASH_LINENO[0]}" &&
    exit 1
}

function deploy() {

  bamboo_env=${bamboo_env:="dev"}
  bamboo_ansible_tags=${bamboo_ansible_tags:="ping"}
  bamboo_vault_token=${bamboo_vault_token:="myToken"}
  bamboo_ansible_user=${bamboo_ansible_user:="tinyos"}
  bamboo_ansible_skip_tags=${bamboo_ansible_skip_tags:="never"}
  bamboo_target_hosts_group=${bamboo_target_hosts_group:="local"}
  bamboo_ansible_password=${bamboo_ansible_password:="technicalPassword"}

  case "${bamboo_env}" in
  "dev")
    bamboo_inventory_file="inventories/development/hosts.yml"
    ;;
  "pre-prod")
    bamboo_inventory_file="inventories/preproduction/hosts.yml"
    ;;
  "prod")
    bamboo_inventory_file="inventories/production/hosts.yml"
    ;;
  *)
    echo "Unknown environment [${bamboo_env}] have to be either dev or prod"
    exit 1
    ;;
  esac

  echo "HOSTS TO DEPLOY TO ${bamboo_inventory_file} environment is ${bamboo_env}"

  if [ -z ${bamboo_inventory_file} ]; then
    echo "Target hosts group not defined. Exit!!!"
    exit 1
  elif [ -z ${bamboo_target_hosts_group} ]; then
    echo "Bamboo target hosts group is not defined. Exit!!!"
    exit 1
  elif [ -z ${bamboo_ansible_user} ]; then
    echo "Bamboo ansible user is not defined. Exit!!!"
    exit 1
  else
    ansible-playbook \
      -i ${bamboo_inventory_file} \
      --tags ${bamboo_ansible_tags} \
      --skip-tags ${bamboo_ansible_skip_tags} \
      -e env_variable=${bamboo_env} \
      -e token=${bamboo_vault_token} \
      -e ansible_user=${bamboo_ansible_user} \
      -e target_hosts=${bamboo_target_hosts_group} \
      -e ansible_ssh_pass=${bamboo_ansible_password} \
      deploy.yml -v || error "deploy"
  fi

}

deploy
