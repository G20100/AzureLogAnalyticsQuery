$query = "Perf | take 10"
$timespan = "PT12H"
$api_endpoint = "https://api.loganalytics.io/v1/workspaces/DEMO_WORKSPACE/query"

$Body = @{
    query=$query
    timespan=$timespan
    } 
$json = $Body | ConvertTo-Json

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", 'application/json')
$headers.Add("X-API-KEY", 'DEMO_KEY')

$result = Invoke-RestMethod -Uri $api_endpoint -Method Post -Body $json -Headers $headers  -ContentType 'application/json' 

$cols = $result.tables.columns | % name

foreach ($row in $result.tables.rows)
{
    $obj = [ordered]@{}
    for ($i =0; $i -lt $cols.length; $i++){
           $obj[$cols[$i]] = $row[$i]
     }
    New-Object psobject -Property $obj
 }
 
$obj

function Convertfrom-table ($result){
foreach ($row in $result.tables.rows)
{
    $obj = [ordered]@{}
    for ($i =0; $i -lt $cols.length; $i++){
           $obj[$cols[$i]] = $row[$i]
     }
    New-Object psobject -Property $obj
 }
 }

function tabletoarray{
for ($i = 1; $i -lt ($result.tables.columns.name.count); $i++)
{ 
        $array = @{
        $result.tables.columns[0] = $result.tables.rows[$i][0]
        $result.tables.columns[1] = $result.tables.rows[$i][1]
        $result.tables.columns[2] = $result.tables.rows[$i][2]
        }
}
}
