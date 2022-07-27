#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Tool to validate
# $network_name/custom_config_data/genesis.ssz

docker run --rm \
-v $SCRIPT_DIR/../custom_config_data:/data \
sigp/lighthouse lighthouse --testnet-dir="/data" beacon_node