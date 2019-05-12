# Custom Log metrics and alarms

## Scenario
New microservices have been deployed that are logging several application specific errors that need to be captured and relevant teams need to be notified for the errors.
Customer wants logging and notification process to be put into place that will monitor these microservices.

## Next Steps
1. This can be achieved through AWS Cloudwatch and SNS. Install the cloudwatch agent on the instances running the microservices and create log-groups for each service.

2. Make a list of the following,
   a) All the log-group names from which metrics needs to be collected.
   b) All the error codes or messages for which metrics/alarms need to be created.
   c) A list of emails ids that need to be notified incase of errors.
   
3. Create a Cloudformation script for creating custom metric filters, under Properties the Log-group name created in Step 2, that will contain the error message needs to be mentioned. Specify the filter pattern for the error code. Under MetricTransformation, you need to specify Namespace as "LogMetrics" along with the appropriate metrics name and value.Create MetricFilters one for each of the error that needs to be captured.

4. Create cloudformation script for Cloudwatch alarms. Each alarm needs to specify the metric it is associated with, created in Step 3 above. Provide all the details for alarm like Name, Statistics, EvaluationPeriods, Threshold, TreatMissingData,ComparisonOperator and AlarmActions. This may be different for each alarm depending on how the customer wants to be notified. The AlarmAction must have a reference to the SNS Topic that will be created in the next step.

5. Create a cloudformation script for SNS Topic and SNS Subscriptions mentioning protocol as email and endpoint as the email id in which the notifications need to be sent.



### Contact Us
You can reach out to us to get more details through [here](https://www.youtube.com/channel/UC_evcfxhjjui5hChhLE08tQ/about).

