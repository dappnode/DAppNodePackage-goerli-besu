ARG UPSTREAM_VERSION

FROM hyperledger/besu:${UPSTREAM_VERSION}

COPY jwtsecret.hex /jwtsecret

USER root
RUN mkdir /var/lib/besu-goerli
RUN chown -R besu:besu /var/lib/besu-goerli
USER besu

ENV BESU_OPTS=$BESU_OPTS

ENTRYPOINT besu \
    --rpc-ws-host='0.0.0.0' \
    --network=goerli \
    --rpc-ws-enabled=$WS_ENABLED \
    --rpc-http-host='0.0.0.0' \
    --rpc-http-enabled=true \ 
    --host-allowlist=* \
    --rpc-http-cors-origins=* \
    --engine-rpc-port=8551 \
    --engine-host-allowlist=* \
    --engine-jwt-secret='/jwtsecret' \
    --engine-rpc-enabled=true \
    --data-storage-format=$STORAGE_FORMAT \
    --metrics-enabled \
    --metrics-host='0.0.0.0' \
    --data-path=/var/lib/besu-goerli \
    --sync-mode=$SYNC_MODE \
    --rpc-http-max-active-connections=$MAX_HTTP_CONNECTIONS \
    --p2p-port=$P2P_PORT \
    $EXTRA_OPTS
