#!/bin/bash

sleep 10

# Create Rabbitmq user
rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASSWORD
rabbitmqctl set_user_tags $RABBITMQ_USER administrator
rabbitmqctl set_permissions -p / $RABBITMQ_USER  ".*" ".*" ".*"
echo "*** User '$RABBITMQ_USER' with password '$RABBITMQ_PASSWORD' completed. ***"
echo "*** Log in the WebUI at port 15672 (example: http:/localhost:15672) ***"

rabbitmqadmin declare exchange name="e" type="direct"
rabbitmqadmin declare queue name="q" durable=true auto_delete=false
rabbitmqadmin declare binding source="e" destination="q" routing_key="f"

rabbitmqadmin publish exchange="e" routing_key="f" payload="Hello, world"

sleep 5

rabbitmqadmin list queues
rabbitmqadmin list exchanges
rabbitmqadmin list bindings
