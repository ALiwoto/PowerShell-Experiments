# make sure we are doing the operation in the correct directory.
$correctCurrentDirectory = "02 - CopyingFiles"
if (!$PWD.Path.EndsWith($correctCurrentDirectory)) {
    Set-Location $correctCurrentDirectory
}

$destPath = ".\Files\"
# create the destination if it doesn't exist already.
if (!(Test-Path -Path $destPath)) {
    New-Item -Path $destPath -ItemType "Directory"
}

Copy-Item -Path "..\01 - ServiceLists\*.json" -Destination $destPath

Write-Output "Done!"
