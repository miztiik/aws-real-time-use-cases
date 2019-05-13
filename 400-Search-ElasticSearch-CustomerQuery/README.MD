# ElasticSearch-CustomerQuery

## Scenario
Your team is working on a legacy data migration project that has migrated data from DB2 to ElasticSearch using Streamsets. You have been told to use AWS managed ElasticSearch to store the migrated data. 
Your customer is planning to introduce a new user interface for its end-users. This interface should allow the end-users to enter a valid search string, all transaction data in the ElasticSearch matching the search criteria should be returned back to the end-user.

Your customer has asked you to create a search system that will take in minimal information as an input (one or more of the fields about the customer), and then will return a response with all matching records related to the entered search criteria.


## Next Steps
1. Write a lambda function in the language of your choice that takes the search criteria fields as input. Based on the input fields it builds a dynamic query that queries the Elasticsearch.
2. Create an API Gateway that will invoke the Lambda function. The API gateway should be configured to handle GET and POST requests.
3. Test the application. Postman is a convenient tool that can be used for testing this API.
4. The response from the ElasticSearch can be modified to return only those fields that the end-user will be interested in.

### Contact Us
You can reach out to us to get more details through [here](https://www.youtube.com/channel/UC_evcfxhjjui5hChhLE08tQ/about).

