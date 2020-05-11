# LoadBalancer Request-Response Header Limit

## 🔥 Scenario

Your client is trying to figure out what is AWS's maximum request header limit for inbound requests. Their users are having issues after logging in.

## 🎯Solutions

The Application Load Balancers have [hard limits][1] on HTTP headers that cannot be changed. Understand what payload is sent to the ALB by the application and try to reduce the size of header to keep it within the limit.

### Test the solution

Use curl to generate a paylod and sent to loadbalancer and enable logs to capture the errors at both side.

## 👋 Buy me a coffee

Buy me a coffee ☕ through [Paypal](https://paypal.me/valaxy), _or_ You can reach out to get more details through [here](https://youtube.com/c/valaxytechnologies/about).

### 🏷️ Metadata

**Level**: 100

[1]: https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html#http-header-limits
