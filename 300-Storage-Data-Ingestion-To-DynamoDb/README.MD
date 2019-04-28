# DynamoDB Performance Issue[s]

## Scenario
Client requires around 125K data each of size approximately 3 Kb to be loaded into DynamoDB for testing purpose. This test data will be introduced into the client system in the form of csv file. The DynamoDB table into which the data needs to be loaded should be an empty table, post data load the client will perform certains tests on the system.


## Approach -1 
We use the AWS service - Data pipeline to load the data into the DynamoDB table.
1. #### Create a Data Pipeline 
      Provide an appropriate Pipeline name and build the source from one of the templates provided. For this usecase we chose - "Export DynamoDb tables to S3". We opted for import a defination and loaded from the local file that was shared to us by customer.
2. #### Choose a schedule 
     To run the pipeline daily or in a specific schedule choose the appropriate schedule. For this usecase we chose "Run on pipeline activation" ending after one occurance.
3. #### Configuration and Access
     It is recommended to keep the logging enabled nby specifying the S3 bucket for logs. Also choose the custom or default IAM role.
The pipeline can be activated at the point and it will start loading the data into DynamoDB table specified in the first step.

## Approach -2
The team developed Java utilies to convert the  NULL values in the csv input file  into zeroes and loaded the data succesfully into DynamoDB table.

This approach worked.


### Contact Us
You can reach out to us to get more details through [here](https://www.youtube.com/channel/UC_evcfxhjjui5hChhLE08tQ/about).


##### References
1. [Automatically Archive Items with TTL](https://aws.amazon.com/blogs/database/automatically-archive-items-to-s3-using-dynamodb-time-to-live-with-aws-lambda-and-amazon-kinesis-firehose/)
