# Cloudformation Stack Accidental Deletion

## 🔥 Scenario

One of your mission critical stack is deleted accidentally. Your client is expecting you to restore the resources and data at the earliest.

![Cloudformation Stack Accidental Deletion](images/stack_deletion.png)

What is your recommendation?

## 🎯 Solutions

Unfortunately it is not possible to restore the deleted stack, Instead you can recreate the resources in the stack with the same template and copy the data from backups. To avoid or mitigate the impact of accidental deletion you can use the following options,

1. Set _DeletionPolicy_ Attribute in Clouformation
1. Restrict the ability of users to _delete_ or _update_ a stack and its resources at IAM
1. Assign a _stack policy_ to prevent updates to stack resources
1. Enable _Termination protection_

## 👋 Buy me a coffee

Buy me a coffee ☕ through [Paypal](https://paypal.me/valaxy), _or_ You can reach out to get more details through [here](https://youtube.com/c/valaxytechnologies/about).

### 📚 References

1. [Retain Clouformation Resources](https://aws.amazon.com/premiumsupport/knowledge-center/delete-cf-stack-retain-resources/)

1. [Protecting a Stack From Being Deleted](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html)
1. [Prevent Updates to Stack Resources](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html)
1. [Control Cfn Access in IAM](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-iam-template.html)

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

### 👋 Buy me a coffee

Buy me a [coffee ☕][900].

### 🏷️ Metadata

**Level**: 300

[100]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579

[200]: https://github.com/miztiik/aws-real-time-use-cases/issues

[900]: https://ko-fi.com/miztiik
