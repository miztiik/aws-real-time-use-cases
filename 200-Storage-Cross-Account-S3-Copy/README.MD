# Transfer ownership of Amazon S3 objects to a different AWS account.		

## Scenario
Your client has a team of developers using `Account A` to create assets to be used in the production site hosted in `Account B`. As the cloud engineer your client expects you to set up automated copy of S3 Objects from `Account A` to S3 bucket in `Account B` and ensure that `Acccount B` can modify/change the permissions of the objects to suit their deployment requirements.

## Introduction
To achieve the S3 Cross account object transfer from one account to another,it is important to set up the bucket permissions in both
`Account A` and `Account B` S3 buckets respectively.The bucket permissions will allow any IAM users of `Account A` to upload objects 
into the destination bucket of `Account B`.These permissions will transfer the ownership from `A` to `B` successfully. Finally,the ACL has to be applied through CLI to provide `FULL CONTROL` of the objects to the Destination bucket.Now,the Destination bucket users will have access to the transferred objects and also the full controll and Ownership.

0. ## Prerequisites
    - Two AWS Accounts 
        - Source account:`Account A`
        - Destination Account:`Account B`
    - S3 Buckets in Account `A` & `B`
    - AWS CLI Access for both the accounts
    
1. ## Setup Tools 
    Let’s prepare the two accounts. Ensure you have two buckets `sourcebucket` and `destinationbucket`. _Change to your bucket names_. Install and configure AWS CLI with two different profiles for Account `A` & `B`.

2. ## Source Account S3bucket
     - Create a `sourcebucket` in a Region (eg.,Mumbai) ,in the `Account A`.
        - Upload sample files onto this bucket, that will be transferred to destination account.
        - Attach the below mentioned permissions into the Bucket policy;
    
   ```json
    {
    "Id": "Policy1541018284691",
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1541018283275",
            "Action": [
                "s3:PutObject"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::<<YOUR-BUCKET-NAME>>/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            },
            "Principal": {
                "AWS": [
                    "arn:aws:iam::<<YOUR-DEV-ACCOUNT-NUMBER>>:user/<<iam-username>>"
                ]
            }
        }
    ]
    }}


3. ## Destination Account S3bucket

    - Create a `destinationbucket` in Ireland Region,in the `Account B`.
    -  Attach the below mentioned permissions into the Bucket policy;
     
      ```json
       {
    "Version": "2008-10-17",
    "Id": "Policy1357935677554",
    "Statement": [
        {
            "Sid": "Stmt1357935647218",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::<<YOUR-DEV-ACCOUNT-NUMBER>>:user/<<iam-username>>"
            },
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::<<DESTINATION BUCKET NAME>>"
        },
        {
            "Sid": "Stmt1357935676138",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::<<YOUR-DEV-ACCOUNT-NUMBER>>:user/<<iam-username>>"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::<<DESTINATION BUCKET NAME>>/*"
        }
    ]
    }
     ```
    
        
   **Note:** _The Source account's ACCOUNT NUMBER can be figured by going to the SOURCE ACCOUNT's CONSOLE, 
   then click SUPPORT, choose Support center and there you will find the account number as : `xxxxxxxxxxxx`_.
    
    

  4. ## Verify S3 Copying & Ownership:
                
      -  Go to the AWS CLI, Configure AWS using the script : `aws configure`. 
      Transfer ojects from the Source Bucket to Destination Bucket using the command as below:
        
        ```sh
        aws s3api put-object-acl --bucket DestinationBucket --key ObjectName --acl bucket-owner-full-control
        ```
        -The above command will provide full control of the object to the bucket owner (Destination bucket owner).
          
        -If you want to copy multiple objects to the bucket, then try this command instead
    
        ```sh
       aws s3 cp s3://SOURCE BUCKET NAME/ {{s3://DESTINATION BUCKET NAME/}}\
       --acl bucket-owner-full-control --recursive
        ```
        
       -The above CLI scripts will copy all the S3 objects accross AWS accounts, also ending up in transferring the `FULL CONTROLL` to the destination account.
    
     ### References
    
     1.Read more about granting S3object access during the COPY or PUT operation here[S3 Bucket Onwer acess](https://aws.amazon.com/premiumsupport/knowledge-center/s3-bucket-owner-access/)
