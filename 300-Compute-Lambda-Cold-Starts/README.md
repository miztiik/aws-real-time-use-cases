# Lambda experiencing Cold Starts

## 🔥 Scenario

Your customer has some fuctions that are taking longer than expected to execute. Upon investigating the issue, you find some number of executions are timing out, Customer has a timeout limit of `60` seconds. You suspect this might be one of the issues, but you also want to rule out any genuine coldstart issues.

Further investigations, reveal that some 'APIGW to Lambda' executions have a `12 to 15` seconds cold start. But your customer is reporting that they are lot of cold starts.

Can you investigate and find out, how many invovations over a 24Hour period are indeed cold starts?

## 🎯Solutions

1. Find out more information about Lambda Language, Package Size, dependancies etc.,
1. You can add a `counter` outside the main handler. Anytime a new execution environment is spun up it should +1 the `counter`.

1. use a CloudWatch Insights for getting the cold starts. The records matched with following query will be the number of coldstarts,

    ```bash
    fields @requestId, @logStream, @initDuration | filter @initDuration > 0
    ```

Additional Actions

- Can any of the initializations be moved outside the main handler?

Setup Cloudwatch Insights

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

### 👋 Buy me a coffee

Buy me a [coffee ☕][900].

### 🏷️ Metadata

**Level**: 300

[100]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579

[200]: https://github.com/miztiik/aws-real-time-use-cases/issues

[900]: https://ko-fi.com/miztiik
