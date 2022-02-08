#Need a .csv archive with 2 columns(NAME, RESOURCEID)
$resources = Import-Csv  -path .\CSVName.csv

#In the next lines It validates if the resource exist if not continue, if exist delete it
foreach($resourceID in $resources)
{
    try{
     if(get-AzResource -ResourceID $resourceID.RESOURCEID -ErrorAction Stop){
            write-host("Borrando recurso: "+$resourceID.NAME) 
        try{
            Remove-AzResource -ResourceID $resourceID.RESOURCEID -force -ErrorAction Stop
            write-host("Eliminado satisfactoriamente")
            }
        catch{
            write-warning("No se pudo eliminar recurso "+$message)
            continue;
            }
        }
    }
    catch {
            write-warning("Error, no existe recurso "+$resourceID.NAME)
            continue;
    }
    
}