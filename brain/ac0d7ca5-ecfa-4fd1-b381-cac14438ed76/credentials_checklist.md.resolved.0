# Required Credentials and Configuration

To launch and run the Multi-Agent Custom Automation Engine, you will need the following credentials and configuration values. These should be set in the `.env` files for each service or provided during deployment (e.g., via `azd up`).

## Azure Resources
These are required for the AI and data layers.
- **Azure Subscription ID**: The ID of your Azure subscription.
- **Azure Location**: Region to deploy resources (e.g., `eastus`, `swedencentral`).
- **Resource Group Name**: (Optional if creating new) The resource group to contain the services.

## Azure OpenAI Service
Required for the agents to function.
- **Endpoint**: `AZURE_OPENAI_ENDPOINT` (e.g., `https://my-resource.openai.azure.com/`)
- **API Key**: If not using Managed Identity.
- **Model Deployment Names**:
  - `AZURE_OPENAI_DEPLOYMENT_NAME` (e.g., `gpt-4o`)
  - `AZURE_AI_AGENT_MODEL_DEPLOYMENT_NAME` (e.g., `gpt-4o`)
  - `REASONING_MODEL_NAME` (e.g., `o3` or `gpt-4`)
- **API Version**: `AZURE_OPENAI_API_VERSION` (default: `2024-08-01-preview`)

## Azure Cosmos DB
Required for storing task state and history.
- **Endpoint**: `COSMOSDB_ENDPOINT`
- **Database Name**: `COSMOSDB_DATABASE` (default: `macae`)
- **Container Name**: `COSMOSDB_CONTAINER` (default: `memory`)

## Azure AI Project (Optional/Advanced)
If using Azure AI Agent Service specific features.
- **Project Endpoint**: `AZURE_AI_PROJECT_ENDPOINT`
- **Project Name**: `AZURE_AI_PROJECT_NAME`
- **Agent Endpoint**: `AZURE_AI_AGENT_ENDPOINT`

## Authentication (If enabled)
- **Tenant ID**: `TENANT_ID`
- **Client ID**: `CLIENT_ID`
- **Frontend App ID**: `VITE_APP_MSAL_AUTH_CLIENTID`

## Local Development URLs
If running locally:
- **Backend API URL**: `http://localhost:8000`
- **MCP Server URL**: `http://localhost:9000` (or `http://localhost:8080/mcp`)
- **Frontend URL**: `http://localhost:5173`
