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
  
1. What controls will you put in place to prevent such events?
   - Amazon GuardDuty is an intelligent threat detection service that provides continuous monitoring of your AWS accounts and    workloads to protect against malicious or unauthorized activities.
   - we can help ensure full coverage while making it harder for a misconfiguration or an ingenious attacker to change that. When we detect something interesting, we generate a security finding and deliver it to you through the GuardDuty console and AWS CloudWatch Events. This makes it possible to simply view findings in GuardDuty or push them to an existing SIEM or workflow system. We’ve already seen customers take it a step further using AWS Lambda to automate actions such as changing security groups, isolating instances, or rotating credentials.
   - we should enable CloudTrail logging so you are alerted whenever instances are spun up
2. #### AWS Security Hub: Provides a comprehensive view of high-priority security alerts and compliance status across AWS accounts.
   - With AWS Security Hub you can collect and prioritize the security problems in your accounts and resources associated with Amazon Web Service. This tool process the data with a standard format and relate the problems to find out what are the most important. 
   - Benefits of AWS is that you can have all the security information of all your assets on the AWS cloud in just one place: the Security Hub console. There you can see the status of your resources every second and check trend of possible problem to prevent or correct them. 
3. #### Amazon Inspector: An automated security assessment service that helps improve the security and compliance of applications deployed on EC2 instances. By default,  the Common Vulnerabilities and Exposures (CVE) package is configured to run against all EC2 instances, every Saturday at

#### Attached is the Terraform template ## AWS Threat Detection Services
* Amazon GuardDuty
* Amazon Inspector
* AWS Security Hub
* AWS Cloudwatch Event
* AWS SNS Alert
## ?? Buy me a coffee

Buy me a coffee ? through [Paypal](https://paypal.me/valaxy), _or_ You can reach out to get more details through [here](https://youtube.com/c/valaxytechnologies/about).

### ?? Metadata

**Level**: 300
