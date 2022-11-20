#!/bin/sh

case "$_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_PRATER" in
"prysm-prater.dnp.dappnode.eth")
  echo "Using prysm-prater.dnp.dappnode.eth"
  JWT_PATH="/security/prysm/jwtsecret.hex"
  ;;
"lighthouse-prater.dnp.dappnode.eth")
  echo "Using lighthouse-prater.dnp.dappnode.eth"
  JWT_PATH="/security/lighthouse/jwtsecret.hex"
  ;;
"teku-prater.dnp.dappnode.eth")
  echo "Using teku-prater.dnp.dappnode.eth"
  JWT_PATH="/security/teku/jwtsecret.hex"
  ;;
"nimbus-prater.dnp.dappnode.eth")
  echo "Using nimbus-prater.dnp.dappnode.eth"
  JWT_PATH="/security/nimbus/jwtsecret.hex"
  ;;
*)
  echo "Using default"
  JWT_PATH="/security/default/jwtsecret.hex"
  ;;
esac

# Print the jwt to the dappmanager
JWT=$(cat $JWT_PATH)
curl -X POST "http://my.dappnode/data-send?key=jwt&data=${JWT}"

exec besu --rpc-ws-host='0.0.0.0' \
  --network=goerli \
  --rpc-ws-enabled=true \
  --rpc-http-host='0.0.0.0' \
  --rpc-http-enabled=true \
  --host-allowlist=* \
  --rpc-http-cors-origins=* \
  --engine-rpc-port=8551 \
  --engine-host-allowlist=* \
  --engine-jwt-secret=$JWT_PATH \
  --engine-rpc-enabled=true \
  --data-storage-format=$STORAGE_FORMAT \
  --metrics-enabled \
  --metrics-host='0.0.0.0' \
  --data-path=/var/lib/goerli-besu \
  --sync-mode=$SYNC_MODE \
  --rpc-http-max-active-connections=$MAX_HTTP_CONNECTIONS \
  --p2p-port=$P2P_PORT \
  $EXTRA_OPTS
