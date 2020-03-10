# How to secure API Gateway

Your APIs are publicly accessible. What is the best way to secure the API Gateway. In addition to securing access to the API GW, how can you to throttle high volume requests.

![](https://cdn-images-1.medium.com/max/2400/0*vXjRjS4vzOV9TFBh.)

### Steps for Secure Control access to your API

1. Use Resource Policy to an API to restrict access to a specific Amazon VPC or VPC endpoint.
1. By useing Cross-origin resource sharing (CORS) lets you to control how your REST API responds to cross-domain resource requests.
1. Use SSL/TLS 1.2 certificates to encrypt HTTP requests/messages between   client and server communication.
1. Use AWS WAF to protect your API Gateway API from common web exploits.
1. Configure API Gateway with AWS CloudTrail to give you a full auditable history (create, modify, delete, or deploy REST APIs)of the changes to your REST APIs.
1. Create a own aws signature version or lambda authorizes to support your own bearer token stategy.
1. Use API Gateway throttling settings for each method or route in your  APIs for rate limit and a burst for limit per second for each method in your REST APIs and each route in WebSocket APIs.
   - For example, API owners can set a rate limit of 1,000 requests per second for a specific method in their REST APIs, and also configure Amazon API Gateway to handle a burst of 2,000 requests per second for a few seconds
1. Use `Usage Plans` to provide API keys to your customers and then set throttling limits for individual API keys.
    - Throttling ensures that API traffic is controlled to help your backend services maintain performance and availability.
  