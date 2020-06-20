# Lambda Errors `TooManyRequestsException`

## 🔥 Scenario

Mystique Corp is testing a new micro-service based on AWS Lambda. Recently, when they were testing out their lambda functions, they are getting `TooManyRequestsException` errors. Their function is with a reserved concurrency of `1`. Can you help them in understanding why this happens?

## 🎯Solutions

If you make an API call using an AWS SDK and the call fails, the SDK automatically retries the call. How long and how many times the SDK retries is determined by settings that vary among each SDK. Check the default values [here][1]

The retry count and timeout settings of the SDK should allow enough time for your API call to get a response. To determine the right values for each setting, test different configurations and get the following information:

- Average time to establish a successful connection
- Average time that a full API request takes (until it's successfully returned)
- Whether retries should be made by the SDK or code

```py
# max_attempts: retry count / read_timeout: socket timeout / connect_timeout: new connection timeout

from botocore.session import Session
from botocore.config import Config

s = Session()
c = s.create_client('s3', config=Config(connect_timeout=5, read_timeout=60, retries={'max_attempts': 2}))
```

**Note:**
A low Lambda function timeout can cause healthy connections to be dropped prematurely. If that's happening in your use case, increase the function timeout setting to allow enough time for your API call to get a response. Use this formula to estimate the base time needed for the function timeout:

>```Retries * (Connection timeout + Socket timeout)```
  
For example, say that the SDK is configured for 3 retries, a connection timeout of 10 seconds, and a socket timeout of 30 seconds. In that case, your Lambda function timeout should be at least 120 seconds:
  
>`3 * (10 + 30) = 120 seconds`  
  
Add an additional margin of time (for example, 20 seconds) to handle the rest of the code execution:

>`120 + 20 = 140 seconds`

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

### 👋 Buy me a coffee

Buy me a [coffee ☕][900].

### 🏷️ Metadata

**Level**: 300

[1]: https://aws.amazon.com/premiumsupport/knowledge-center/lambda-function-retry-timeout-sdk/

[100]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579

[200]: https://github.com/miztiik/aws-real-time-use-cases/issues

[900]: https://ko-fi.com/miztiik

 I’m trying to understand Lambda’s TooManyRequestsException.
 I have a Function with a reserved concurrency of 1.
 I made a single invocation of this function using the AWS CLI, which, in seeing CloudWatch logs, executed successfully,
 however the CLI threw me the following error:

$ aws lambda invoke --function-name ZahlerLambdaDLQRedrive \
--payload "$(echo '{"action":"re-drive"}' | base64)" \
--region us-east-1 \
--profile pcogs-prod \
re-drive-result.json

$ aws --cli-read-timeout 160 --cli-connect-timeout 160 lambda invoke --function-name DelayFunction --log-type Tail outfile

An error occurred (TooManyRequestsException) when calling the Invoke operation (reached max retries: 2): Rate Exceeded.

<https://aws.amazon.com/premiumsupport/knowledge-center/lambda-function-retry-timeout-sdk/>

aws lambda invoke --function-name DelayFunction \
--region us-east-1 \
re-drive-result.json

aws lambda invoke \
    --cli-binary-format raw-in-base64-out \
    --function-name DelayFunction \
    --payload '{ "name": "Mystique" }' \
    response.json

# !/bin/bash
aws lambda invoke --function-name my-function --payload '{"key": "value"}' out
sed -i'' -e 's/"//g' out
sleep 15
aws logs get-log-events --log-group-name /aws/lambda/my-function --log-stream-name $(cat out) --limit 5
