# Data Ingestion To DynamoDB

## Scenario
Your client requests you ingest a data dump of 125K records into a fresh DyanamoDB for testing purpose in mutliple environments. The fields in the data dump are separated by commas and there is no gurantee that all fields have values. Each of these records are of size ~3KB. Post data load your client is planning to perform tests on the system.

Can you provide a solution that can achieve this and can be replicated across environments with minimal efforts.


## Solution - 1 
We can use the Data pipeline AWS service to load the data into the DynamoDB table.
1. ### Create a Data Pipeline 
     Provide an appropriate Pipeline name and build the source from one of the templates provided. For this usecase we chose - "Export DynamoDb tables to S3". We opted for import a defination and loaded from the local file that was shared to us by customer.
2. ### Choose a schedule 
    To run the pipeline daily or in a specific schedule choose the appropriate schedule. For this usecase we chose "Run on pipeline activation" ending after one occurance.
3. ### Configuration and Access
    It is recommended to keep the logging enabled nby specifying the S3 bucket for logs. Also choose the custom or default IAM role. The pipeline can be activated at the point and it will start loading the data into DynamoDB table specified in the first step.

**Cons** :
    - Any missing attribute or null values in data dump will cause the ingestion to fail.

## Solution - 2
To overcome the inconsisent data in the records, write a wrapper utility that will mask the `NULL` values in the csv input file to zeroes and load the data succesfully into DynamoDB table.

## Solution - 3
AWS Service Glue combines approach 1 and 2 and can be considered as a third approach to address this use-case.


### Contact Us
You can reach out to us to get more details through [here](https://www.youtube.com/channel/UC_evcfxhjjui5hChhLE08tQ/about).

