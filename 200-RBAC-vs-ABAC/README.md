# RBAC vs ABAC

## 🔥 Scenario

Mystique Unicorn App is a containerized microservice. The App Security Board had been recently formed to improve the security of this fast growing mobile app. They are looking to tighten the security by using RBAC. Recenly one of their dev engineers heard about [Attribute Based Access Control (ABAC)][101] in one of the security courses. The team was excited about this idea and wanted to know more.

As you are the cloud security expert, Mysitque Unicorn seeks your advice. Can you give an high-level overview of RBAC-vs-ABAC?

## 🎯 Solutions

As on today, there are many ways of achieving fine grained access control. Attribute Based Access Control (ABAC) is a newly evolving field in this area and getting lot of traction in the shadows. The below overview is based on information available today,

### 📌 Role Based Access Control

1. IAM is a Role Based Access Control (RBAC)
1. Users assume roles - via direct roles, groups, federation
1. Roles are respresented by STS tokens which contain a Principal + Policy
   Policies grant access to API actions
   "API actions provide access to data in,
1. Files in S3
1. DynamoDB items"

### 📌 Attribute Based Access Control

1. Attribute Based Access Control provides grants based on attributes in the given context
1. ABAC can be implemented in several services: _For Example_,

- S3 Tag Based Access Policies
- LakeFormation Fine Grained Access Control(FGAC)
- DynamoDB

1. IAM has policy **conditions**, but customers cannot influence the contents of the evaluation 'context'

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

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
[200]: https://github.com/miztiik/cfn-challenges/issues
[899]: https://www.udemy.com/user/n-kumar/
[900]: https://ko-fi.com/miztiik
[901]: https://ko-fi.com/Q5Q41QDGK
