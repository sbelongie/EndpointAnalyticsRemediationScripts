<#
Version: 1.0
Author: 
- Joey Verlinden (www.joeyverlinden.com)
- Andrew Taylor (andrewstaylor.com)
- Florian Slazmann (scloud.work)
- Jannik Reinhard (jannikreinhard.com)
Script: detection-ODFolderOffline
Description:
Release notes:
Version 1.0: Init
#> 

$CompanyName = "scloud" # company name you habe in your OneDrive sync
$ODFolder = "Desktop"

try{

    # OneDrive Path
    $OneDrive_path = "C:\Users\$env:username\OneDrive - $CompanyName\$ODFolder"

    $Status_current = $(attrib.exe $OneDrive_path) -replace(" ","")
    $Status_target = "RP"+$($OneDrive_path) -replace(" ","")
    if($Status_current -ne $Status_target){
        Write-Warning "Not offline available: $OneDrive_path"
        Exit 1
    }else{
        Write-Output "Folder already offline available"
        Exit 0
    }
} 
catch {
    Write-Error $_
    Exit 1
}