# What are the public SSM parameters

## 🔥 Scenario

Your client trying to standardise their AWS infrastructure stacks. They would like to know what are they parameters that are exposed by Amazon, so that they do not have to recreate them.

## 🎯Solutions

Some AWS services publish information about common artifacts as Systems Manager public parameters. _For example_, the Amazon Elastic Compute Cloud (Amazon EC2) service publishes information about Amazon Machines Images (AMIs) as public parameters.

You can call this information from your scripts and code by using the `GetParametersByPath`, `GetParameter`, and `GetParameters` API actions. Learn more [here][1]

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

### 👋 Buy me a coffee

Buy me a [coffee ☕][900].

### 🏷️ Metadata

**Level**: 300

[1]: https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-public-parameters.html

[100]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579

[200]: https://github.com/miztiik/aws-real-time-use-cases/issues

[900]: https://ko-fi.com/miztiik
