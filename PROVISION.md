# Provision

Instructions for provisioning hosts efficiently with Digital Ocean

### Setup tool

Install tool: https://docs.digitalocean.com/reference/doctl/how-to/install/

Go get an API token with write permissions in the UI (bottom right corner) https://cloud.digitalocean.com/account/api/tokens

```
doctl auth init
```

### Provision hosts

```
doctl compute droplet create --image ubuntu-20-04-x64 --region sfo3 --size s-4vcpu-8gb-amd --ssh-keys lion --tag-name gc-merge-devnet-3 gc-merge-devnet-3-0
```

### Delete hosts after testnet

To delete all droplets with tag `gc-merge-devnet-3`

```
doctl compute droplet delete --tag-name gc-merge-devnet-3
```

To list remaining droplets

```
doctl compute droplet list
```
