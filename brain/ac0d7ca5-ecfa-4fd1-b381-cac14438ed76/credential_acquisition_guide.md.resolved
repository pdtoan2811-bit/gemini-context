# How to Retrieve Credentials for MACAE

This guide explains how to find the required credentials to run the Multi-Agent Custom Automation Engine.

## 1. Azure Resources (Subscription & Resource Group)
**Why needed**: To tell the application where to create/find resources and who pays for them.

**How to find**:
1. Go to [Azure Portal](https://portal.azure.com/).
2. Search for **"Subscriptions"** in the top bar.
3. Copy the **Subscription ID** (e.g., `ad92798a-...`).
4. Search for **"Resource Groups"** and pick the one you are using (or create a new one, e.g., `rg-macae-001`). This is your `AZURE_RESOURCE_GROUP`.
5. Note the distinct **Location** (Region) of your Resource Group (e.g., `East US`).

## 2. Azure OpenAI Service
**Why needed**: Generates the text/reasoning for agents.

**How to find**:
1. In Azure Portal, search for **"Azure OpenAI"**.
2. Click on your OpenAI resource (create one if needed).
3. **Endpoint**: On the Overview page, look for "Keys and Endpoint" on the left menu. Copy the **Endpoint** URL (e.g., `https://my-resource.openai.azure.com/`).
4. **Key**: On the same "Keys and Endpoint" page, copy **Key 1**.
5. **Model Deployments**:
    - Go to **Model deployments** (or "Azure AI Foundry" via the button).
    - You must deploy models (like `gpt-4o`). The **Name** you give this deployment is your `AZURE_OPENAI_DEPLOYMENT_NAME`.
    - **Note**: Ensure you use the same name in your config (e.g., if you named the deployment `gpt-4o-v2`, put that in your config).

## 3. Azure Cosmos DB (NoSQL)
**Why needed**: Stores memory (chat history, plans).

**How to find**:
1. Search for **"Azure Cosmos DB"**.
2. Click your resource (ensure it is **NoSQL API** type).
3. **Endpoint**: Go to **Keys** on the left menu. Copy the **URI**.
4. **Key**: Copy the **PRIMARY KEY**.
5. **Database/Container**:
    - Go to **Data Explorer**.
    - If empty, create a new Database id: `macae`.
    - Create a new Container id: `memory` (Partition key: `/session_id`).

## 4. Azure AI Project (Advanced)
**Why needed**: Only if using advanced "Agent Service" features.

**How to find**:
1. Go to [Azure AI Studio](https://ai.azure.com/).
2. Select your project.
3. Go to **Project Settings** (gear icon).
4. Copy:
    - **Project Connection String** (or Endpoint).
    - **Project Name**.

## CLI Shortcut (If you use `azd`)
If you have the Azure Developer CLI installed, you can often run:
```bash
azd env get-values
```
This will print out most of the values if you have already run `azd up` at least once.
