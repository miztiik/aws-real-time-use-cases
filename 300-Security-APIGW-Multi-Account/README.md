# Securely share API GW to multiple AWS Accounts

## 🔥 Scenario

You client is asking you to to expose a private API[in `Account A`] to another AWS Account[`Account B`]. For example,

```sh
[Lambda - API GW (Account A) ] -> [Private API Endpoint (Account B/VPC-A)]
```

Can you help them with this request?

## 🎯Solutions

Using [resource policies][1], you can allow or deny access to your API from selected VPCs and VPC endpoints, including across AWS accounts. Each endpoint can be used to access multiple private APIs. You can also use AWS Direct Connect to establish a connection from an on-premises network to Amazon VPC and access your private API over that connection.

In addition to the above, Make sure the following is done,

- Both API GW & Lambda has to be in the same region
  - VPC peering will be required if they are not in the same region
- `Account A` API's resource policy grants access to the VPCe in `Account B`

### Additional References

1. <https://aws.amazon.com/premiumsupport/knowledge-center/api-gateway-vpc-connections>
1. <https://aws.amazon.com/premiumsupport/knowledge-center/api-gateway-private-endpoint-connection>

## 👋 Buy me a coffee

Buy me a coffee ☕ through [Paypal](https://paypal.me/valaxy), _or_ You can reach out to get more details through [here](https://youtube.com/c/valaxytechnologies/about).

### 🏷️ Metadata

**Level**: 300

[1]:<https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-private-apis.html>
