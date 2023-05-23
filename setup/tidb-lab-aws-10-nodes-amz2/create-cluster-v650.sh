#!/bin/bash

./01-precheck-and-fix-nodes.sh

# Creating the TiDB cluster named tidb-test, version 6.5.0
~/.tiup/bin/tiup cluster deploy tidb-test 6.5.0 ./solution-topology-ten-nodes.yaml --yes

sleep 3;

./start-cluster.sh
