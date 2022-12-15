
$allContents = Get-Content -Path ".\process.json" -Raw
$jsonData = ConvertFrom-Json -InputObject $allContents 

# $myObjs = (Get-Content -Path ".\process.json" | ConvertFrom-Json | Select-Object -Property *,
$myObjs = ($jsonData | Select-Object -Property *,
@{name = 'MyProcessName'; expression = { $_.ProcessName } },
@{label = 'MyCPU'; expression = { $_.CPU } },
@{n = 'MyVM'; expression = { $_.VM } })

$myObj = $myObjs[0]

Write-Output $myObj | Get-Member
