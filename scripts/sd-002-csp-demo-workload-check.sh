#!/bin/bash

LB_DNS_NAME=`aws elbv2 describe-load-balancers --names demo-nlb --query "LoadBalancers[0].DNSName" --output text --region us-west-2`

qdb(){
mysql -h ${LB_DNS_NAME} -P 4000 -uroot --connect-timeout 1 2>/dev/null << EOF
  SELECT tidb_instance, COUNT(event) FROM test.dummy GROUP BY tidb_instance ORDER BY tidb_instance;
EOF
}

query(){
  echo;
  date;
  qdb
  sleep 2;
}

# python3 ./sd-002-event-listener.py &

while true; do
  query;
done;
