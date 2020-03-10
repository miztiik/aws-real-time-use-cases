# AWS Account Breached

## Scenario
You are getting an email from AWS about your AWS account billing is $XXXX(_You realize that is many times over the average bill over the past year_). On logging into the portal you find there are multiple instances running in multiple regions. 

## Account Recovery

1. What actions will you take to ? & What order will you take those actions?
  - Change  AWS account root user password.
  - Delete or rotate all root and AWS Identity and Access Management (IAM) access keys.
  - Delete any potentially compromised IAM users, and change the password for all other IAM users.
  - Delete any resources on your account you didn't create, such as EC2 instances and AMIs, EBS volumes and snapshots, and IAM users.
  - Respond to any notifications you received from AWS Support through the AWS Support Center.
  
2. What controls will you put in place to prevent such events?
   - Amazon GuardDuty is an intelligent threat detection service that provides continuous monitoring of your AWS accounts and    workloads to protect against malicious or unauthorized activities.
   -  we can help ensure full coverage while making it harder for a misconfiguration or an ingenious attacker to change that. When we detect something interesting, we generate a security finding and deliver it to you through the GuardDuty console and AWS CloudWatch Events. This makes it possible to simply view findings in GuardDuty or push them to an existing SIEM or workflow system. We’ve already seen customers take it a step further using AWS Lambda to automate actions such as changing security groups, isolating instances, or rotating credentials.
   - we should enable CloudTrail logging so you are alerted whenever instances are spun up
   
 ## AWS Rotate IAM Keys
    
  3. How about access keys for other IAM Users.?
      AWS Rotate IAM Keys can rotate keys for multiple profiles, but it can also replace multiple profiles with the same keys.
      ###AWS Rotate IAM Keys (https://aws-rotate-iam-keys.com/)
       <pre> 
        wget -q https://github.com/rhyeal/aws-rotate-iam-keys/blob/master/aws-rotate-iam-keys_0.9.1.deb -o aws-rotate-iam-keys.deb
        sudo dpkg -i aws-rotate-iam-keys.deb
        sudo apt-get install -f
        rm aws-rotate-iam-keys.deb # optional file clean up
        <pre>
        
  ## To rotate a specific profile in your ~/.aws/credentials file:
    
      aws-rotate-iam-keys --profile myProfile
