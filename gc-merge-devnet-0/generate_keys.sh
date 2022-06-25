#!/bin/bash

MNEMONIC_FILEPATH="custom_config_data/mnemonics.yaml"

# Load YAML with python to be safe
VALIDATORS_MNEMONIC=$(python -c "import yaml;
print(yaml.safe_load(open('$MNEMONIC_FILEPATH').read())[0]['mnemonic'])
")


# Create directory before hand to allow container user to write keystores to it
rm -rf $PWD/validator_prep
mkdir -p $PWD/validator_prep
chmod -R g+w $PWD/validator_prep

function prep_group {
  let group_base=$1
  validators_source_mnemonic="$2"
  let offset=$3
  let keys_to_create=$4
  naming_prefix="$5"
  validators_per_host=$6
  echo "Group base: $group_base $naming_prefix"
  
  for (( i = 0; i < keys_to_create; i++ )); do
    let node_index=group_base+i
    let offset_i=offset+i
    let validators_source_min=offset_i*validators_per_host
    let validators_source_max=validators_source_min+validators_per_host

    echo "writing keystores for host $naming_prefix-$node_index: $validators_source_min - $validators_source_max"

    docker run --rm --entrypoint=eth2-val-tools -u $UID -v $PWD/validator_prep:/validator_prep skylenet/ethereum-genesis-generator keystores \
    --insecure \
    --prysm-pass="prysm" \
    --out-loc="/validator_prep/$naming_prefix-$node_index" \
    --source-max="$validators_source_max" \
    --source-min="$validators_source_min" \
    --source-mnemonic="$validators_source_mnemonic"
  done
}

# group_base = 1
# mnemonic = $VALIDATORS_MNEMONIC
# offset = 0
# keys_to_create = 15
# naming_prefix = "merge-devnet-0-lighthouse-geth"
# validators_per_host
prep_group 1 "$VALIDATORS_MNEMONIC" 0 8 "merge-devnet-0-lighthouse-nethermind" 100
