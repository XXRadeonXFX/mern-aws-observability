cd ../terraform
terraform apply -auto-approve


cd ../ansible
ansible-playbook -i inventory/hosts.ini site.yml