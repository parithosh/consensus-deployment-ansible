# Chiado testnet

Chiado testnet is meant to prepare the staking community of the Gnosis Beacon Chain for the upcoming merge.

- TTD: `70560951604725799783765358597051456327101440`. Projected for Aug 15th ~16h UTC (207360 blocks)
- Conensus layer genesis: `1660132800` Aug 10 2022 12:00:00 GMT+0000, root `0x71eb8c2b9d7ad58733bfdd1008e7a35f70303833f1ac308fd53d1b4799f15db7`
- Altair fork: epoch 90 (2h after CL genesis)
- Bellatrix fork: epoch 180 (4h after CL genesis)

# How to run a staking validator

All existing guides for running validators in Ethereum merge testnets apply.

## Pre-bundled clients

We have bundled the Chiado genesis and config files into custom docker images so you don't have to worry about importing them. Check repo's below for dockerhub image tags + guides and how configure them

Execution clients

- [gnosischain/nethermind-client](https://github.com/gnosischain/nethermind-client)

Consensus clients

- [gnosischain/lighthouse-client](https://github.com/gnosischain/lighthouse-client)
- [gnosischain/lodestar-client](https://github.com/gnosischain/lodestar-client)
- [gnosischain/prysm-client](https://github.com/gnosischain/prysm-client)
- [gnosischain/teku-client](https://github.com/gnosischain/teku-client)

## DAppNode Packages

Execution clients

- Nethermind ([repo](https://github.com/dappnode/DAppNodePackage-Chiado-Nethermind)) - install link http://my.dappnode/#/installer/%2Fipfs%2FQmZ38eZ2yWUndyUf4xwzDQChMkcN7D55peiR3dfVcvHnnY

Consensus clients

- Lighthouse ([repo](https://github.com/dappnode/DAppNodePackage-lighthouse-chiado)) - install link http://my.dappnode/#/installer/%2Fipfs%2FQmSHWFcsanJUCKGwJb3FYuygtu2wVkGmwXY2CQDs2mHX67
- Teku ([repo](https://github.com/dappnode/DAppNodePackage-teku-chiado)) - install link http://my.dappnode/#/installer/%2Fipfs%2FQmPGjRAyAsLPNM1jrpu1kQxj6gcRy5aDLw8jcnxNQSuThD

Web3Signer package to add keys

- Web3Signer ([repo](https://github.com/dappnode/DAppNodePackage-web3signer-chiado)) - install link http://my.dappnode/#/installer/%2Fipfs%2FQmQ3nAB7zKAsjZzf5cN6kg8Xm1upzyQbnFyW8oqLRwUYyE

## Getting staking keys

Keystores already part of the genesis state will be distribute **on demand** to anyone that requests them. To request:

- Fill out this simple form https://forms.gle/42tBLFW6HzAqLQ74A or [long link](https://docs.google.com/forms/d/e/1FAIpQLSeWfYgWagVBIOeEwn36VO3xm1LYIaL_29oYzf-_071LO6nJXg/viewform?usp=sf_link)
- Reach out, DM [@dapplion](https://twitter.com/dapplion) on twitter
- Join DAppNode discord ([invite](https://discord.gg/c28an8dA5k)) and request in the #gnosis-beacon-chain channel
- Join Gnosis Chain discord ([invite](https://discord.com/invite/3CtNAqVMRV)) and request there

| Index range   | mnemonic           | first    | hosts, clients                                                           |
| ------------- | ------------------ | -------- | ------------------------------------------------------------------------ |
| 00000 - 10000 | chiado_mnemonic_00 | multiply | external - Stakewise                                                     |
| 10000 - 20000 | chiado_mnemonic_01 | pilot    | external - Stakewise                                                     |
| 20000 - 30000 | chiado_mnemonic_02 | arctic   | external - Kleros.io                                                     |
| 30000 - 40000 | chiado_mnemonic_03 | discover | external - Gateway                                                       |
| 40000 - 50000 | chiado_mnemonic_04 | sentence | local - chiado-lighthouse-nethermind-{00:09}                             |
| 50000 - 60000 | chiado_mnemonic_05 | rural    | local - chiado-prysm-nethermind-{00:09}                                  |
| 60000 - 61000 | chiado_mnemonic_06 | clerk    | external - Stakewise                                                     |
| 61000 - 62000 | chiado_mnemonic_07 | region   | external - Stakewise                                                     |
| 62000 - 63000 | chiado_mnemonic_08 | situate  | local - denver-teku-nethermind-00                                        |
| 63000 - 64000 | chiado_mnemonic_09 | carry    | local - denver-teku-nethermind-01                                        |
| 64000 - 65000 | chiado_mnemonic_10 | remove   | local - denver-teku-nethermind-02                                        |
| 65000 - 66000 | chiado_mnemonic_11 | unknown  | local - denver-teku-nethermind-03                                        |
| 66000 - 67000 | chiado_mnemonic_12 | rice     | local - denver-teku-nethermind-04                                        |
| 67000 - 68000 | chiado_mnemonic_13 | borrow   | local - denver-lodestar-nethermind-00                                    |
| 68000 - 69000 | chiado_mnemonic_14 | amount   | external - Open distr by dapplion / \*else denver-lodestar-nethermind-00 |
| 69000 - 70000 | chiado_mnemonic_15 | jump     | external - Open distr by DAppNode / \*else denver-lodestar-nethermind-01 |

_\*else: keys not assigned already in the open distribution_

# Testnet data

```yaml
genesis_time: 1660132800
genesis_state_root: 0x71eb8c2b9d7ad58733bfdd1008e7a35f70303833f1ac308fd53d1b4799f15db7
genesis_validators_count: 70000

eth1_data:
  deposit_root: 0xd70a234731285c6804c2a4f56711ddb8c82c99740f207854891028af34e27e5e
  deposit_count: 0
  block_hash: 0x0000000000000000000000000000000000000000000000000000000000000000
```

All config files available [here](custom_config_data)

Consensus layer files:

- [config.yaml](custom_config_data/config.yaml)
- [genesis.ssz](custom_config_data/genesis.ssz)
- [bootnodes_consensus.txt](custom_config_data/bootnodes_consensus.txt)

Execution layer files:

- [nethermind_genesis.json](custom_config_data/nethermind_genesis.json)
- [bootnodes_execution.txt](custom_config_data/bootnodes_execution.txt)
