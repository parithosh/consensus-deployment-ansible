#!/bin/bash

docker run --entrypoint=eth2-testnet-genesis \
-v $PWD/denver/custom_config_data:/data \
skylenet/ethereum-genesis-generator phase0 \
--eth1-block 0x0000000000000000000000000000000000000000000000000000000000000000 \
--timestamp 1658260800 \
--config /data/config.yaml \
--mnemonics /data/mnemonics.yaml \
--tranches-dir /data/tranches \
--state-output /data/genesis.ssz