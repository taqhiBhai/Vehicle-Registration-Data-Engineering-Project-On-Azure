# Vehicle-Registration-Data-Engineering-Project-On-Azure
## Introduction
Automated data transformation using Azure Data Factory and Databricks, enabling seamless integration between ADLS and Synapse Analytics for efficient warehousing and visualization in Power BI.

## Architecture
![Architecture!](PowerBI/Architecture.png)

## Techonologies Used
- Azure Data Lake Storage
- Azure Data Factory
- Databricks
- Azure Synapse Analytics
- PowerBI

## Dataset
This is the open data from the Government of Telangana state, India. https://data.telangana.gov.in/dataset/regional-transport-authority-vehicle-registrations-data

## Project Workflow:

### Data Transformation: 
- Created TempView in Databricks to query with the SQL format
- Removing Duplicate’s and Data Quality checks saved Parquet file in "processed" folder.
- Utilize Databricks notebooks to clean the csv file and transform the data and then convert it into Parquet fromat.
### Data Storage: 
- Store the processed data in the designated "processed" folder within ADLS.
### Data Warehousing: 
- Creating a Star Schema
- Load the processed data into Synapse Analytics by creating fact and dimension tables.
- Creating Stored Procedures
- Executing Stored Procedures for External Tables

![StarSchema!](Synapse%20SQL%20scripts/star_schema.png)

### Data Visualization: 
- Utilize Power BI to create visually appealing and interactive reports and dashboards for data analysis.

1) Number of registrations by Maker and Model Name

![Report_1!](PowerBI/report_page-0001.jpg)

2) Commonly Used Fuels

![Report_2!](PowerBI/report_page-0003.jpg)
