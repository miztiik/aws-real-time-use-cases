# Elasticache(Redis) Migration between AWS Accounts

## 🔥 Scenario

Mystique Corp is migrating one of their core application from one AWS Account(`A`) to AWS Account(`B`). They are currently utilizing Amazon Elasticache - Redis to delivered low latency querying. They are worried that in the new account `B`, post the migration the cache will be cold and that will add stress on the database and web servers.

As their cloud consultant can you suggest them a solution to for a smoother migration that does not require any application code changes?

## 🎯Solutions

- **Option 1** : Amazon Elasticache allows users to [backup and import thier caches][2]. Customers can export their cache to S3, share it with the target account (_Say Account `B` in this case_) and import the cache in thier new Elasticache cluster. There will be a small _delta_ will be missing, but that will be significantly lesser than having no cache.

- **Option 2** :Another option is to use the open source tool [RUMP][3], which allows to live sync redis caches.

Customers have to be wary if they are using KMS encryption, As that adds another layer of complexity in migration the cache data.

## 📌 Who is using this

This repository teaches developers, Solution Architects & Ops Engineers how to build complete architecture in AWS. Based on that knowledge these Udemy [course #1][103], [course #2][102] have been created to enhance your skills.

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][/issues]

### 👋 Buy me a coffee

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Q5Q41QDGK)Buy me a [coffee ☕][900].

### 📚 References

1. [AWS real time use cases to test your skills][1]

### 🏷️ Metadata

**Level**: 300

[1]: https://github.com/miztiik/aws-real-time-use-cases
[2]: https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups.html
[3]: https://sourceforge.net/projects/rump/
[100]: https://www.udemy.com/course/aws-cloud-security/?referralCode=B7F1B6C78B45ADAF77A9
[101]: https://www.udemy.com/course/aws-cloud-security-proactive-way/?referralCode=71DC542AD4481309A441
[102]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579
[103]: https://www.udemy.com/course/aws-cloudformation-basics?referralCode=93AD3B1530BC871093D6
[899]: https://www.udemy.com/user/n-kumar/
[900]: https://ko-fi.com/miztiik
[901]: https://ko-fi.com/Q5Q41QDGK
