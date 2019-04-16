# Transfer ownership of Amazon S3 objects to a different AWS account.		

# Example : 
 Let’s take two accounts for this example source account and destination account. Also two buckets sourcebucket and destinationbucket.
 
 Step 1. Tools
 
Install AWS CLI according to the OS (Win, Mac or Linux ).

Step 2. Source Account S3bucket

- Create a SourceBucket in a Region (eg.,Mumbai) ,in the "AWS Source Account "
- Upload files onto this bucket, that can be transferred 

Step 3. Destination Account S3bucket

-Create a Destinationbucket in Ireland Region,in the "AWS Destination Account"
- Attach the Permissions into the Bucket policy  as follows;

 # {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ExamplePermissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::SOURCE ACCOUNT NUMBER:root"
            },
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::DESTINATION BUCKET",
                "arn:aws:s3:::DESTINATION BUCKET/*"
            ]
        }
    ]
}

Note : The Source account's ACCOUNT NUMBER can be figured by going to the SOURCE ACCOUNT's CONSOLE, then click SUPPORT, choose Support center and there you will find the account number as : xxxxxxxxxxxx

Step 4:

- Go to the AWS CLI, Configure AWS using the script : aws configure 
- Transfer bojects from the Source Bucket to Destination Bucket using the command as below:

  aws s3 cp file.txt s3://sourcebucket s3://destinationbucket
 
   aws s3 sync s3://sourcebucket s3://destinationbucket
  
  - If the above command fails, then try this command instead
  
  aws s3 sync s3://sourcebucket s3://destinationbucket --Source region REGION NAME --region REGION NAME 
  
  
 # OUTPUT:
  
  - The above CLI scripts will transfer the S3 objects accross AWS accounts,also ending up in transferring the OWNERSHIP of the account.
