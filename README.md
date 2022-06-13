# Testnet ansible files + Config

This repository is a minimal set of playbooks and inventories required to set up the merge devnets consisting of execution and
consensus nodes.

## General information

- General folder structure: All testnet relevant configs are under the testnet names. Generic config variables are set under
  `<name>-testnet/inventory/group_vars/all.yaml`. Client specific variables are set under e.g `<name>-testnet/inventory/group_vars/eth2client_xxxxxx.yaml`.
  The client specific variables also contains the commands used to start the docker image with.
- All the config files, `genesis.ssz` and other variables needed for the testnet are placed under `<name>-testnet/custom_config_data`.

## Instructions to join testnet

1. Clone this repository
2. Ensure `docker` and `docker-compose` is installed: `docker-compose --version` and `docker --version`
3. Change directories with `cd consensus-deployment-ansible/scripts/quick-run/<testnet-type>`
4. Create the required directories for persistent data with `mkdir -p execution_data beacon_data`
5. Find your IP address(public IP) and add it to the `<testnet-name>.vars` file file located in `consensus-deployment-ansible/scripts/quick-run/`, this is just to ensure easy peering  
   5.1 `curl ifconfig.me` or visit https://whatismyipaddress.com  
   5.2 Replace IP in config file with your own IP address: https://i.imgur.com/xnNqN6h.png
6. Run your chosen execution engine, e.g: `docker-compose --env-file <testnet-name>.vars -f docker-compose.geth.yml up -d`
7. Run your chosen consensus engine, e.g: `docker-compose --env-file <testnet-name>.vars -f docker-compose.lighthouse.yml up -d`
8. Check your logs to confirm that they are up and syncing, e.g `docker logs lighthouse_beacon -f --tail=20`
9. To stop the clients, run `docker-compose -f <insert file name you used earlier here> down`

## Alternative Instructions to join the Kintsugi testnet

- [ethstaker instructions to join Kintsugi](https://github.com/remyroy/ethstaker/blob/main/merge-devnet.md)

## Instructions for running ansible playbooks (Only works if you have access)

1. Clone this repository
2. Ensure `ansible` is installed
3. Make changes in the required variable, e.g: Change the `pithos-testnet/inventory/group_vars/eth1client_ethereumjs.yaml`
   with the new docker image or the `eth1_start_args` for commands to run the container with
4. The `update_execution_beacon_and_validator.yml` will stop the execution, beacon and validator containers and restart them
   with the new configurations specified as variables. Please use the `limit=eth1/2_xxxx` flag to limit the playbook execution to just update
   the nodes you have access to (otherwise it won't change the config on the others, but will show a lot of errors).
   Run this playbook with: `ansible-playbook -i pithos-testnet/inventory/inventory.ini playbooks/update_execution_beacon_and_validator.yml --limit=eth1client_ethereumjs`
5. If you just want to update an execution node without touching the other docker containers use the `tasks`, e.g to restart execution node with the new parameters use,

```bash
ansible-playbook -i pithos-testnet/inventory/inventory.ini playbooks/tasks/stop_execution_node.yml --limit=eth1client_ethereumjs
ansible-playbook -i pithos-testnet/inventory/inventory.ini playbooks/tasks/start_execution_node.yml --limit=eth1client_ethereumjs
```

## Instructions to deploy testnet

**1. Provision**

Provision instances and allocate hosts in `$testnet/inventory/inventory.ini`

**2. Setup hosts**

```yaml
# Setup name and keys
tasks/create_bootstrap_user_and_provision_machine.yml
# Setup the firewall rules for the machine
tasks/start_firewall.yml
# Setup the machine with docker, updates apt cache, adds user keys
tasks/setup_machine.yml
```

**3. Generate keys**

Create a mnemonic for the network at `$testnet/custom_config_data/mnemonics.yaml`:

```yaml
- mnemonic: "giant issue aisle success illegal bike spike question tent bar rely arctic volcano long crawl hungry vocal artwork sniff fantasy very lucky have athlete" # a 24 word BIP 39 mnemonic
  count: 1000
```

Create a CL genesis state with mnemonic by running:

```
cd $testnet

docker run -it -u $UID -v $PWD/custom_config_data:/data -v $PWD/custom_config_data/config.yaml:/config/cl/config.yaml -v $PWD/custom_config_data/mnemonics.yaml:/config/cl/mnemonics.yaml skylenet/ethereum-genesis-generator:latest cl

mv custom_config_data/cl/* custom_config_data/
```

Generate eth2 keys. Set correct offsets in `$testnet/generate_keys.sh`. Then run

```
./generate_keys.sh
```

(only for Clique and AuRa)

- Generate eth1 keys
- Generate eth1 genesis file

**4. Deploy bootnode(s)**

- Deploy regular Geth as eth1 bootnode
- Deploy Eth2 dedicated bootnode
- Grab their ENRs and enodes
- Write them to local files

**5. Deploy nodes**

```yaml
# Upload keys + config, then deploy EL + CL + snooper
tasks/setup_execution_and_consensus_full.yml
# Install node_exporter and metric pusher
tasks/setup_node_exporter_and_prometheus.yml
```

**6. Deploy tooling**

- Deploy eth1 explorer
- Deploy eth2 explorer
- Deploy ethstats
- Deploy faucet
- Deploy landing page
