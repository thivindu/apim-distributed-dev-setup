#!/bin/bash

# Copy deployment.toml files
echo "Copying deployment.toml files"
cp -u -v -r ./conf/apim-acp/repository/* ./components/wso2am-acp/repository/
cp -u -v -r ./conf/apim-tm/repository/* ./components/wso2am-tm/repository/
cp -u -v -r ./conf/apim-universal-gw/repository/* ./components/wso2am-universal-gw/repository/

# Copy mysql-connector-j-8.4.0.jar
echo "Copying mysql-connector-j-8.4.0.jar"
cp -u -v ./lib/mysql-connector-j-8.4.0.jar ./components/wso2am-acp/repository/components/lib/
cp -u -v ./lib/mysql-connector-j-8.4.0.jar ./components/wso2am-tm/repository/components/lib/
cp -u -v ./lib/mysql-connector-j-8.4.0.jar ./components/wso2am-universal-gw/repository/components/lib/

# Start apim-acp
echo "Starting apim-acp"
sh ./components/wso2am-acp/bin/api-cp.sh
if [ $? -ne 0 ]; then
    echo "Error starting apim-acp. Exiting."
    exit $?
fi

exit 0

# Start apim-tm
echo "Starting apim-tm"
sh ./components/wso2am-tm/bin/traffic-manager.sh -DportOffset=1
if [ $? -ne 0 ]; then
    echo "Error starting apim-tm. Exiting."
    exit $?
fi

# Start apim-universal-gw
echo "Starting apim-universal-gw"
sh ./components/wso2am-universal-gw/bin/gateway.sh -DportOffset=2
if [ $? -ne 0 ]; then
    echo "Error starting apim-universal-gw. Exiting."
    exit $?
fi
