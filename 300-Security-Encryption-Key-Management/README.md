# Encryption Key Management

## 🔥 Scenario

Currently AWS KMS service does not allow you to back up your key material in a CMK. This is making your customer very nervous about the continued usage of the service. They are asking you for best practices on how to manage this in Infrastructure as Code(IaC), so that they can prevent accidental deletion of keys?

## 🎯Solutions

- One potential solution is to use custom keys, so the customer will have their own "backup". That fully meets the requirement.
- To avoid accidental deletion, AWS KMS keys cannot be permanently deleted in less than 7 days (default 30). Their IAC should check once per day, If their key has not been deleted, and **IFF** it has been deleted, they will have 29 (or at least 6) days to recover it.

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

### 👋 Buy me a coffee

Buy me a [coffee ☕][900].

### 🏷️ Metadata

**Level**: 300

[100]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579

[200]: https://github.com/miztiik/aws-real-time-use-cases/issues

[900]: https://ko-fi.com/miztiik
