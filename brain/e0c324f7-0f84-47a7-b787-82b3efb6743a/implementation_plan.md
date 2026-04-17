# Refined Manual Data Entry Model

The current data model treats "Refs" as clicks. This plan updates the terminology to treat "Refs" as successful conversions (Referral Counts) and introduces a "Ref Value" field to support both CPA and Revenue Share models.

## User Review Required

- **Data Migration**: Existing `refCount` data will be repurposed as `conversions`. Are you okay with this semantic shift, or should we try to preserve "clicks" separately? (User specified "Ref is not click", so we'll treat them as converts).
- **Auto-Calculation**: If `Ref Value` is entered, `Revenue` will be automatically calculated. If `Ref Value` is left blank, the `Revenue` field will remain open for manual entry.

## Proposed Changes

### [Component] [ProjectAnalytics](file:///c:/Users/Admin/Desktop/adecosmvp/frontend/src/components/ProjectAnalytics.jsx)

- **State Model [MODIFY]**:
  - Update `newEntry` and `bulkEntries` state to include `refValue`.
  - Remove/Consolidate `conversions` field since `refCount` now represents converts.
- **Logic [MODIFY]**:
  - Update `handleAddEntry` and `handleBulkSave` to implement: `revenue = refValue ? (refCount * refValue) : manualRevenue`.
- **Single Entry Form [MODIFY]**:
  - Change labels: "Ref Count (Clicks)" -> "Ref Count (Successful Converts)".
  - Add "Ref Value (CPA per Ref)" input.
  - Update "Revenue" input to show the calculated value if CPA is entered.
- **Bulk Edit Modal [MODIFY]**:
  - Add "Ref Value" column to the spreadsheet view.
  - Ensure individual rows calculate revenue automatically when either `refCount` or `refValue` changes.
- **Data Ledger [MODIFY]**:
  - Update table headers to reflect "Ref Count" and "Rev".

## Verification Plan

### Automated Tests
- Browser test: Enter `Ref Count = 10` and `Ref Value = 100`, verify `Revenue` becomes `1000`.
- Browser test: Leave `Ref Value` blank, enter `Revenue = 5000`, verify ledger shows `5000`.

### Manual Verification
- Check the 7-day Bulk Edit modal to ensure the new "Ref Value" column fits well in the table layout.
