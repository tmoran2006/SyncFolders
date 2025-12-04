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

