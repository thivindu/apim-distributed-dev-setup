# apim-distributed-dev-setup

This repository provides an easy-to-use setup for a distributed API Management (APIM) development environment. Begin by copying the necessary packs into the `components` directory. **Note:** The directory names must strictly follow this naming convention: `wso2am-acp`, `wso2am-tm`, and `wso2am-universal-gw`. 

When you run the startup script, it initializes a MySQL Docker container and executes the scripts located in `conf/mysql/scripts`. Following this, the APIM components are launched with the configurations outlined below.

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
    Ensure that the packs are placed in the `components` directory with the following exact folder names:
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

4. Access the API Management portal at:
    ```
    http://localhost:9000
    ```

5. Stop the services
    ```bash
    sh run.sh --stop
    ```

### Environment Configuration

Environment variables can be configured in the `.env` file:

```
# API Gateway configuration
APIM_GATEWAY_PORT=8080

# Portal configuration
APIM_PORTAL_PORT=9000

# Database configuration
APIM_DB_USER=apim
APIM_DB_PASSWORD=password
```

### Troubleshooting

You can find each APIM component logs in `logs/` directory. 