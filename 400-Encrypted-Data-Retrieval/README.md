# Encrypted Data Retrieval After KMS Key Deletion

## 🔥 Scenario

Your client is using AWS KMS - CMK Keys to encrypted data in S3, EFS and EBS. During their annual key rotation cycle, they have accidentally deleted one of their KMS keys that is still being used in S3 and EBS. It had already been over month since the key deleted was initiated and the keys are no longer available in the AWS Console.

Your clients wants you to recommend ways of retrieving the data stored in S3 and EBS.

## 📋 Next Steps

1. What actions will you take to ?
1. What order will you take those actions?
1. What controls will you put in place to prevent such events?

## 💭 Solution Options

- Is any EC2 instances running with the encrypted EBS volumes **already** attached? If so, data inside those volumes can be read and stored safely.

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

### 👋 Buy me a coffee

Buy me a [coffee ☕][900].

### 🏷️ Metadata

**Level**: 400

[100]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579

[200]: https://github.com/miztiik/aws-real-time-use-cases/issues

[900]: https://ko-fi.com/miztiik

