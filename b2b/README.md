# B2B Model Template

## Overview

The Profisee B2B Model Template provides a series of entities and a supporting application to manage basic B2B Master Data Management activities. The template consumes 281 attributes.

## Usage

The B2B template is designed to enable the quick deployment of the Profisee data model and supporting B2B FastApp. Attributes/Entities can be added or removed as needed; this template has been created as a starting point for B2B MDM needs.

## Prerequisites

* Profisee Version 2021 R2
* Profisee Platform Tools installed 2021 R2 (CLU)
* Microsoft sqlcmd utility
* Microsoft PowerShell

## Entities Included in B2B Model
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
