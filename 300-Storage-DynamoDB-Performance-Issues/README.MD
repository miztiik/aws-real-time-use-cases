# DynamoDB Performance Issue[s]

## Scenario

Your client's informs they have performance issues in their Dynamodb. During initial testing of the DynamoDB 500K items are being added into the table. Application teams are complaining that the platform had slowed down considerably. Upon investigation you find that the Read/Write latency post ingestion of 500K records increased significantly and is impacting operations.

Your client wants you to improve the DDB performance urgently and requests you to archive the initial load test data of 500K Items. The archived data should be easily available to be inserted back into the table if & when required.

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
        aws dynamodb restore-table-from-backup --target-table-name {{YOUR-RESTORED-TABLE-NAME}} \
                                               --backup-arn {{DD-TABLE-BACKUP-ARN}}
        ```
  
## Strategic Solution

For a long term solution, You can use [DynamoDB TTL](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/TTL.html) that removes older items from a DynamoDB table. If you want to archive them to S3, you use Lambda function in conjunction with DynamoDB Streams<sup>[Ref](#References)</sup>.

### References

1. [Automatically Archive Items with TTL][1]

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

### 👋 Buy me a coffee

Buy me a [coffee ☕][900].

### 🏷️ Metadata

**Level**: 300

[1]: https://aws.amazon.com/blogs/database/automatically-archive-items-to-s3-using-dynamodb-time-to-live-with-aws-lambda-and-amazon-kinesis-firehose/

[100]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579

[200]: https://github.com/miztiik/aws-real-time-use-cases/issues

[900]: https://ko-fi.com/miztiik
