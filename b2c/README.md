# B2C Model Template

## Overview

The Profisee B2C Model Template provides a series of entities and a supporting application to manage basic B2C Master Data Management activities. The template consumes 167 attributes.

![Screenshot](images/b2b_dashboard.png)

## Usage

The B2C template is designed to enable the quick deployment of the Profisee data model and supporting B2C FastApp. Attributes/Entities can be added or removed as needed; this template has been created as a starting point for B2C MDM needs.

## Prerequisites

* Profisee Version 2021 R2
* Profisee Platform Tools installed 2021 R2 (CLU)
* Microsoft sqlcmd utility
* Microsoft PowerShell

## Entities Included in B2C Model
* AddressVerificationStatus
* CustomerB2C
* CustomerB2C_Area
* CustomerB2C_MarketingCampaign
* CustomerB2C_MatchStatus
* CustomerB2C_Region
* CustomerB2C_SourceSystem
* CustomerB2C_YesNo
* LocationVerificationConfidence
* LocationVerificationStatus
* MatchStatus
* SalesArea
* SalesRegion

## Folder Structure 

### profisee_objects
~~~ 
-> B2C.rules
-> B2C.verification
-> Customer B2C Issues.presentationview
-> CustomerB2C Area to Region to Customer.hierarchy
-> CustomerB2C Customer Source.presentationview
-> CustomerB2C Household.matchingstrategy
-> CustomerB2C Master Recursive Hiearchy.hierarchy
-> CustomerB2C Master.presentationview
-> CustomerB2C Matching.matchingstrategy
-> CustomerB2C.portalapplication
-> CustomerB2C_01CustomerSource-Add No AV.maestroform
-> CustomerB2C_01CustomerSource-Add.maestroform
-> CustomerB2C_01CustomerSource-Edit AV.maestroform
-> CustomerB2C_01CustomerSource-Edit.maestroform
-> CustomerB2C_02CustomerMaster.maestroform
-> CustomerB2C_Merge.stagingtable
-> CustomerData.archive
-> Profisee.maestromodel
~~~

### Powershell Installation Scripts
~~~
Installation with data import
-> B2C_install_with_data.ps1
~~~

~~~
Installation without data import
-> B2C_install.ps1
~~~


## Installation Procedure

### Execute B2C_install.ps1/B2C_install_with_data.ps1

~~~
To install only model and supporting artifacts, execute B2C_install.ps1 script. 
To deploy data, model, and supporting artifacts, execute B2C_install_with_data.ps1

User must enter the following parameters: 
    a. FQDN Profisee service URI (example: https://corp.acme.com/profisee/)
    b. SQL Server host (example: localhost)
    c. Profisee database name (example: Profisee)
    d. ClientID: [clientID of service account]
~~~
Once all parameters are entered the script will execute and the artifacts which are contained in the "profisee_objects" folder will be imported to the Profisee server.


