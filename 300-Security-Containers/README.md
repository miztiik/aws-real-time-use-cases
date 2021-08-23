# Securing Containers

## 🔥 Scenario

Mystique Unicorn App is a containerized microservice. The App Security Board had been recently formed to improve the security of this fast growing mobile app. During the first security audit, It was observed that the containers being used in this app are not secured properly.

As you are the cloud security expert, Mystique Unicorn seeks your advice on how to secure their containers. Can you help them?

## 🎯Solutions

We can leverage [AWS Well Architected: Security Pillar][2] and its seven pillars to secure our containerized workloads. The design principles are,

- Implement a strong identity foundation
- Enable traceability
- Apply security at all layers
- Automate security best practices
- Protect data in transit and at rest
- Keep people away from data
- Prepare for security events

We can apply these principles to the lifecycle of the container - Image Build, Container runtime, Image retirement. In addition to that, these talks [Best practices for CI/CD using AWS Fargate and Amazon ECS][30], [AWS Container Security 101][31] and [this][32] and [this][33] details some of the points highlighted below.

### Building Docker Images - Best Practices

- Use minimal/trusted base images
- Sign images and verify signature
- Scan and rebuild images
- Specify USER in Dockerfile (otherwise it’s root)
- Use COPY, not ADD in Dockerfile
- One service per container
  - Use sidecars within task/pod
- Minimise container footprint / Reduce container attack surface area
  - Include only what is needed at runtime
- Use Unique and informative image tags
- Implement a strong identity foundation
- Remove setuid/setgid permissions in images
- Enable traceability
- Do not run things as root/privileged containers
- Do not store secrets in Dockerfile
- Do not use update instructions only in Dockerfile
- No console troubleshooting tools
  - _For Example,_ AWS Fargate does not let you docker exec onto the tasks anyway so adding tools for troubleshooting in container image is not helpful.

### Security in Deployment Layer (CI/CD) – Best Practices

Build security into the entire CI/CD process including runtime

- Use private respository endpoints <small>[VPCE][8], [ECR PrivateLink][9]</small>
- CIS (Center for Internet Security) Docker Benchmark <small>[Read More..][20]</small>
- Use latest versions
  - Docker CVE Database
  - Docker Security non-events (Conditions Apply<sup>\*</sup>)
- Do not embed Secret management <small>[How to Pass Secrets][4], [Manage Secrets][5]</small>
- Use Image scanning Tools and allow only approved images during build <small>[Read about AWS Native Image Scanning][6], [Scan with Trivy][7]</small>
  - Twistlock, Peeker, NeuVector, CoreOS Clair etc.
- Limit resources like CPU, Memory explicitly, do not use defaults
- Limit network access
- Credential Isolation: Restrict permission associated with container role
  - Container can only retrieve credentials for the IAM role that is defined in the task definition to which it belongs

### Security in Compute Layer - Runtime best practices

- Mount container's root filesystem as read only
- Use OS tools like `SELinux`
- Run containers with the least IAM privileges
- Limit memory usage for container
- Limit network reachability of your containers
- Do not share the host's process namespace
- Implement mechanisms to monitor running containers
  - Vulnerability Scan
  - Map container traffic
  - Monitor traffic
- Logging & Audit
  - App Logs, API Logs, CloudTrail/Admin Logs, DNS Logs

### Automate Security Governance – Best Practices

Governance can be achieved during continuous integration, by enabling the security teams to deploy security containers as part of the process.

- Enable the security team to deploy security containers such as host intrusion detection in parallel
- Use an automation tool like AWS CodeBuild/Jenkins to build both application and security containers, merge both task definitions and then deploy
- Allow security teams to deploy security without having to bake it into the application image(_aka Sidecar containers_)

##### DevSecOps Workshop

- [Dev Sec Ops Workshops][3]

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

## 📌 Who is using this

This repository teaches developers, Solution Architects & Ops Engineers how to build complete architecture in AWS. Based on that knowledge these Udemy [course #1][103], [course #2][102] have been created to enhance your skills.

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

### 👋 Buy me a coffee

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Q5Q41QDGK)Buy me a [coffee ☕][900].

### 📚 References

1. [AWS Security Whitepaper][1]
1. [AWS Well-Architected Framework: Security Pillar][2]
1. [AWS Overview of Security Processes whitepaper][1]
1. [CIS Docker Benchmark][20]
1. [Securing Container Workloads on AWS Fargate][32]
1. [All in on AWS Fargate for high-security workloads][33]
1. [AWS Videos] CON334-R1 – Running high-security workloads on Amazon EKS
1. [AWS Videos] CON315-R1 – Deep dive: Observability of Kubernetes applications
1. [AWS Videos] CON317-R2 – Securing your Amazon EKS cluster
1. [AWS Videos] CON414-R3 – Security best practices for AWS Fargate
1. [AWS Videos] CON317-R3 – Securing your Amazon EKS cluster
1. [AWS Videos] GRC340 - Container runtime security and automation
1. [AWS Videos] SEP309 - Containers and mission-critical applications
1. [AWS Videos] SDD401 - Securing enterpris-grade serverless applications

### 🏷️ Metadata

**Level**: 300

[1]: https://d0.awsstatic.com/whitepapers/Security/AWS_Security_Whitepaper.pdf
[2]: https://wa.aws.amazon.com/wat.pillar.security.en.html
[3]: https://container-devsecops.awssecworkshops.com
[4]: https://aws.amazon.com/premiumsupport/knowledge-center/ecs-data-security-container-task/
[5]: https://aws.amazon.com/blogs/security/how-to-manage-secrets-for-amazon-ec2-container-service-based-applications-by-using-amazon-s3-and-docker/
[6]: https://aws.amazon.com/blogs/containers/amazon-ecr-native-container-image-scanning/
[7]: https://aws.amazon.com/blogs/containers/scanning-images-with-trivy-in-an-aws-codepipeline/
[8]: https://aws.amazon.com/blogs/containers/using-vpc-endpoint-policies-to-control-amazon-ecr-access/
[9]: https://aws.amazon.com/blogs/containers/aws-privatelink-ecr-cross-account-fargate-deployment/
[20]: https://www.cisecurity.org/benchmark/docker/
[30]: https://www.youtube.com/watch?v=7FVK0i9edyg
[31]: https://www.youtube.com/watch?v=Cp4rdlsQORo
[32]: https://www.youtube.com/watch?v=PkR2hu1HCCY
[33]: https://www.youtube.com/watch?v=gNDi6l2tIws
[101]: https://www.udemy.com/course/aws-cloud-security-proactive-way/?referralCode=71DC542AD4481309A441
[102]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579
[103]: https://www.udemy.com/course/aws-cloudformation-basics?referralCode=93AD3B1530BC871093D6
[200]: https://github.com/miztiik/aws-real-time-use-cases/issues
[899]: https://www.udemy.com/user/n-kumar/
[900]: https://ko-fi.com/miztiik
[901]: https://ko-fi.com/Q5Q41QDGK
