
# make sure we are doing the operation in the correct directory.
$correctCurrentDirectory = "01 - ServiceLists"
if (!$PWD.Path.EndsWith($correctCurrentDirectory)) {
    Set-Location $correctCurrentDirectory
}

$allServices = (Get-Service -ErrorAction "SilentlyContinue")

$members = $allServices[0] | Get-Member -MemberType @("Property", "AliasProperty")

$members | ConvertTo-Json | Out-File -FilePath ".\service_members.json"

Write-Output $PWD
