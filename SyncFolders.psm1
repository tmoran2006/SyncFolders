function Sync-Folders {
    param (
        [Parameter(Mandatory=$true)]
        [string]$SourceDir,

        [Parameter(Mandatory=$true)]
        [string]$DestinationDir
    )

    # Initialize counters
    $CopiedCount  = 0
    $UpdatedCount = 0
    $SkippedCount = 0

    # Recursively process all files in the source directory
    Get-ChildItem -Path $SourceDir -Recurse -File | ForEach-Object {
        $SourceFile = $_.FullName

        # Compute relative path (everything after the source root)
        $RelativePath = $SourceFile.Substring($SourceDir.Length).TrimStart('\')

        # Build destination file path
        $DestinationFile = Join-Path $DestinationDir $RelativePath

        # Ensure destination subdirectory exists
        $DestFolder = Split-Path $DestinationFile -Parent
        if (-not (Test-Path $DestFolder)) {
            New-Item -ItemType Directory -Path $DestFolder -Force | Out-Null
        }

        # Compare LastWriteTime (last updated attribute)
        if (Test-Path $DestinationFile) {
            $SourceInfo = Get-Item $SourceFile
            $DestInfo   = Get-Item $DestinationFile

            if ($SourceInfo.LastWriteTime -gt $DestInfo.LastWriteTime) {
                Write-Host "Updating outdated file: $DestinationFile"
                Copy-Item $SourceFile -Destination $DestinationFile -Force
                $UpdatedCount++
            }
            else {
                Write-Host "File is current: $DestinationFile"
                $SkippedCount++
            }
        }
        else {
            Write-Host "Destination file missing. Copying: $DestinationFile"
            Copy-Item $SourceFile -Destination $DestinationFile -Force
            $CopiedCount++
        }
    }

    # Final report
    Write-Host "-----------------------------------"
    Write-Host "Sync Report:"
    Write-Host "Files copied (new):    $CopiedCount"
    Write-Host "Files updated (newer): $UpdatedCount"
    Write-Host "Files skipped (current): $SkippedCount"
    Write-Host "-----------------------------------"
}
