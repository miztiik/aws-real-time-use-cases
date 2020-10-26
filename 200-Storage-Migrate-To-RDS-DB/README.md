# How To Migrate From MySQL DB to Amazon RDS MySQL

## 🔥 Scenario

Mystique Unicorn App is a building new application based on microservice architectural pattern. The backend for this app is currently running an MySQL DB hosted on EC2 instances. Offlate, the team is finding it hard to find balance their time between managing the MySQL DB cluster at production scale and doing the app development.

During a recent conference they learnt that aws offers Amazon RDS MySQL, a managed database service that is MySQL DB compatible.

As an cloud consultant to Mystique Corp, can you help their dev team to migrate from MySQL DB to RDS MySQL and leave the heavy lifting to AWS?

## 🎯Solutions

There are many ways to migrate from MySQL DB to Amazon RDS MySQL. If the database size is medium to large, then you can consider using AWS Database Migration Service[2]. This blog post[3] shows you how to use DMS to migrate.

If in case your MySQL DB database is fairly small in size, then you can consider using `mysqldump`. But the downside of using this option is that it can impact the performance of your running database. Not only do the tools create traffic for a running database instance, they also force the database to read all data through memory. When MySQL DB reads infrequently used data, it can evict more frequently accessed data, causing a deterioration in performance for the database’s regular workload.

Connect to your mysql instance, ensure your MySQL DB service is running and run the following commands. _You will be prompted to enter the root password. After successful authentication, the dump process will start. Depending on the database size, the process can take some time._

You must create any stored procedures, triggers, functions, or events manually in your Amazon RDS database. If you have any of these objects in the database that you are copying, then exclude them when you run mysqldump by including the following parameters with your mysqldump command: `--routines=0 --triggers=0 --events=0`.

```bash
# sudo su # If necessary create the output directory
mkdir -p /var/log/mysqldb_backup
cd /var/log/mysqldb_backup
mysqldump -u root -p --databases miztiik_db --single-transaction --order-by-primary > miztiik_db_$(date +%Y%m%d).sql
# Backup ALL Databases
mysqldump -u root -p --all-databases --single-transaction --order-by-primary > all_databases_$(date +%Y%m%d).sql
# Let us create a compressed archive
mysqldump -u root -p --databases miztiik_db --single-transaction --order-by-primary > miztiik_db_$(date +%Y%m%d).sql.gz
```

Now that we have created dump of our database, We are ready to restore this data to the RDS MySQL. Ensure you have connectivity to your RDS instance and able to access the sql dump file as well.

```bash
# In case, if you want to drop your existing database
# DROP DATABASE IF EXISTS miztiik_db;
cd /var/log/mysqldb_backup
RDS_DB_HOST="database-1.ca64q8ficuhu.us-east-1.rds.amazonaws.com"
RDS_DB_USER_NAME="mysqladmin"
RDS_DB_PASSWORD="YOUR_RDS_DB_PASSWORD"
RDS_DB_NAME="miztiik_db"
DB_DUMP_FILE="/var/log/mysqldb_backup/miztiik_db-20201026.sql"

mysql -h $RDS_DB_HOST -u $RDS_DB_USER_NAME -p$RDS_DB_PASSWORD -e "create database $RDS_DB_NAME";
mysql -h $RDS_DB_HOST -u $RDS_DB_USER_NAME -p$RDS_DB_PASSWORD $RDS_DB_NAME < $DB_DUMP_FILE
```

## 📌 Who is using this

This repository teaches developers, Solution Architects & Ops Engineers how to build complete architecture in AWS. Based on that knowledge these Udemy [course #1][103], [course #2][102] have been created to enhance your skills.

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

### 👋 Buy me a coffee

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Q5Q41QDGK)Buy me a [coffee ☕][900].

### 📚 References

1. [AWS real time use cases to test your skills][1]
2. [AWS Database Migration Service][2]
3. [AWS Docs: mysqldump][4]
4. [Importing data from a MySQL or MariaDB DB to an Amazon RDS MySQL or MariaDB][5]

### 🏷️ Metadata

**Level**: 200

[1]: https://github.com/miztiik/aws-real-time-use-cases
[2]: https://aws.amazon.com/dms/
[3]: https://github.com/miztiik/mysql-to-rds
[4]: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Exporting.NonRDSRepl.html
[5]: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MySQL.Procedural.Importing.SmallExisting.html
[100]: https://www.udemy.com/course/aws-cloud-security/?referralCode=B7F1B6C78B45ADAF77A9
[101]: https://www.udemy.com/course/aws-cloud-security-proactive-way/?referralCode=71DC542AD4481309A441
[102]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579
[103]: https://www.udemy.com/course/aws-cloudformation-basics?referralCode=93AD3B1530BC871093D6
[200]: https://github.com/miztiik/cfn-challenges/issues
[899]: https://www.udemy.com/user/n-kumar/
[900]: https://ko-fi.com/miztiik
[901]: https://ko-fi.com/Q5Q41QDGK
