# Profisee Templates
## *Governance Base Template*

The *Profisee Governance Base Template* provides a series of entities and a supporting application to manage basic master data governance activities. The template consumes 50 attributes.

An extended set of entities, attributes, data quality rules, workflows, and applications will be released later in a separate GitHub repo.

## Prerequisites
- Profisee Version 2020 R2
- Profisee Platform Tools installed 2020 R2 (CLU)
- Microsoft sqlcmd utility
- Microsoft PowerShell

## Entities Included in Base Model
- Govern_Attribute
- Govern_AttributeType
- Govern_BusinessGlossary
- Govern_Entity
- Govern_User
- Govern_UserStatus
- Govern_YesNo

## Folder Structure
### profisee_objects
		-> Business Glossary.presentationview 
		-> Govern Attributes.presentationview
		-> Govern Entities.presentationview
		-> User Catalog.presentationview		
		-> Govern_Attribute_Delete.stagingtable
		-> Govern_Attribute_Merge.stagingtable
		-> Govern_AttributeType_Merge.stagingtable
		-> Govern_Entity_Delete.stagingtable
		-> Govern_Entity_Merge.stagingtable
		-> Govern_User_Delete.stagingtable
		-> Govern_User_Merge.stagingtable
		-> Govern_YesNo_Merge.stagingtable
		-> Govern_Entity.maestroform
		-> Govern_Users.maestroform
		-> Governance Reference Data.archive
		-> Governance.portalapplication
		-> Profisee.maestromodel
### sql_scripts
		-> base_jSync_Govern.sql
		-> base_pSync_Govern.sql
		-> Uninstall.sql

### install_scripts
		-> Govern_install.ps1 
		-> Govern_uninstall.ps1

## Installation Procedure
### Execute Govern_install.ps1. 
    User must enter the following parameters: 
        a. Profisee service URI: example - https://corpltr23.corp.profisee.com/profisee/api/service.svc
        b. SQL Server host (example: localhost)
        c. Profisee database name (example: Profisee)
        d. ClientID: [clientID of service account]
	
Once all parameters are entered, the Profisee objects will be imported as well as creation of the Governance synchronization SQL stored procedure and SQL Agent job.

## Uninstall Procedure
### Execute Govern_uninstall.ps1. 
    User must enter the following parameters: 
        a. SQL Server host: example - localhost
        b. Profisee database name: example - Profisee

Once all parameters are entered, the base_jSync_Govern job and base_pSync_Govern stored procedure will be deleted. Removal of Profisee objects is not handled by this script. Manual intervention would be needed to remove Profisee objects.
