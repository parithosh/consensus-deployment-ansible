
testnet ?= 

ifeq ($(testnet), "")
$(error you should provide a target testnet);
endif

reboot-execution:
	ansible-playbook --limit=execution -i $(PWD)/$(testnet)/inventory/inventory.ini -e @$(PWD)/$(testnet)/inventory/group_vars/secrets.yaml --ask-vault-pass $(PWD)/playbooks/tasks/start_execution_node.yml