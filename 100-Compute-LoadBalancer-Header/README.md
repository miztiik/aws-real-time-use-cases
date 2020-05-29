# LoadBalancer Request-Response Header Limit

## 🔥 Scenario

Your client is trying to figure out what is AWS's maximum request header limit for inbound requests. Their users are having issues after logging in.

## 🎯Solutions

The Application Load Balancers have [hard limits][1] on HTTP headers that cannot be changed. Understand what payload is sent to the ALB by the application and try to reduce the size of header to keep it within the limit.

### Test the solution

Use curl to generate a payload and sent to load-balancer and enable logs to capture the errors at both side.

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

### 👋 Buy me a coffee

Buy me a [coffee ☕][900].

### 🏷️ Metadata

**Level**: 300

[1]: https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html#http-header-limits

[100]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579

[200]: https://github.com/miztiik/aws-real-time-use-cases/issues

[900]: https://ko-fi.com/miztiik
