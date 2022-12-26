
# this file tries to get a list of services and save them as a json file.
$myServices = Get-Service | Select-Object -First 10

Write-Debug $myServices.GetType()

<#The following code gets all processes' ram usage with paths which match the variable below #>
$processPathMatching = @("*bot*", "*mob*", "*PsychoPass*", "might")

# $myProcesses = Get-Process -Name @("*Robot*",  "*PsychoPass") | 
$myProcesses = Get-Process | Where-Object { 
        foreach ($currentPathMatch in $processPathMatching) {
            if ($_.Path -Like $currentPathMatch) {
                return $true
            }
        }
        return $false
    } |
    Sort-Object -Property "WorkingSet64" -Descending | Group-Object -Property {($_.Path -split "\\")[1]}
    # Sort-Object -Property "WorkingSet64" -Descending | Group-Object -Property "ProcessName" 

$myProcesses = $myProcesses | Format-Table Name,
    @{
        Label = "Memory (KB)"; 
        Expression = {'{0:N0}' -f (($_.Group| Measure-Object WorkingSet64 -Sum).Sum / 1KB)}; 
        Align="right"
    }, @{
        Label = "Path";
        Expression = {($_.Group.Path -split "\\")[1]};
        Align = "right"
    }

Write-Output $myProcesses
