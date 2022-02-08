
$resources = Import-Csv  -path .\CSVName.csv

foreach($resourceID in $resources){
    try{
     if(get-AzResource -ResourceID $resourceID.RESOURCEID -ErrorAction Stop){
            write-host("Se encontró recurso "+$resourceID.NAME) 
        }
    }
    catch {
            write-warning("No existe recurso "+$resourceID.NAME+" en Grupo de Recurso "+$resourceID.RESOURCEGROUP)
            continue;
    }
    
}