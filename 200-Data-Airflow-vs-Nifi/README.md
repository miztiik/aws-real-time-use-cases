# Data Management - Apache Airflow vs Apache Nifi

## 🔥 Scenario

Miztiik Unicorn team is looking for your assistance in choosing the right tool to manage their data needs. They heard that Apache Airflow is gainining in popularity, whereas some developers were thinking of using Apache Nifi. Can you help them with a summary of when to use these tools?


## 🎯Solutions

As companies grow, their workflows become more complex, comprising of many processes with intricate dependencies that require increased monitoring, troubleshooting, and maintenance. _Without a clear sense of data lineage, accountability issues can arise, and operational metadata can be lost_. This is where these tools come into play with their directed acyclic graphs (DAGs), data pipelines, and workflow managers.

Complex workflows can be represented through DAGs. DAGs are graphs where information must travel between the vertices in a specific direction, but there is no way for information to travel through the graph in a loop that circles back to the starting point. _The building blocks of DAGs are data pipelines or following processes where the output from one process becomes the input for the next_. Building these pipelines can be tricky, but luckily there are several open-source workflow managers available, allowing programmers to focus on individual tasks and dependencies


 - **Apache Airflow:**

    - Airflow is a workflow management tool. The workflows are expressed as code, in Python. It comes with its own scheduler.
    - **Easy-to-use UI**. You can easily see the task hierarchy, task logs, historical runs & statuses, what code is being run. Using this UI, you can also easily rerun historical tasks, change their states, mark tasks as complete, force tasks to run, etc. Airflow’s GUI is for monitoring, troubleshooting, and administration.

    Check out _best practices for Airflow[3]_

 - **Apache Nifi:**

    - Apache NiFi aims to be helpful to connect systems from whereever data is created/collected back to and through the various places that it will get consumed. It is a dataflow management broker.
    
    It can listen for data or go grab data, transform or enrich data and route to various destinations. It is not intended to schedule jobs but rather allows you to collect data from multiple locations, define discrete steps to process that data and route that data to different destinations.

### Conclusion:
    If your use case is more like, where the data has already arrived and you want to control jobs and such then _Airflow_ is good at that.

    If your use case is more like the _flow management_ aspects, then NiFi is probably a great choice. 
    
    There will no doubt be some overlap but ultimately it comes down to your use case.

## 📌 Who is using this

This repository teaches developers, Solution Architects & Ops Engineers how to build complete architecture in AWS. Based on that knowledge these Udemy [course #1][103], [course #2][102] have been created to enhance your skills.

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it is a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here](/issues)

### 👋 Buy me a coffee

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Q5Q41QDGK) Buy me a [coffee ☕][900].

### 📚 References

1. [AWS real time use cases to test your skills][1]
1. [Apache Airflow][2]
1. [Apache Nifi][3]
1. [ETL best practices with Airflow documentation site][4]

### 🏷️ Metadata

**Level**: 300

![miztiik-real-time-use-cases](https://img.shields.io/badge/Miztiik:Real--Time--Use--Cases:Level-300-green)

[1]: https://github.com/miztiik/aws-real-time-use-cases
[2]: https://airflow.apache.org/
[3]: https://nifi.apache.org/
[4]: https://gtoonstra.github.io/etl-with-airflow/
[100]: https://www.udemy.com/course/aws-cloud-security/?referralCode=B7F1B6C78B45ADAF77A9
[101]: https://www.udemy.com/course/aws-cloud-security-proactive-way/?referralCode=71DC542AD4481309A441
[102]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579
[103]: https://www.udemy.com/course/aws-cloudformation-basics?referralCode=93AD3B1530BC871093D6
[899]: https://www.udemy.com/user/n-kumar/
[900]: https://ko-fi.com/miztiik
[901]: https://ko-fi.com/Q5Q41QDGK
