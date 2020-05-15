# DynamoDB Global Secondary Index Slowness

## 🔥 Scenario

Your customer has a large DynamoDB table with provisioned capacity. They have new query requirement and to support that query, they created a new Global Secondary Index(GSI). The process of GSI creation started few hours ago but still has not completed. They are not sure, if they have done anything wrong and unable to delete the index as well.

Can you help them?

## 🎯Solutions

DynamoDB allocates the compute and storage resources that are needed for building the new [index][1]. During the resource allocation phase, the `IndexStatus` attribute is `CREATING` and the `Backfilling` attribute is false. While the index is in the resource allocation phase, you can't delete the index or delete its parent table.

If you are adding a global secondary index to a very large table, it might take a long time for the creation process to complete. To monitor progress and determine whether the index has sufficient write capacity, consult the following Amazon CloudWatch metrics:

- [OnlineIndexPercentageProgress][2]
- OnlineIndexConsumedWriteCapacity
- OnlineIndexThrottleEvents

## 👋 Buy me a coffee

Buy me a coffee ☕ through [Paypal](https://paypal.me/valaxy), _or_ You can reach out to get more details through [here](https://youtube.com/c/valaxytechnologies/about).

### 🏷️ Metadata

**Level**: 300

[1]: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GSI.OnlineOps.html#GSI.OnlineOps.Creating
[2]: https://docs.amazonaws.cn/en_us/amazondynamodb/latest/developerguide/metrics-dimensions.html#dynamodb-metrics
