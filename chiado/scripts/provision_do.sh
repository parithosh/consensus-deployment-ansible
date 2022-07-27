#!/bin/bash

TAG=chiado
COUNT=10

for i in $(seq 1 $COUNT);
do
  doctl compute droplet create \
  --image ubuntu-20-04-x64 \
  --region sfo3 \
  --size s-4vcpu-8gb-amd \
  --ssh-keys 5a:2b:03:10:50:b5:26:5e:78:1d:a7:9b:04:20:6a:a2 \
  --ssh-keys d9:39:86:57:a3:09:f1:f0:27:42:00:6e:79:79:cb:ff \
  --ssh-keys 4e:22:f5:f7:88:20:0c:87:38:67:89:89:6e:7c:38:f3 \
  --ssh-keys 13:da:72:42:4a:45:a0:fa:04:1e:eb:5b:a5:c1:2e:6a \
  --tag-name $TAG ${TAG}-${i}
done

while true; do 
  echo "-----"
	doctl compute droplet list --tag-name $TAG --no-header --format PublicIPv4
  sleep 2
done
