# apim-distributed-dev-setup

This repository provides a straightforward setup for a distributed API Management (APIM) development environment. Start by copying the required packs into the `components` directory. **Note:** The directory names must strictly adhere to the following naming convention: `wso2am-acp`, `wso2am-tm`, and `wso2am-universal-gw`. 

When you execute the startup script, it initializes a MySQL Docker container and runs the scripts located in `conf/mysql/scripts`. Subsequently, the APIM components are launched with the configurations specified below:

- **APIM-ACP**: Zero offset
- **APIM-TM**: Offset of 1
- **APIM-Universal-GW**: Offset of 2

### Prerequisites

- Docker Engine 20.10.x or newer
- Docker Compose v2.x or newer

### Getting Started

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/apim-distributed-dev-setup.git
    cd apim-distributed-dev-setup
    ```
2. Extract the packs into the `components` directory:
    Ensure the packs are placed in the `components` directory with the following exact folder names:
    - `wso2am-acp`
    - `wso2am-tm`
    - `wso2am-universal-gw`
    ```
    components
    ├── wso2am-acp
    ├── wso2am-tm
    └── wso2am-universal-gw
    ```

3. Build and start the APIM distributed setup:
    ```bash
    sh run.sh
    ```

4. Add the following entry to the `/etc/hosts` file:
    ```
    127.0.0.1    tm.wso2.com gw.wso2.com cp.wso2.com am.wso2.com
    ```

5. You can now access the portals at the following URLs:
    ```
    Control Plane: https://cp.wso2.com:9443
    Gateway: https://gw.wso2.com:8245
    ```

5. Stop the services:
    ```bash
    sh run.sh --stop
    ```

### Environment Configuration

If you need to update any configuration files in the `conf/repository` directory in any packs, make the changes in the `conf/repository` directory. These updates will be copied to the required location automatically when you execute the `run.sh` script.

### Troubleshooting

- Logs for each APIM component can be found in the `logs/` directory. 
- If necessary, terminate all WSO2 Java services using the following command:
    ```bash
    ps -ef | grep 'wso2' | grep -v grep | awk '{print $2}' | xargs -r kill -9
    ```