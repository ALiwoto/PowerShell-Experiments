
# this file tries to get a list of services and save them as a json file.
$myServices = Get-Service | Select-Object -First 10

Write-Debug $myServices.GetType()
