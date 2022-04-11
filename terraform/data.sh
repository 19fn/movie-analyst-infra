#!/bin/bash

# Vars
# CHANGE THIS
key="id_rsa"
ips="ips"
user="fcadmin"

tf_key()
{
	terraform output -raw tls_private_key
}

tf_ip()
{
	terraform output -json public_ip_address
}

tf_resource_group()
{
	terraform output resource_group_name
}

if [ -f ${key} ]; then
	rm -f ${key}
fi

if [ -f ${ips} ]; then
	rm -f ${ips}
fi

echo -ne "\n[>] Downloading data ..."
rg=$(tf_resource_group)
tf_key > ${key} && chmod 400 ${key}
tf_ip > ${ips}
ip=$(cat ${ips} | cut -d'"' -f2)
ssh_connect="ssh -i ${key} ${user}@${ip}"
echo
echo "[+] RESOURCE GROUP: ${rg}"
echo "[+] ID_RSA: '${PWD}/id_rsa'"
echo "[+] IP: '${PWD}/ips'"
echo "[+] CONNECT: ${ssh_connect}"
echo 
