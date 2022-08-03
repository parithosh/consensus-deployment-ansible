
testnet ?= 

ifeq ($(testnet), "")
$(error you should provide a target testnet);
endif

reboot-execution:
	ansible-playbook --limit=execution -i $(PWD)/$(testnet)/inventory/inventory.ini -e @$(PWD)/$(testnet)/inventory/group_vars/secrets.yaml --ask-vault-pass $(PWD)/playbooks/tasks/start_execution_node.yml

view-secrets: 
	ansible-vault view $(PWD)/$(testnet)/inventory/group_vars/secrets.yaml

edit-secrets: 
	ansible-vault edit $(PWD)/$(testnet)/inventory/group_vars/secrets.yaml

view-root-secrets: 
	ansible-vault view $(PWD)/secrets.yaml

edit-root-secrets: 
	ansible-vault edit $(PWD)/secrets.yaml