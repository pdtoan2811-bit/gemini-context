# Plan: Local Database Support (Optional)

The user asked if a local server can be used instead of Cosmos DB.
This plan outlines the steps to implement a local database adapter using SQLite or a local file system (JSON) to fully replace the Azure Cosmos DB dependency.

## Goal
Allow the automation engine to run entirely locally without an Azure Cosmos DB subscription.

## Proposed Changes

### 1. Create `LocalDatabase` Class
- **File**: `src/backend/common/database/local_db.py` (New File)
- **Inheritance**: Inherits from `DatabaseBase`.
- **Implementation**:
    - Use `tinydb` or `sqlite3` to store documents locally.
    - Implement all abstract methods from `DatabaseBase` (`add_item`, `query_items`, `get_plan`, etc.).
    - Map "containers" to tables or separate JSON files.

### 2. Update `DatabaseFactory`
- **File**: `src/backend/common/database/database_factory.py`
- **Change**:
    - Add logic to check `APP_ENV` or a specific `USE_LOCAL_DB` flag.
    - If local, instantiate `LocalDatabase` instead of `CosmosDBClient`.

### 3. Verification Plan
- **Unit Tests**: Create tests that run the same CRUD operations against `LocalDatabase` and verify data persistence.
- **Integration**: Run the full backend with `USE_LOCAL_DB=true` and verify the frontend can create plans and agents without errors.

## Complexity
- **High**: The `DatabaseBase` has many methods (~30) covering specific queries. Re-implementing the query logic (filtering by fields) in Python/SQLite is non-trivial but doable.

## Recommendation
This is a significant effort. For now, we will proceed with the configured Azure credentials, but this plan stands ready if the user confirms they want to invest the time to build the local adapter.
