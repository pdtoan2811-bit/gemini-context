# Corrected Google Apps Script 

Based on the full code you provided, I found exactly why the filtering was failing. 

When a Google Apps Script runs as a Web App (like when our Next.js backend fetches it), there is no actively open window, so `getActiveSheet()` can be unreliable. Furthermore, `headers.indexOf('sprint')` fails silently if the header is named `Sprint` (capital S) or has trailing spaces (e.g. `'sprint '`).

Replace the entire contents of your **`getSprintDebug.gs`** file with this rock-solid version:

```javascript
function doGet(e) {
  // 1. Explicitly target "Sheet1" instead of the unreliable ActiveSheet
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getSheetByName('Sheet1');
  
  if (!sheet) {
    return ContentService.createTextOutput(JSON.stringify({"error": "Sheet1 not found"}))
      .setMimeType(ContentService.MimeType.JSON);
  }

  var data = sheet.getDataRange().getValues();
  
  if (data.length <= 1) {
    return ContentService.createTextOutput(JSON.stringify([]))
      .setMimeType(ContentService.MimeType.JSON);
  }
  
  var headers = data[0];
  var rows = data.slice(1);
  var result = [];
  
  // 2. Check if the frontend passed a specific 'sprint' filter in the URL
  var targetSprint = e.parameter ? e.parameter.sprint : null;
  
  // 3. Find the index of the 'sprint' column completely safely (ignores case and spaces)
  var sprintColIndex = -1;
  for (var h = 0; h < headers.length; h++) {
    if (String(headers[h]).toLowerCase().trim() === 'sprint') {
      sprintColIndex = h;
      break;
    }
  }
  
  for (var i = 0; i < rows.length; i++) {
    var rowData = rows[i];
    
    // 4. If a target sprint is requested, skip rows that don't match
    if (targetSprint && sprintColIndex !== -1) {
      var rowSprint = String(rowData[sprintColIndex]).trim();
      var filterSprint = String(targetSprint).trim();
      
      if (rowSprint !== filterSprint) {
        continue; 
      }
    }
    
    // Only package the object if it passed the filter
    var obj = {};
    for (var j = 0; j < headers.length; j++) {
      var headerName = String(headers[j]).trim();
      if (headerName) {
        obj[headerName] = rowData[j];
      }
    }
    result.push(obj);
  }
  
  return ContentService.createTextOutput(JSON.stringify(result))
    .setMimeType(ContentService.MimeType.JSON);
}
```

### Final Deployment Step
Since this app will just be running on your local computer occasionally, this **API Filtering** approach is definitely the right choice. It requires no extra databases and perfectly protects your browser's memory.

After pasting this code into `getSprintDebug.gs`, remember to explicitly deploy the **New Version**:
1. Go to **Deploy > Manage deployments**.
2. Click the **pencil icon** (Edit) next to your active Web App.
3. In the **Version** dropdown menu, select **New version**.
4. Click **Deploy**.
