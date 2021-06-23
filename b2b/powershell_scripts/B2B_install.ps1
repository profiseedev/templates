#This script will import the Profisee B2B model, Staging Tables, archived data, Presentation Views, Forms, FastApp, Matching Strategy, Address Verification Strategy,
#Data Quality Rules, and Hiearchies into Profisee which are held in the profisee_objects folder.
[CmdletBinding()]
param(
  [Parameter(Mandatory=$true, HelpMessage="FQDN Profisee Server URI (e.g,. http(s)://servername.corp/profisee)")]
  [String]$profisee_svc_uri,
  [Parameter(Mandatory=$true, HelpMessage="SQL Server Name")]
  [String]$sqlserver_host,
  [Parameter(Mandatory=$true, HelpMessage="Profisee Database Name")]
  [String]$profisee_db,
  [Parameter(Mandatory=$true, HelpMessage="Service Account ClientID")]
  [String]$clientID
)

$profisee_ver='21.2.0'

# Set path for cmd line util
$profisee_cmd_line_utl = $Env:ProgramFiles + '\Profisee\Master Data Maestro Utilities\' + $profisee_ver  + '\Profisee.MasterDataMaestro.Utilities.exe'

# Install model and related objects
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:MODEL /FILE:$PSScriptRoot\profisee_objects\'Profisee.maestromodel' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'Customer Account Masters.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'Customer Account Sources.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'Customer Contact Masters.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'Invalid Customers.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:FORMS /FILE:$PSScriptRoot\profisee_objects\'Customer_Contact.maestroform' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:FORMS /FILE:$PSScriptRoot\profisee_objects\'Customer_Account.maestroform' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:HIERARCHY /FILE:$PSScriptRoot\profisee_objects\'Account-Group.hierarchy' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:HIERARCHY /FILE:$PSScriptRoot\profisee_objects\'Account-Master.hierarchy' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:ADDRESS /FILE:$PSScriptRoot\profisee_objects\'CustomerB2B.verification' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:MATCHING /FILE:$PSScriptRoot\profisee_objects\'Customer_Account.matchingstrategy' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:MATCHING /FILE:$PSScriptRoot\profisee_objects\'Customer_Account-LUBC.matchingstrategy' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:RULES /FILE:$PSScriptRoot\profisee_objects\'CustomerB2B.rules' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:APPLICATION /FILE:$PSScriptRoot\profisee_objects/'CustomerB2B.portalapplication' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:STAGINGTABLE /FILE:$PSScriptRoot\profisee_objects\'Account_Merge.stagingtable' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:STAGINGTABLE /FILE:$PSScriptRoot\profisee_objects\'Contact_Merge.stagingtable' /CLIENTID:$clientID

Read-Host -Prompt "Profisee deployment completed. Press enter to continue"