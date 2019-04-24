#!/bin/bash
ts=`date +%s`;
#echo "[{\"metric\": \"test-metric\", \"endpoint\": \"wukong\", \"timestamp\": $ts,\"step\": 60,\"value\": 1,\"counterType\": \"GAUGE\",\"tags\": \"idc=lg,project=xx\"}]"
#echo `curl -X POST -d "[{\"metric\": \"test-metric\", \"endpoint\": \"wukong\", \"timestamp\": $ts,\"step\": 60,\"value\": 1,\"counterType\": \"GAUGE\",\"tags\": \"idc=lg,project=xx\"}]" http://127.0.0.1:1988/v1/push`

metric="[{\"endpoint\":\"wukong\",\"metric\":\"proc.cpu\",\"value\":0.0,\"step\":60,\"counterType\":\"GAUGE\",\"timestamp\":1555381976,\"tags\":\"pid=15929,cmdline=falcon-agent\"},{\"endpoint\":\"wukong\",\"metric\":\"proc.mem\",\"value\":14999552,\"step\":60,\"counterType\":\"GAUGE\",\"timestamp\":1555381976,\"tags\":\"pid=15929,cmdline=falcon-agent\"},{\"endpoint\":\"wukong\",\"metric\":\"proc.io.in\",\"value\":327680,\"step\":60,\"counterType\":\"GAUGE\",\"timestamp\":1555381976,\"tags\":\"pid=15929,cmdline=falcon-agent\"},{\"endpoint\":\"wukong\",\"metric\":\"proc.io.out\",\"value\":397312,\"step\":60,\"counterType\":\"GAUGE\",\"timestamp\":1555381976,\"tags\":\"pid=15929,cmdline=falcon-agent\"}]"
echo $metric
echo `curl -X POST -d $metric http://127.0.0.1:1988/v1/push`
