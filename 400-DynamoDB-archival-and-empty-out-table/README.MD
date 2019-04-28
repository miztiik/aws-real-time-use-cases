# DynamoDB Performance Improvement archival and empty table

## Scenario
During initial testing of the DynamoDB 500K items are being added into the table. Regular operations post the testing phase, application Read/Write latency post ingestion of 500K records increases significantly and is impacting operations.

Your client requests you to archive the initial load test data of 500K Items and improve the table performance.  The archived data should be easily available to be inserted back into the table if & when required.


## Tactical Solution[s]
As the operations are impacted, A quick fix was required to restore the reliability of the system.
1. ### Backup DDB Table
      - Take a backup of the DynamoDB table.

        ```sh
        aws dynamodb create-backup --table-name {{YOUR-TABLE-NAME}} \
                                   --backup-name {{YOUR-BACKUP-NAME}} \
                                   --region {{YOUR-AWS-REGION}}
        ```
	  Make a note of the `DDB Table Backup ARN` to be used in the restore operation.  

      - Delete the cloudformation stack that created the table, _If table created manually delete the table through console or CLI_
1. ### Create & Restore DDB Table
      - Recreate a new table with the same name. _Preferably through  Cloudformation_.
      - Restore with the following command,

        ```sh
        aws dynamodb restore-table-from-backup --target-table-name {{YOUR-RESTORED-TABLE-NAME}} --backup-arn {{DD-TABLE-BACKUP-ARN}}
        ```
  
## Strategic Solution
For a long term solution, You can use [DynamoDB TTL](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/TTL.html) that removes older items from a DynamoDB table. If you want to archive them to S3, you use Lambda funtion in conjuntion with DynamoDB Streams<sup>[Ref](#References)</sup>.


### Contact Us
You can reach out to us to get more details through [here](https://www.youtube.com/channel/UC_evcfxhjjui5hChhLE08tQ/about).


##### References
1. [Automatically Archive Items with TTL](https://aws.amazon.com/blogs/database/automatically-archive-items-to-s3-using-dynamodb-time-to-live-with-aws-lambda-and-amazon-kinesis-firehose/)
