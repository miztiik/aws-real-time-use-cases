# Lambda experiencing Cold Starts

## 🔥 Scenario

Your customer has some fuctions that are taking longer than expected to execute. Upon investigating the issue, you find some number of executions are timing out, Customer has a timeout limit of `60` seconds. You suspect this might be one of the issues, but you also want to rule out any genuine coldstart issues.

Further investigations, reveal that some 'APIGW to Lambda' executions have a `12 to 15` seconds cold start. But your customer is reporting that they are lot of cold starts.

Can you investigate and find out, how many invovations over a 24Hour period are indeed cold starts?

## 🎯Solutions

1. Find out more information about Lambda Language, Package Size, dependancies etc.,
1. You can add a `counter` outside the main handler. Anytime a new execution environment is spun up it should +1 the `counter`.

1. use a CloudWatch Insights for getting the cold starts. The records matched with following query will be the number of coldstarts,

    ```
    fields @requestId, @logStream, @initDuration | filter @initDuration > 0
    ```

Additional Actions

- Can any of the initializations be moved outside the main handler?

Setup Cloudwatch Insights

## 👋 Buy me a coffee

Buy me a coffee ☕ through [Paypal](https://paypal.me/valaxy), _or_ You can reach out to get more details through [here](https://youtube.com/c/valaxytechnologies/about).

### ℹ️ Metadata

**Level**: 300
