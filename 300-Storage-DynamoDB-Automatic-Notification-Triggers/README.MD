# DynamoDB - Automatic Notification Triggers based on Event Time

## 🔥 Scenario

<<<<<<< Updated upstream
Your DynamoDB has lot of items. One of the attribute for the items can have a value of `NEW` or `PROCESSED`. All new items are written with value of `NEW`. During the day, other business services process the item and change the status to `PROCESSED`. Occasionally few items gets missed or does not get processed within 24 hours.

Your client expect a daily clean up mechanism, which will process or trigger the processing engine(_say SNS notification_) only for the items with status `NEW` and older than `24 Hours`. This activity will have to be done everyday and cost effectively
=======

Your DynamoDB has lot of items. One of the attributes for the items can have a value of `NEW` or `PROCESSED`. All new items are written with value of `NEW`. During the day, other business services process the item and change the status to `PROCESSED`. Occasionally few items gets missed or does not processed within 24 hours.

Your client expect a daily clean up mechanism, which will process/trigger the processing engine(_say SNS notification_) only for the items with status `NEW` and older than `24 Hours`. This activity will have to be done everyday and cost effectively.
>>>>>>> Stashed changes

## 📋 Next Steps

1. What actions will you take to ?
1. What order will you take those actions?
1. What controls will you put in place to prevent such events?

## 👋 Buy me a coffee

Buy me a coffee ☕ through [Paypal](https://paypal.me/valaxy), _or_ You can reach out to get more details through [here](https://youtube.com/c/valaxytechnologies/about).

### ℹ️ Metadata

**Level**: 300
