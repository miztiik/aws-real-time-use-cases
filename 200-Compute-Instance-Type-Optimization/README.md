# EC2 Instance Type Optimizations

## 🔥 Scenario

Your client is planning to a cloud-native big data platform for processing vast amounts of data quickly and cost-effectively at scale. They are looking at services like AWS EMR<sup>[1]</sup>, DataBricks etc.

They want you to recommend the ideal instance types<sup>[2]</sup> for their workload. The best pracices<sup>[3],</sup><sup>[4]</sup> is not very conclusive.

What is your recommendation to them?

## 🎯Solutions

  _It depends_

- What is the size of your data set
- How quickly Hadoop should process your data
  - Parallelism or Cost Constrained

### ℹ️ Metadata

**Level**: 200

[1]: https://aws.amazon.com/emr
[2]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html
[3]: https://d0.awsstatic.com/whitepapers/aws-amazon-emr-best-practices.pdf
[4]: https://stackoverflow.com/questions/30435610/spark-which-instance-type-is-preferred-for-aws-emr-cluster
