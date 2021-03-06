$toolsLoc = Get-ToolsLocation
$vstssyncmigrationpath =Join-Path -Path $toolsLoc -ChildPath "\VSTSSyncMigration"

if(test-path $vstssyncmigrationpath) {
  write-host "Cleaning out the contents of $vstssyncmigrationpath"
  Remove-Item "$($vstssyncmigrationpath)\*" -recurse -force
}

Install-ChocolateyZipPackage 'vsts-sm' 'https://github.com/nkdAgility/vsts-sync-migration/releases/download/#{GITVERSION.FULLSEMVER}#/vstsbulkeditor-#{GITVERSION.FULLSEMVER}#.zip' $vstssyncmigrationpath -Checksum #{Chocolatey.FileHash}# -ChecksumType SHA256
write-host 'VSTS Sync Migration has been installed. Call `vsts-sm` from the command line to see options. You may need to close and reopen the command shell.'
