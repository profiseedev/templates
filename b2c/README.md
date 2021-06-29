# B2C Model Template

## Overview

The Profisee B2C Model Template provides a series of entities and a supporting application to manage basic B2C Master Data Management activities. The template consumes 281 attributes.

![Screenshot](images/b2b_dashboard.png)

## Usage

The B2B template is designed to enable the quick deployment of the Profisee data model and supporting B2C FastApp. Attributes/Entities can be added or removed as needed; this template has been created as a starting point for B2C MDM needs.

## Prerequisites

* Profisee Version 2021 R2
* Profisee Platform Tools installed 2021 R2 (CLU)
* Microsoft sqlcmd utility
* Microsoft PowerShell

## Entities Included in B2C Model
* AddressVerificationStatus
* Continent
* Country
* Currency
* Customer_AccountArea
* Customer_AccountGroup
* Customer_CompanyType
* Customer_Contact
* Customer_Segment
* Customer_Status
* CustomerB2B
* Gender
* LocationVerificationConfidence
* LocationVerificationStatus
* MaritalStatus
* MatchStatus
* MergeStatus
* StateProvince
* System
* WorkflowStatus
* YesNo

## Folder Structure 

### profisee_objects
~~~ 
-> Account_Merge.stagingtable
-> Account-Contact.hierarchy
-> Account-Group.hierarchy
-> Account-Master.hierarchy
-> Contact_Merge.stagingtable
-> Customer Account Masters.presentationview
-> Customer Account Sources.presentationview
-> Customer Contact Masters.presentationview
-> Customer Contact Sources.presentationview
-> Customer_Account.archive
-> Customer_Account.maestroform
-> Customer_Account.matchingstrategy
-> Customer_Account-LUBC.matchingstrategy
-> Customer_Contact.maestroform
-> CustomerB2B.portalapplication
-> CustomerB2B.rules
-> CustomerB2B.verification
-> Invalid Customers.presentationview
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


