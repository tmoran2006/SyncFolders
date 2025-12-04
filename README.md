# SyncFolders PowerShell Module

## Overview
`SyncFolders` is a PowerShell module that helps keep files in a destination directory up to date with a source directory.  
It recursively traverses all subdirectories, compares files based on their **LastWriteTime** (last updated attribute), and copies files from the source to the destination if:
- The destination file is missing, or
- The destination file is older than the source.

This ensures both directories remain synchronized without overwriting files unnecessarily.

---

## Features
- 🔄 Recursively syncs all files and subdirectories
- ⏱ Compares files using the **LastWriteTime** attribute
- 📂 Automatically creates missing subdirectories in the destination
- 📊 Generates a summary report showing:
  - Files copied (new)
  - Files updated (outdated replaced)
  - Files skipped (already current)

---

## Installation
Clone or download this repository, then place the module in your PowerShell module path:

```powershell
# Copy to your user module folder
C:\Users\<YourUser>\Documents\WindowsPowerShell\Modules\SyncFolders\
    SyncFolders.psm1
    SyncFolders.psd1
```

Or install system-wide for all users:

```powershell
C:\Program Files\WindowsPowerShell\Modules\SyncFolders\
    SyncFolders.psm1
    SyncFolders.psd1
```

---
##Importing the Module
Once installed, import the module into your PowerShell session:

```powershell
Import-Module SyncFolders
```

Verify it’s available:
```powershell
Get-Module -ListAvailable SyncFolders
```

---
Usage
Call the function with your source and destination directories:

```powershell
Sync-Folders -SourceDir "C:\SourceParent" -DestinationDir "D:\DestinationParent"
```

---
##Example Output

```powershell
Updating outdated file: D:\DestinationParent\Reports\report1.docx
Destination file missing. Copying: D:\DestinationParent\Images\logo.png
File is current: D:\DestinationParent\Notes\todo.txt
-----------------------------------
Sync Report:
Files copied (new):    1
Files updated (newer): 1
Files skipped (current): 1
-----------------------------------
```
