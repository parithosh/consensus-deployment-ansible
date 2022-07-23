for value in 142.132.207.91 167.235.2.84 142.132.249.222 142.132.222.208 46.4.64.174 136.243.91.83 142.132.155.182 142.132.200.3 142.132.249.220 116.202.228.163 142.132.207.164 148.251.245.250 142.132.250.108 142.132.249.135 65.21.127.168
do
    echo "-- $value -- " && \
    ssh -o "StrictHostKeyChecking no" \
    devops@$value \
    "curl -H 'Content-Type: application/json' -X POST --data '{\"jsonrpc\":\"2.0\",\"method\":\"eth_blockNumber\",\"params\":[],\"id\":83}' http://$value:8545 -s"
done
