# Chiado testnet

- TTD: `70560951604725799783765358597051456327101440`. Projected for Aug 15th ~16h UTC (207360 blocks)
- Conensus layer genesis: `1660132800` Aug 10 2022 12:00:00 GMT+0000
- Altair fork: epoch 90 (2h after CL genesis)
- Bellatrix fork: epoch 180 (4h after CL genesis)

```yaml
genesis_time: 1660132800
genesis_state_root: 0x71eb8c2b9d7ad58733bfdd1008e7a35f70303833f1ac308fd53d1b4799f15db7
genesis_validators_count: 70000

eth1_data:
  deposit_root: 0xd70a234731285c6804c2a4f56711ddb8c82c99740f207854891028af34e27e5e
  deposit_count: 0
  block_hash: 0x203e164cf3b6f6765abf2f0355a4d09e5eaf6a777243bc4407b569431cd95cb3
```

All config files available [here](chiado/custom_config_data)

Consensus layer files:

- [nethermind_genesis.json](chiado/custom_config_data/nethermind_genesis.json)
- [bootnodes_execution.txt](chiado/custom_config_data/bootnodes_execution.txt)

Execution layer files:

- [config.yaml](chiado/custom_config_data/config.yaml)
- [chiado/custom_config_data/genesis.ssz](chiado/custom_config_data/genesis.ssz)
- [bootnodes_consensus.txt](chiado/custom_config_data/bootnodes_consensus.txt)

# Guides to run clients

Execution clients

- [gnosischain/nethermind-client](https://github.com/gnosischain/nethermind-client)

Consensus clients

- [gnosischain/lighthouse-client](https://github.com/gnosischain/lighthouse-client)
- [gnosischain/lodestar-client](https://github.com/gnosischain/lodestar-client)
- [gnosischain/prysm-client](https://github.com/gnosischain/prysm-client)
- [gnosischain/teku-client](https://github.com/gnosischain/teku-client)

# Key distribution

Keystores already part of the genesis state will be distribute **on demand** to anyone that requests them. To request:

- Fill out this simple form https://forms.gle/42tBLFW6HzAqLQ74A or [long link](https://docs.google.com/forms/d/e/1FAIpQLSeWfYgWagVBIOeEwn36VO3xm1LYIaL_29oYzf-_071LO6nJXg/viewform?usp=sf_link)
- Reach out, DM [@dapplion](https://twitter.com/dapplion) on twitter
- Join DAppNode discord ([invite](https://discord.gg/c28an8dA5k)) and request in the #gnosis-beacon-chain channel
- Join Gnosis Chain discord ([invite](https://discord.com/invite/3CtNAqVMRV)) and request there

| Index range   | mnemonic           | first    | hosts, clients                    |
| ------------- | ------------------ | -------- | --------------------------------- |
| 00000 - 10000 | chiado_mnemonic_00 | multiply | external - Stakewise              |
| 10000 - 20000 | chiado_mnemonic_01 | pilot    | external - Stakewise              |
| 20000 - 30000 | chiado_mnemonic_02 | arctic   | -                                 |
| 30000 - 40000 | chiado_mnemonic_03 | discover | -                                 |
| 40000 - 50000 | chiado_mnemonic_04 | sentence | -                                 |
| 50000 - 60000 | chiado_mnemonic_05 | rural    | -                                 |
| 60000 - 61000 | chiado_mnemonic_06 | clerk    | external - Stakewise              |
| 61000 - 62000 | chiado_mnemonic_07 | region   | external - Stakewise              |
| 62000 - 63000 | chiado_mnemonic_08 | situate  | -                                 |
| 63000 - 64000 | chiado_mnemonic_09 | carry    | -                                 |
| 64000 - 65000 | chiado_mnemonic_10 | remove   | -                                 |
| 65000 - 66000 | chiado_mnemonic_11 | unknown  | -                                 |
| 66000 - 67000 | chiado_mnemonic_12 | rice     | -                                 |
| 67000 - 68000 | chiado_mnemonic_13 | borrow   | -                                 |
| 68000 - 69000 | chiado_mnemonic_14 | amount   | external - Open distr by dapplion |
| 69000 - 70000 | chiado_mnemonic_15 | jump     | external - Open distr by DAppNode |
