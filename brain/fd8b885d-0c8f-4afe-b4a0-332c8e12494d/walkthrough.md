# Walkthrough - Lark POST Test Feature & Webhook Management

I have implemented the requested Lark API POST test feature and a new UI for managing person-specific webhooks.

## Key Changes

### 1. Webhook Forwarding Enhancements
- Updated `/api/send-todo-webhook` to support direct `webhookUrl` in the payload.
- This enables testing any Lark webhook URL immediately, without needing to save it to the database first.

### 2. Webhook Management API
- Created `/api/webhooks` endpoint to read and write to the `sprint_relay_person_webhooks` configuration in `db.json`.
- Users can now update team member webhooks directly from the application UI.

### 3. Webhook Settings & Testing
- Added a new "Webhooks" button in the dashboard header.
- The modal allows:
    - **Management**: View and edit webhooks for every team member.
    - **Testing**: A dedicated test section where you can:
        - Select a person.
        - Input a custom **Task URL** (Record Link) to test formatting.
        - **Simulate "Move to Next Sprint"**: Toggle this to verify how carried-over tasks are rendered in Lark.
        - Trigger a test POST and see the detailed JSON response from Lark.

### 4. Sprint Movement Feature
- Added a **"Move to Next Sprint"** toggle in the **Standup Inspector**.
- This marks a task as being moved to the next sprint, which is then reflected as `isMoved: true` in the Lark webhook payload.

## Visual Demonstration

The new "Webhooks" button is located in the top-right control bar, next to the "Roles" button.

### Webhook Settings UI
The modal provides a clean interface for managing all automation targets and verifying connections.

### Test Results
Detailed feedback, including status codes and response bodies from Lark, is displayed after each test run.

## Verification Performed
- Verified API logic for retrieving and storing webhooks in `db.json`.
- Verified that the `send-todo-webhook` API correctly prioritizes the provided `webhookUrl` for testing.
- Verified component integration and responsive design of the new modal.

> [!TIP]
> Use the test feature to verify your Lark automation setup before sending the daily plans. This ensures that any formatting or permission issues are identified early.

### 5. Sandbox View
I've added a dedicated **Sandbox** tab to the main navigation (next to "Sprint Start").
- Selecting the tab will show a **"Launch Sandbox"** button.
- The sandbox allows you to select any person, toggle "Move to Next Sprint" for their tasks, and preview the JSON payload.
- This provides an isolated environment to verify Lark integration logic without affecting the main dashboard view.
