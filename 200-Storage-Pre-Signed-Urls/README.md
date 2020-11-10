# Share very large files to/from customer

## 🔥 Scenario

Your customer wants to share a very large file with you (the file size can range from few hundred MBs to few GBs). They heard that AWS S3 Pre-Signed Urls can help in uploading/downloading files in a secure way using S3 for storage. As the customer is very busy, they would like to the url to be active for few days.

As their cloud consultant can you help them. Generate a s3 pre-signed url for your bucket that will allow the customer to upload the file to your bucket.

## 🎯Solutions

The main purpose of presigned URLs is to grant a user temporary access to an S3 object. We can use the AWS Python SDK - boto3 to generate the pre-signed url. There are few things to note that, If you created a presigned URL using a temporary token, then the URL expires when the token expires, even if the URL was created with a later expiration time. Also note that the presigned URL expires prematurely if the IAM user is deleted, or if the access key and secret access key are deactivated.

The credentials that you can use to create a presigned URL include:

- **AWS Identity and Access Management (IAM) instance profile**: Valid up to 6 hours
- **AWS Security Token Service (STS)**: Valid up to 36 hours when signed with permanent credentials, such as the credentials of the AWS account root user or an IAM user
- **IAM user**: Valid up to 7 days when using AWS Signature Version 4

To create a presigned URL that is valid for up to `7` days, first setup IAM user credentials to the SDK that you're using. Then, generate a presigned URL using AWS Signature Version 4.

For example, edit the bucket and object name in the following code to generate a signed url.

```python
import boto3
from botocore.client import Config

S3_BUCKET_NAME="your_bucket_name_goes_here"
OBJECT_KEY_NAME="tentative_customer_object_file_name"

# Get the service client with sigv4 configured
s3 = boto3.client("s3", config=Config(signature_version="s3v4"))

# URL expires in 604800 seconds (seven days)
url = s3.generate_presigned_url(
    ClientMethod="get_object",
    Params={
        "Bucket": S3_BUCKET_NAME,
        "Key": OBJECT_KEY_NAME
    },
    ExpiresIn=604800
)

print(url)
```

## 📌 Who is using this

This repository teaches developers, Solution Architects & Ops Engineers how to build complete architecture in AWS. Based on that knowledge these Udemy [course #1][103], [course #2][102] have been created to enhance your skills.

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it is a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here](/issues)

### 👋 Buy me a coffee

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Q5Q41QDGK)Buy me a [coffee ☕][900].

### 📚 References

1. [AWS real time use cases to test your skills][1]

### 🏷️ Metadata

**Level**: 300

[1]: https://github.com/miztiik/aws-real-time-use-cases
[100]: https://www.udemy.com/course/aws-cloud-security/?referralCode=B7F1B6C78B45ADAF77A9
[101]: https://www.udemy.com/course/aws-cloud-security-proactive-way/?referralCode=71DC542AD4481309A441
[102]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579
[103]: https://www.udemy.com/course/aws-cloudformation-basics?referralCode=93AD3B1530BC871093D6
[899]: https://www.udemy.com/user/n-kumar/
[900]: https://ko-fi.com/miztiik
[901]: https://ko-fi.com/Q5Q41QDGK
