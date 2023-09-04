# Important Info

You can limit resource usage (eg. RAM) in BESU_OPTS field in the Advanced Configuration.
Just pass it standard JVM memory arguments.

Example below sets the JVM soft heap size as 8GB and the hard heap size as 12GB:

```bash
-Xms8G -Xmx12G
```

This package, by default, uses the newer BONSAI storage structure.
You can change it to the older FOREST structure in the Config Tab.
Does require a full resync and volume removal.

## Used Ports

| Port | Used For | Exposed |
| ---- | -------- | ------- |
| 8545 | JSON-RPC | No      |
| 8546 | WebSocket| No      |
| 8551 | Engine API | No      |
| 9545 | Metrics  | No      |
| 30814 | Peer Traffic| Yes  |

## General

This DAppNode package uses the Besu Execution Client.

### License

This repository is offered under the Apache 2.0 license. See LICENSE for details.
