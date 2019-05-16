# Transfer ownership of Amazon S3 objects to a different AWS account.		

## Scenario
Your client has a team of developers using `Account A` to create assets to be used in the production site hosted in `Account B`. As the cloud engineer your client expects you to set up automated copy of S3 Objects in `Account A` to S3 bucket in `Account B` and ensure that `Acccount B` can modify/change the permissions of the objects to suit their deployment requirements.


0. ## Prerequisites
    - Two AWS Accounts 
        - Source account:`Account A`
        - Destination Account:`Account B`
    - S3 Buckets in Account `A` & `B`
    - AWS CLI Access for both the accounts
    
1. ## Setup Tools 
    Let’s prepare the two accounts. Ensure you have two buckets `sourcebucket` and `destinationbucket`. _Change to your bucket names_. Install and configure AWS CLI with two different profiles for Account `A` & `B`.

1. ## Step 2. Source Account S3bucket
    - Create a `sourcebucket` in a Region (eg.,Mumbai) ,in the `Account A`
    - Upload sample files onto this bucket, that will be transferred to destination account.

1. ## Destination Account S3bucket

    - Create a `destinationbucket` in Ireland Region,in the `Account B`
    - Attach the below mentioned permissions into the Bucket policy;
        ```json
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "ExamplePermissions",
                    "Effect": "Allow",
                    "Principal": {
                        "AWS": "arn:aws:iam::Account_A:root"
                    },
                    "Action": "s3:*",
                    "Resource": [
                        "arn:aws:s3:::DESTINATION_BUCKET",
                        "arn:aws:s3:::DESTINATION_BUCKET/*"
                    ]
                }
            ]
        }
        ```
    **Note:** _The Source account's ACCOUNT NUMBER can be figured by going to the SOURCE ACCOUNT's CONSOLE, then click SUPPORT, choose Support center and there you     will find the account number as : `xxxxxxxxxxxx`_

 1. ## Verify S3 Copying & Ownership:
    - Go to the AWS CLI, Configure AWS using the script : `aws configure`. Transfer ojects from the Source Bucket to Destination Bucket using the command as below:
        ```sh
        aws s3 sync s3://sourcebucket s3://destinationbucket
        ```
    - If the above command fails, then try this command instead
    
        ```sh
        aws s3 sync s3://sourcebucket s3://destinationbucket --Source region REGION NAME --region REGION NAME
        ```
    - The above CLI scripts will transfer the S3 objects accross AWS accounts, also ending up in transferring the `OWNERSHIP` to the destination account.
