# Product Model Template

## Overview

The Profisee Product Model Template provides a series of entities and a supporting application to manage basic Product Master Data Management activities. The template consumes 143 attributes.


## Usage

The Product template is designed to enable the quick deployment of the Profisee data model and supporting Product FastApp. Attributes/Entities can be added or removed as needed; this template has been created as a starting point for Product MDM needs.

## Prerequisites

* Profisee Version 2021 R2
* Profisee Platform Tools installed 2021 R2 (CLU)
* Microsoft sqlcmd utility
* Microsoft PowerShell

## Entities Included in Product Model
* Color
* Continent
* Country
* Currency
* Product
* Product_Category
* Product_Class
* Product_Group
* Product_Line
* Product_Price
* Product_PriceTier
* Product_Size
* Product_Style
* Product_Subcategory
* Product_SubcategorySize
* StateProvince
* System
* UnitOfMeasure
* WorkflowStatus
* YesNo

## Folder Structure 

### profisee_objects
~~~ 
-> External System.externalsystemlist
-> Invalid Products.presentationview
-> Product Category.presentationview
-> Product Finance High Value.presentationview
-> Product Finance.portalapplication
-> Product Line NA.presentationview
-> Product List Finance.presentationview
-> Product List Marketing.presentationview
-> Product Marketing.portalapplication
-> Product Price.presentationview
-> Product Subcategory Size.presentationview
-> Product Subcategory.presentationview
-> Product.archive
-> Product.archivestrategy
-> Product.hierarchy
-> Product_Delete.stagingtable
-> Product_Forms.maestroform
-> Product_Merge.stagingtable
-> Product_Rules.rules
-> Profisee Workflows.wf
-> Profisee.maestromodel
-> Reference Data.portalapplication
~~~

### Powershell Installation Scripts
~~~
Installation with data import
-> Product_install_with_data.ps1
~~~

~~~
Installation without data import
-> Product_install.ps1
~~~


## Installation Procedure

### Execute Product_install.ps1/Product_install_with_data.ps1

~~~
To install only model and supporting artifacts, execute Product_install.ps1 script. 
To deploy data, model, and supporting artifacts, execute Product_install_with_data.ps1

User must enter the following parameters: 
    a. FQDN Profisee service URI (example: https://corp.acme.com/profisee/)
    b. SQL Server host (example: localhost)
    c. Profisee database name (example: Profisee)
    d. ClientID: [clientID of service account]
~~~
Once all parameters are entered the script will execute and the artifacts which are contained in the "profisee_objects" folder will be imported to the Profisee server.


