#!/bin/bash

geth_ipc="$HOME/.story/geth/iliad/geth.ipc"

peer_url="https://story.josephtran.co/clean_peers.txt"

curl -s "$peer_url" | while IFS= read -r peer
do
    echo "Adding peer: $peer"
    result=$(echo "admin.addPeer('$peer')" | story-geth attach "$geth_ipc" 2>&1)
    echo "$result"
done
