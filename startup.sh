#!/bin/bash

# Function to wait for a service to start
wait_for_service_start() {
    local service_name=$1
    local port_offset=$2
    local base_port=9763
    local check_port=$((base_port + port_offset))
    
    echo "Waiting for $service_name to start..."
    local max_retries=30
    local counter=0
    while [ $counter -lt $max_retries ]; do
        if curl --silent --fail http://localhost:$check_port/services/Version > /dev/null; then
            echo "$service_name is up and running"
            return 0
        fi
        echo "Waiting for $service_name to start... ($counter/$max_retries)"
        counter=$((counter+1))
        sleep 5
    done

    if [ $counter -eq $max_retries ]; then
        echo "Error: $service_name did not start within the expected time"
        return 1
    fi
}

mkdir -p logs
rm -rf logs/*

# Copy deployment.toml files
echo "Copying deployment.toml files"
cp -v -r ./conf/apim-acp/repository/* ./components/wso2am-acp/repository/
cp -v -r ./conf/apim-tm/repository/* ./components/wso2am-tm/repository/
cp -v -r ./conf/apim-universal-gw/repository/* ./components/wso2am-universal-gw/repository/

# Copy mysql-connector-j-8.4.0.jar
echo "Copying mysql-connector-j-8.4.0.jar"
cp -v ./lib/mysql-connector-j-8.4.0.jar ./components/wso2am-acp/repository/components/lib/
cp -v ./lib/mysql-connector-j-8.4.0.jar ./components/wso2am-tm/repository/components/lib/
cp -v ./lib/mysql-connector-j-8.4.0.jar ./components/wso2am-universal-gw/repository/components/lib/

# Start apim-acp
echo "Starting apim-acp"
sh ./components/wso2am-acp/bin/api-cp.sh > logs/apim-acp.log 2>&1 &
if [ $? -ne 0 ]; then
    echo "Error starting apim-acp. Exiting."
    exit $?
fi
# Wait until apim-acp is fully started and responding
wait_for_service_start "apim-acp" 0

# Start apim-tm
echo "Starting apim-tm"
sh ./components/wso2am-tm/bin/traffic-manager.sh -DportOffset=1 > logs/apim-tm.log 2>&1 &
if [ $? -ne 0 ]; then
    echo "Error starting apim-tm. Exiting."
    exit $?
fi
# Wait until apim-tm is fully started and responding
wait_for_service_start "apim-tm" 1

# Start apim-universal-gw
echo "Starting apim-universal-gw"
sh ./components/wso2am-universal-gw/bin/gateway.sh -DportOffset=2 > logs/apim-universal-gw.log 2>&1 &
if [ $? -ne 0 ]; then
    echo "Error starting apim-universal-gw. Exiting."
    exit $?
fi
# Wait until apim-universal-gw is fully started and responding
wait_for_service_start "apim-universal-gw" 2
