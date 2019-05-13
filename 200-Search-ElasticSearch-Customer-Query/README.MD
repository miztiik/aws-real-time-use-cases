# ElasticSearch Customer Query

## Scenario

Your team is working on a data migration project that has to migrate data from DB2 to ElasticSearch using Streamsets. Your client requested you to use AWS managed ElasticSearch to store the migrated data. Your customer is planning to introduce a new user interface for their end-users. This interface will allow the end-users to query their personal transaction data. This search should be executed in the ElasticSearch  and all the matching results should be returned back to the end-user.

You have been asked by your customer to create a search system that will take in minimal information as an input (one or more of the fields about the customer), and then will return a response with all matching records related to the entered search criteria.

## Solution

1. Write a lambda function in the language of your choice that takes the search criteria fields as input. Based on the input fields it builds a dynamic ES query.
1. Create an API Gateway that will invoke the Lambda function. The API gateway should be configured to handle GET and POST requests.
1. Test the application.
    _Postman is a convenient tool that can be used for testing this API._
1. The response from the ElasticSearch can be modified to return only those fields that the end-user will be interested in.

### Contact Us

You can reach out to us to get more details through [here](https://youtube.com/c/valaxytechnologies/about).

### Metadata

**Level**: 100
