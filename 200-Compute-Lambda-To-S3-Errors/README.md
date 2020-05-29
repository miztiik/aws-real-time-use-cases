# Lambda Request Response Payload Errors

## 🔥 Scenario

Your customer has the following setup,
> Microservice Application logs -> CloudWatch Logs -> Subscription with filter -> Kinesis Firehose -> Transformation Lambda -> S3

![miztiik_lambda_request_response_payload_errors](images/miztiik_lambda_request_response_payload_errors_02.png)

You customer is reporting they are getting errors. Upon looking into the lamdba logs, they are seeing this entry

```log
Execution failed ... payload is too large ...
```

They have tried to lower the buffer for the lambda in the Firehose stream configuration to be at it's minimum - `1MB` . However, even with just `1MB` of request data, the unzipped processed output turns out to be larger than what Lambda expects.

What are their options to fix this issue ?

## 🎯Solutions

- Check the Lambda [docs][1] for the limits
- Check if they can split the response payload before storing in S3

### 🧪Sample Testing - (WIP)

  Using a Flask route like this:

```py
@app.route('/giant')
def giant():
    payload = "x" * int(request.args.get('size', 1024 * 1024 * 6))
    return payload
```

Now use `curl`, to generate a big response payload,

```bash
$ curl -s 'https://YOUR-END-POINT/mystique/giant?size=4718559' | wc -c
 4718559
$ curl -s 'https://YOUR-END-POINT/mystique/giant?size=4718560'
{"message": "Internal server error"}
```

Checking the logs, for error messages

### 📚 References

1. [Blog: Lambda Payload Limit][2]

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

### 👋 Buy me a coffee

Buy me a [coffee ☕][900].

### 🏷️ Metadata

**Level**: 200

[1]: https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-limits.html
[2]: https://dev.to/theburningmonk/hit-the-6mb-lambda-payload-limit-here-s-what-you-can-do-2ea2

[100]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579

[200]: https://github.com/miztiik/aws-real-time-use-cases/issues

[900]: https://ko-fi.com/miztiik
