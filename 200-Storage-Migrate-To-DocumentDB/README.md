# How To Migrate From MongoDB to Amazon DocumentDB

## 🔥 Scenario

Mystique Unicorn App is a building new application based on microservice architectural pattern. The backend for this app is currently running an Mongodb hosted on EC2 instances. Offlate, the team is finding it hard to find balance their time between managing the mongodb cluster at production scale and doing the app development.

During a recent conference they learnt that aws offers Amazon DocumentDB, a managed database service that is mongodb compatible.

As an cloud consultant to Mystique Corp, can you help their dev team to migrate from Mongodb to DocumentDB and leave the heavy lifting to AWS?

## 🎯Solutions

There are many ways to migrate from MongoDB to Amazon DocumentDB. If the database size is medium to large, then you can consider using AWS Database Migration Service[2]. This blog post[3] shows you how to use DMS to migrate.

If in case your mongodb database is fairly small in size, then you can consider using `mongodump` and `mongorestore`. But the downside of using this option is that it can impact the performance of your running database. Not only do the tools create traffic for a running database instance, they also force the database to read all data through memory. When MongoDB reads infrequently used data, it can evict more frequently accessed data, causing a deterioration in performance for the database’s regular workload.

The `mongodump` create a BSON(_Binary JSON_) dump of your collections. We should be able to use the `mongorestore` to restore the BSON to our Documentdb.

Connect to your mongo instance, ensure your mongodb service is running and run the following commands

```bash
# sudo su # If necessary create the output directory
mkdir -p /var/mongodb_backup
mongodump --out=/var/mongodb_backup/ --db=miztiik_db
```

Now that we have created dump of our database, We are ready to restore this data to the DocumentDB. We need `mongorestore` command to initiate the restoration. You can install it in a EC2 or your dev machine and run it from there. Remember you need to be able access the BSON dump and also the DocumentDB from this EC2/Dev Machine. You can follow [these instructions][4] to install MongoDB Database Tools(including `mongorestore`)

Once you have the tools installed, use the following commands to begin the restoration

```bash
cd /var/log
DOCS_DB_HOST="docdb-2020-10-81-83-14-46.cluster-ca64q8ficuhu.us-east-1.docdb.amazonaws.com:27017"
DOCS_DB_USER_NAME="docsdbadmin"
DOCS_DB_PASSWORD="YOUR_DOCS_DB_PASSWORD"
MONGO_DUMP_DIR="/var/mongodb_backup"

wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem
mongorestore --ssl \
    --host=$DOCS_DB_HOST \
    --username=$DOCS_DB_USER_NAME \
    --password=$DOCS_DB_PASSWORD \
    --sslCAFile rds-combined-ca-bundle.pem \
    $MONGO_DUMP_DIR
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
3. [AWS Docs: mongodump & mongorestore][4]

### 🏷️ Metadata

**Level**: 200

[1]: https://github.com/miztiik/aws-real-time-use-cases
[2]: https://aws.amazon.com/dms/
[3]: https://github.com/miztiik/dms-mongodb-to-documentdb
[4]: https://docs.aws.amazon.com/documentdb/latest/developerguide/backup_restore-dump_restore_import_export_data.html#backup_restore-dump_restore_import_export_data-mongorestore
[4]: https://docs.mongodb.com/database-tools/installation/#install-tools
[100]: https://www.udemy.com/course/aws-cloud-security/?referralCode=B7F1B6C78B45ADAF77A9
[101]: https://www.udemy.com/course/aws-cloud-security-proactive-way/?referralCode=71DC542AD4481309A441
[102]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579
[103]: https://www.udemy.com/course/aws-cloudformation-basics?referralCode=93AD3B1530BC871093D6
[200]: https://github.com/miztiik/cfn-challenges/issues
[899]: https://www.udemy.com/user/n-kumar/
[900]: https://ko-fi.com/miztiik
[901]: https://ko-fi.com/Q5Q41QDGK
