
# Monitoring MicroServices - Custom Metrics, Alarms & Notifications

## Scenario

Your client runs their application as micro services. All the micro services are designed to push their logs to a centralized location. The devs have added metadata to the logs to make it easier to catch errors and debug from the application. Your clients wants you to put up monitoring systems in place. The monitoring system should generate alarms based on the errors/metadata and notify the developers.

## Next Steps

1. This can be achieved through AWS Cloudwatch and SNS. Install the cloudwatch unified agent on the instances running the microservices. Ensure you configure the agent to pick up the application logs and send to the custom namespace(_for example: `LogMetrics`_)

1. Create log-groups for each service. Make a list of the following,
   - All the log-group names from which metrics needs to be collected.
   - All the error codes or messages for which metrics/alarms need to be created.
   - A list of emails ids that need to be notified incase of errors.

1. Create a Cloudformation script for creating custom metric filters, under Properties the Log-group name created in Step 2, that will contain the error message needs to be mentioned. Specify the filter pattern for the error code. Under MetricTransformation, you need to specify Namespace as `LogMetrics` along with the appropriate metrics name and value.Create MetricFilters one for each of the error that needs to be captured.

1. Create cloudformation script for Cloudwatch alarms. Each alarm needs to specify the metric it is associated with, created in Step 3 above. Provide all the details for alarm like Name, Statistics, EvaluationPeriods, Threshold, TreatMissingData,ComparisonOperator and AlarmActions. This may be different for each alarm depending on how the customer wants to be notified. The AlarmAction must have a reference to the SNS Topic that will be created in the next step.

1. Create a cloudformation script for SNS Topic and SNS Subscriptions mentioning protocol as email and endpoint as the email id in which the notifications need to be sent.

## 👋 Buy me a coffee

Buy me a coffee ☕ through [Paypal](https://paypal.me/valaxy), _or_ You can reach out to get more details through [here](https://youtube.com/c/valaxytechnologies/about).

### ℹ️ Metadata

**Level**: 300
