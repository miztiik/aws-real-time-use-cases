# ElasticSearch-CustomerQuery

## Scenario
A legacy data migration project has migrated customer data from DB2 to ElasticSearch using Datastream. The ElasticSearch has ben hosted in AWS. The client has introduced a new user interface for its customers. This interface allows the customer to enter a valid search string, all customer or transaction data in the ElasticSearch matching to the search criteria are returned back to the customer.

The client has proposed that a search system be created that takes minimal information as an input (one or more of the fields about the customer), and then returns a response with all matching records related to the entered search criteria.


## Next Steps
1. Write a lambda function in the language of your choice that takes the search criteria fields as input. Based on the input fields it builds a dynamic query that queries the Elasticsearch.
2. Create an API Gateway that will invoke the Lambda function. The API gateway should be configured to handle GET and POST requests.
3. Test the application. Postman is a convinient tool that can be used for testing this API.
4. The response from the ElasticSearch can be modified to return only those fields that the customer will be interested in.

### Contact Us
You can reach out to us to get more details through [here](https://www.youtube.com/channel/UC_evcfxhjjui5hChhLE08tQ/about).

