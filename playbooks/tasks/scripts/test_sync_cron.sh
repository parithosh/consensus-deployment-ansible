#!/bin/bash

# How to run:
#
# /opt/test_sync_cron.sh .last_synced 600

EARLIEST_SYNCED_FILEPATH=$1
RESTART_EVERY_SEC=$2

# Check if synced continuosly for enough time, then restart node
# This script should be part of a cronjob, running every 2 minutes

syncing_res=$(curl localhost:4000/eth/v1/node/syncing)
# {"data":{"is_syncing":false,"head_slot":"11065","sync_distance":"0"}}
is_syncing=$(echo $syncing_res | jq ".data.is_syncing")
head_slot=$(echo $syncing_res | jq ".data.head_slot|tonumber")

echo "is_syncing: $is_syncing head_slot $head_slot - syncing_res $syncing_res"

# If not synced, ignore
if [ "$is_syncing" == "false" ] && [ "$head_slot" -gt "0" ]; then
  echo "Synced"
  current_time=$(date +%s)

  # Check if enough time has passed since
  if test -f "$EARLIEST_SYNCED_FILEPATH"; then
    earliest_synced=$(cat $EARLIEST_SYNCED_FILEPATH)
    echo "earliest_synced $earliest_synced"

    if (( "$current_time" > "$earliest_synced" + "$RESTART_EVERY_SEC" )); then
      echo "current_time $current_time synced for $RESTART_EVERY_SEC restarting"
      rm -f $EARLIEST_SYNCED_FILEPATH

      # Start from genesis
      docker stop {{beacon_container_name}}
      docker stop {{beacon_container_name}}
      rm -rf {{beacon_node_dir}}/*
      rm -rf {{execution_node_dir}}/*
      docker start {{beacon_container_name}}
      docker start {{beacon_container_name}}

    else
      echo "current_time $current_time not yet synced for $RESTART_EVERY_SEC"
    fi

  else
    echo "writing earliest_synced $current_time"
    echo "$current_time" > "$EARLIEST_SYNCED_FILEPATH"
  fi

else
  echo "Not synced"
  rm -f $EARLIEST_SYNCED_FILEPATH
fi
