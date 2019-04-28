# DynamoDB Performance Improvement archival and empty table

## Scenario
During initial testing of the DynamoDB 500K items are being added into the table. Regular operations post the testing phase, application Read/Write latency post ingestion of 500K records increases significantly. 

Your client requests you to archive the initial load test data of 500K Items and improve the table performance.  The archived data should be easily available to be inserted back into the table if & when required.


## Next Steps
1. This is the tactical approach taken since testing needed to be resumed at the earliest.
   a) Take a backup of the DynamoDB table.
      Through console , choose the Backup tab and provide a name for the table to be backed up. 
	  Through CLI, use the command 
	  aws dynamodb create-backup --table-name Practicetable --backup-name Practicetable-backup --region XXX
	  The command returns an arn . keep note of the arn for restore  

   b) Delete the cloudformation stack that created the table. ( If table created manually delete the table through console or CLI)
   c) Recreate empty table manually or through Cloudformation.
   d) If data that was backed up needs to be restored the use the folloiwng CLI command to restore
      aws dynamodb restore-table-from-backup --target-table-name Restored-Practicetable --backup-arn "arn:aws:dynamodb:us-east-XXX/backup/000"
  
2. For a long term solution, please refer to the following blog from AWS.


### Contact Us
You can reach out to us to get more details through [here](https://www.youtube.com/channel/UC_evcfxhjjui5hChhLE08tQ/about).

