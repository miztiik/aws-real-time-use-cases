# Migrate Containers To Cloud

## 🔥 Scenario

Mystique Unicorn App is running lot of containerized applications onprem. They are evaluating public cloud to run their containers.

As you are their containers expert, Mystique Unicorn seeks your advice. Can you help them?

## 🎯Solutions

There are many container orchestration tools that can be used for container lifecycle management. Some popular options are Kubernetes, Docker Swarm, and Apache Mesos. When you are planning to move containers from an existing platform to a newer one, you can use following items as a starting point for your journey,

1. ### Cluster information

   - Docker version
   - Orchestration engine? K8S\Mesos
   - Orchestration engine version?
   - Is the K8s version compatible with the application?
   - Is there any custom code in the compilation engine?
   - What is the cluster size?
   - Where is cluster deployed? IDC\Cloud
   - What platform is deployed on? Rancher\OpenShift\Kops\ACK\GKE\AKS\Kubeadm
   - Is there a Windows node?
   - What plug-in is used? CNI, CSI, Cluster Autoscaler, Ingress, etc.
   - Is it a stateful application?
   - What type of storage driver is used?
   - How much data is stored in the local disk?
   - What is the full path of the data storage?
   - Which type of storage is used? Volume, CSI, EFS, etc.
   - Which type of network is used? Flannel/Calico/McVlan
   - How is service discovery achieved? ZK, Eureka
   - Which framework does the microservice use? Dubbo/ Spring cloud

1. ### Log collection solution

   - Which log collection tools are used? Filebeat, Flume, Fluentd, etc.
   - What is the deployment method? Build in Image/ Sidecar

1. ### Monitoring solution

   - Which monitoring tool is used? Prometheus/Zabbix
   - Which kind of dashboard is used? Kibana/Grafana
   - What are metrics needed to monitor?

1. ### CI/CD solution

   - Which pipeline solution is used? Jenkins/Spinnaker/GitOps
   - Which package tool is used? Helm chart / Kustomize
   - What are the source code repositories? GitHub/Gitlab/SVN

1. ### Image Repository

   - Which image repository is used? Docker Repository/Harbor
   - How many images are there?
   - Business impact
   - How long is the business interruption?
   - Is there any dependencies between business systems?
   - Is it feasible to migrate in stages?

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

## 📌 Who is using this

This repository teaches developers, Solution Architects & Ops Engineers how to build complete architecture in AWS. Based on that knowledge these Udemy [course #1][103], [course #2][102] have been created to enhance your skills.

### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

### 👋 Buy me a coffee

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Q5Q41QDGK)Buy me a [coffee ☕][900].

### 📚 References

1. [Miztiik Blogs - Container Security][1]

### 🏷️ Metadata

**Level**: 200

[1]: https://github.com/miztiik/aws-real-time-use-cases/tree/master/300-Security-Containers
[101]: https://www.udemy.com/course/aws-cloud-security-proactive-way/?referralCode=71DC542AD4481309A441
[102]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579
[103]: https://www.udemy.com/course/aws-cloudformation-basics?referralCode=93AD3B1530BC871093D6
[200]: https://github.com/miztiik/aws-real-time-use-cases/issues
[899]: https://www.udemy.com/user/n-kumar/
[900]: https://ko-fi.com/miztiik
[901]: https://ko-fi.com/Q5Q41QDGK
