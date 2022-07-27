#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Tool to validate
# $network_name/custom_config_data/genesis.ssz

docker run --rm --network host \
-v /home/lion/Code/gnosischain/consensus-deployment-ansible/denver/custom_config_data:/data \
sigp/lighthouse lighthouse --testnet-dir="/data" beacon_node \
  --http --http-address=0.0.0.0 --http-port=4000