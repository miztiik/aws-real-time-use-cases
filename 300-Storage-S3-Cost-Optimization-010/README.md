# Processing millions of objects

## 🔥 Scenario

Mystique Corp Unicorn App is ingesting 1200 Millions of objects(5Kb each) per month in S3 bucket through Firehose. These objects are needed by the by the back end team for near real-time processing.(~`<1min`>) First the objects will be retrieved and then processed by multiple lambda functions. At this moment, there will be 5 unique operations(5 different lambdas) to be performed. The team is worried about S3 `GET` costs. As this leads to `6 Billion`(12000 * 5) calls to S3

As their AWS Cloud Consultant can you suggest an architecture that is cheaper to process these event objects?


## 🎯Solutions

**Option:1** They can consider using SNS to fan-out the event and trigger multiple lambda functions

## 📌 Who is using this

This repository teaches developers, Solution Architects & Ops Engineers how to build complete architecture in AWS. Based on that knowledge these Udemy [course #1][103], [course #2][102] have been created to enhance your skills.

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it is a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here](/issues)

### 👋 Buy me a coffee

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Q5Q41QDGK) Buy me a [coffee ☕][900].

### 📚 References

1. [AWS real time use cases to test your skills][1]

### 🏷️ Metadata

**Level**: 300

![miztiik-real-time-use-cases](https://img.shields.io/badge/Miztiik:Real--Time--Use--Cases:Level-300-green)

[1]: https://github.com/miztiik/aws-real-time-use-cases
[100]: https://www.udemy.com/course/aws-cloud-security/?referralCode=B7F1B6C78B45ADAF77A9
[101]: https://www.udemy.com/course/aws-cloud-security-proactive-way/?referralCode=71DC542AD4481309A441
[102]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579
[103]: https://www.udemy.com/course/aws-cloudformation-basics?referralCode=93AD3B1530BC871093D6
[899]: https://www.udemy.com/user/n-kumar/
[900]: https://ko-fi.com/miztiik
[901]: https://ko-fi.com/Q5Q41QDGK
