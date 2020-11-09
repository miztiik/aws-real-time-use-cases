# What are some best practices in caching?

## 🔥 Scenario

Mystique Corp is developing a cloud native application. They would like to use caching strategies to improve the performance of the application. They are looking for some guidance on what are the caching best practices.

As their cloud consultant can you assist them?.

## 🎯 Solutions

![Miztiik Automation: What to Cache](images/miztiik_what_to_cache_architecture_00.png)

- Understand the frequency of change of underlying data
- Set appropriate TTLs on keys that match that frequency
- Choose appropriate eviction policies that are aligned with application requirements
- Isolate your cluster by purpose (for example, cache cluster, queue, standalone database, and so on)
- Maintain cache freshness with write-throughs
- Performance test and size your cluster appropriately
- Monitor Cache HIT/MISS ratio and alarm on poor performance
- Use failover API to test application resiliency

After decidin on those items, let us assume the application is a ecommerce site, then we can follow a similar strategy

- _product categories_ (user longer TTLs)
- _product images_ (user longer TTLs)
- _product details_ (user longer TTLs)
- _database result sets_: (user shorter TTLs)
- _API responses_ (user shorter TTLs)

**Anything that is cacheable! should be cached**. Also remember _cache invalidation_ is a hard problem.

## 📌 Who is using this

This repository teaches developers, Solution Architects & Ops Engineers how to build complete architecture in AWS. Based on that knowledge these Udemy [course #1][103], [course #2][102] have been created to enhance your skills.

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here](/issues)

### 👋 Buy me a coffee

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Q5Q41QDGK)Buy me a [coffee ☕][900].

### 📚 References

1. [AWS real time use cases to test your skills][1]

### 🏷️ Metadata

**Level**: 300

[1]: https://github.com/miztiik/aws-real-time-use-cases
[100]: https://www.udemy.com/course/aws-cloud-security/?referralCode=B7F1B6C78B45ADAF77A9
[101]: https://www.udemy.com/course/aws-cloud-security-proactive-way/?referralCode=71DC542AD4481309A441
[102]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579
[103]: https://www.udemy.com/course/aws-cloudformation-basics?referralCode=93AD3B1530BC871093D6
[899]: https://www.udemy.com/user/n-kumar/
[900]: https://ko-fi.com/miztiik
[901]: https://ko-fi.com/Q5Q41QDGK
