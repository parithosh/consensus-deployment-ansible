#!/bin/bash

# Note: Must add --timestamp 9999999
# Matching the one in chiado/custom_config_data/config.yaml

docker run --entrypoint=eth2-testnet-genesis \
-v $PWD/chiado/custom_config_data:/data \
skylenet/ethereum-genesis-generator phase0 \
--eth1-block 0x0000000000000000000000000000000000000000000000000000000000000000 \
--timestamp 1660132800 \
--config /data/config.yaml \
--mnemonics /data/mnemonics.yaml \
--tranches-dir /data/tranches \
--state-output /data/genesis.ssz