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
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /DEPLOYDATA /FILE:$PSScriptRoot\profisee_objects\"Product.archive" /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:EXTERNALSYSTEM /FILE:$PSScriptRoot\profisee_objects\'External System.externalsystemlist' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'Invalid Products.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'Product Category.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'Product Finance High Value.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'Product Line NA.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'Product List Finance.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'Product List Marketing.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'Product Price.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'Product Subcategory Size.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:PRESENTATIONVIEW /FILE:$PSScriptRoot\profisee_objects\'Product Subcategory.presentationview' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:FORMS /FILE:$PSScriptRoot\profisee_objects\'Product_Forms.maestroform' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:HIERARCHY /FILE:$PSScriptRoot\profisee_objects\'Product.hierarchy' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:HIERARCHY /FILE:$PSScriptRoot\profisee_objects\'Product.hierarchy' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:RULES /FILE:$PSScriptRoot\profisee_objects\'Product_Rules.rules' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /RUNRULES /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:APPLICATION /FILE:$PSScriptRoot\profisee_objects/'Product Finance.portalapplication' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:APPLICATION /FILE:$PSScriptRoot\profisee_objects/'Product Marketing.portalapplication' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:APPLICATION /FILE:$PSScriptRoot\profisee_objects/'Reference Data.portalapplication' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:STAGINGTABLE /FILE:$PSScriptRoot\profisee_objects\'Product_Delete.stagingtable' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:STAGINGTABLE /FILE:$PSScriptRoot\profisee_objects\'Product_Merge.stagingtable' /CLIENTID:$clientID
& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:WORKFLOW /FILE:$PSScriptRoot\profisee_objects\'Profisee Workflows.wf' /CLIENTID:$clientID
#& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:SUBSCRIBERCONFIGURATION /FILE:$PSScriptRoot\profisee_objects\'SC.subscriberconfig' /CLIENTID:$clientID
#& $profisee_cmd_line_utl /URL:$profisee_svc_uri /IMPORT /TYPE:MAESTROEVENT /FILE:$PSScriptRoot\profisee_objects\'IES_Workflow-ProductCreate.maestroEvent' /CLIENTID:$clientID

Read-Host -Prompt "Profisee deployment completed. Press enter to continue"
