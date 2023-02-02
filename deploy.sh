#!/usr/bin/env bash
# set -x
# set -e

function error() {
  echo "'${1-parameter}' failed with exit code $? in function '${FUNCNAME[1]}' at line ${BASH_LINENO[0]}" &&
    exit 1
}

function deploy() {

  env=${env:="dev"}
  ansible_tags=${ansible_tags:="ping"}
  vault_token=${vault_token:="myToken"}
  ansible_user=${ansible_user:="tinyos"}
  ansible_skip_tags=${ansible_skip_tags:="never"}
  target_hosts_group=${target_hosts_group:="local"}
  ansible_password=${ansible_password:="technicalPassword"}

  case "${env}" in
  "dev")
    inventory_file="inventories/development/hosts.yml"
    ;;
  "pre-prod")
    inventory_file="inventories/preproduction/hosts.yml"
    ;;
  "prod")
    inventory_file="inventories/production/hosts.yml"
    ;;
  *)
    echo "Unknown environment [${env}] have to be either dev or prod"
    exit 1
    ;;
  esac

  echo "HOSTS TO DEPLOY TO ${inventory_file} environment is ${env}"

  if [ -z ${inventory_file} ]; then
    echo "Target hosts group not defined. Exit!!!"
    exit 1
  elif [ -z ${target_hosts_group} ]; then
    echo "Bamboo target hosts group is not defined. Exit!!!"
    exit 1
  elif [ -z ${ansible_user} ]; then
    echo "Bamboo ansible user is not defined. Exit!!!"
    exit 1
  else
    if [ ${target_hosts_group} = "local" ]; then
      ansible-playbook \
        -i ${inventory_file} \
        --tags ${ansible_tags} \
        --skip-tags ${ansible_skip_tags} \
        -e env_variable=${env} \
        -e token=${vault_token} \
        -e ansible_user=${ansible_user} \
        -e target_hosts=${target_hosts_group} \
        -e ansible_ssh_pass=${ansible_password} \
        --connection=local \
        deploy.yml -v || error "deploy"
    else
      ansible-playbook \
        -i ${inventory_file} \
        --tags ${ansible_tags} \
        --skip-tags ${ansible_skip_tags} \
        -e env_variable=${env} \
        -e token=${vault_token} \
        -e ansible_user=${ansible_user} \
        -e target_hosts=${target_hosts_group} \
        -e ansible_ssh_pass=${ansible_password} \
        deploy.yml -v || error "deploy"
    fi
  fi

}

deploy
