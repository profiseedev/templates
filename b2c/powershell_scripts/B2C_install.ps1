#This script will import the Profisee B2C model, Staging Tables, archived data, Presentation Views, Forms, FastApp, Matching Strategy, Address Verification Strategy,
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
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'CustomerB2C Master.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'CustomerB2C Customer Source.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'Customer B2C Issues.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:FORMS /FILE:$PSScriptRoot\profisee_objects\'CustomerB2C_02CustomerMaster.maestroform' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:FORMS /FILE:$PSScriptRoot\profisee_objects\'CustomerB2C_01CustomerSource-Edit.maestroform' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:FORMS /FILE:$PSScriptRoot\profisee_objects\'CustomerB2C_01CustomerSource-Edit AV.maestroform' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:FORMS /FILE:$PSScriptRoot\profisee_objects\'CustomerB2C_01CustomerSource-Add.maestroform' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:FORMS /FILE:$PSScriptRoot\profisee_objects\'CustomerB2C_01CustomerSource-Add No AV.maestroform' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:HIERARCHY /FILE:$PSScriptRoot\profisee_objects\'CustomerB2C Master Recursive Hiearchy.hierarchy' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:HIERARCHY /FILE:$PSScriptRoot\profisee_objects\'CustomerB2C Area to Region to Customer.hierarchy' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:ADDRESS /FILE:$PSScriptRoot\profisee_objects\'B2C.verification' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:MATCHING /FILE:$PSScriptRoot\profisee_objects\'CustomerB2C Matching.matchingstrategy' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:MATCHING /FILE:$PSScriptRoot\profisee_objects\'CustomerB2C Household.matchingstrategy' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:RULES /FILE:$PSScriptRoot\profisee_objects\'B2C.rules' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:APPLICATION /FILE:$PSScriptRoot\profisee_objects/'CustomerB2C.portalapplication' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:STAGINGTABLE /FILE:$PSScriptRoot\profisee_objects\'CustomerB2C_Merge.stagingtable' /CLIENTID:$clientID

Read-Host -Prompt "Profisee deployment completed. Press enter to continue"