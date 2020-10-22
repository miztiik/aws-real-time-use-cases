# How To Secure DNS Queries

## 🔥 Scenario

During a recent security audit at Mysique Corp, the security architect found that their microservice app is vulnerable to DNS cache poisoining. They were informed to implement `DNSSEC` as a potential mitigation solution. Can you help them understand what is `DNSSEC` and how it may help avoid DNS cache poisoining.

## 🎯Solutions

The DNS protocol _was_ designed to be a trusting protocol. Any responses received by a DNS server after it asks a question are assumed to be a genuine reply. A man in the middle can easily emulate a legititate DNS server and intercept the traffic and responsd with a poisoned response. Cache-Poisoning attacks are more widespread and are now easier to conduct. Port randomization on recursive DNS resolvers has helped a little, but does not address the real problem.

There are multiple exposures to cache poisoning.

- If ISP nameservers get poisoned, customers may not be able to get to `www.miztiik.in/shopping-cart` and buy things.
- If ISP nameservers get poisoned, customers of S3 could easily be duped into thinking they are downloading genuine files from S3, when in fact they are being downloaded from a _poisoned well_.
- Cookie theft is a possibility, If a customer has cookies set by `miztiik.in`, they will offer these up to any IP address that www.miztiik.in resolves to (irrespective of the server status: _bogus_ or _genuine_)

DNSSEC works by digitally signing records for DNS lookup using public-key cryptography. The correct DNSKEY record is authenticated via a chain of trust, starting with a set of verified public keys for the DNS root zone which is the trusted third party. Domain owners generate their own keys, and upload them using their DNS control panel at their domain-name registrar, which in turn pushes the keys via secDNS to the zone operator (e.g., Verisign for .com) who signs and publishes them in DNS.<sup>Ref[2]</sup> DNSSEC does not provide confidentiality of data; in particular, all DNSSEC responses are authenticated but not encrypted.

This [site][3] documents how you can test for DNSSEC in a given site

The following commands shows a sample test, update the parameters to suit your needs

```bash
dig +dnssec +cdflag @localhost -p 8853 www.miztiik.in
```

## 📌 Who is using this

This repository teaches developers, Solution Architects & Ops Engineers how to build complete architecture in AWS. Based on that knowledge these Udemy [course #1][103], [course #2][102] have been created to enhance your skills.

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

### 👋 Buy me a coffee

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Q5Q41QDGK)Buy me a [coffee ☕][900].

### 📚 References

1. [DNSSEC Wiki][1]
2. [DNSSEC Test][2]

### 🏷️ Metadata

**Level**: 200

[1]: https://github.com/miztiik/aws-real-time-use-cases
[2]: https://en.wikipedia.org/wiki/Domain_Name_System_Security_Extensions
[3]: https://www.internetsociety.org/resources/deploy360/2013/dnssec-test-sites/
[100]: https://www.udemy.com/course/aws-cloud-security/?referralCode=B7F1B6C78B45ADAF77A9
[101]: https://www.udemy.com/course/aws-cloud-security-proactive-way/?referralCode=71DC542AD4481309A441
[102]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579
[103]: https://www.udemy.com/course/aws-cloudformation-basics?referralCode=93AD3B1530BC871093D6
[200]: https://github.com/miztiik/cfn-challenges/issues
[899]: https://www.udemy.com/user/n-kumar/
[900]: https://ko-fi.com/miztiik
[901]: https://ko-fi.com/Q5Q41QDGK
