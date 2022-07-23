#!/user/bin/python3

# pip install web3
from web3 import Web3

w3 = Web3(Web3.HTTPProvider("https://rpc.gnosischain.com", request_kwargs={'timeout': 60}))

latest_block = w3.eth.getBlock(block_identifier='latest')
latest_block_difficulty = latest_block['totalDifficulty']
latest_block_number = latest_block['number']
target_block_number = latest_block_number+16000

delta_diff = latest_block_difficulty - w3.eth.getBlock(latest_block_number-1)["totalDifficulty"]

total_diff = latest_block_difficulty + (delta_diff*(target_block_number-latest_block_number))
estimated_minutes = (target_block_number-latest_block_number)*5/60/60

print('Latest block: %s' % latest_block_number)
print('TD Latest Block: %d' % latest_block_difficulty)
print('Delta Diff: %d' % delta_diff)
print('Estimated TTD at block %d is %d' % (target_block_number, total_diff))
print('Estimated time: in %d hours' % estimated_minutes)
