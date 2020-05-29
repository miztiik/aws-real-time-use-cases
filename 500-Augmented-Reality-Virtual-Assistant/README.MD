# Virtual Assistant created in Augmented Reality

## Scenario

Your client wants to you create a virtual assistant that will greet their customers automatically as the first step. In future, the assistant will be respond to customer queries in a virtual environment.

# AR-SUMERIAN

## AMAZON-SUMERIAN-ARCORE-STARTER

A sample project that demonstrates how to create a simple augmented reality experience using Google's ARCore with the Amazon Sumerian service.

## PRE-REQUISITES

- To create a Augmented Reality Video using AWS Sumerian service, you need to have the following;
  
  - AWS Account
  - Cognito ID
  - IAM role, associated with the Amazon Polly Service
  - AWS Sumerian Service access

### Note : Make sure you use all the services under the same region
  
## STEPS TO FOLLOW
  
   Choose the Amazon region as (US East- N.Virginia).

#### 1. Create a Cognito User ID pool
  
- In the console , find the Cognito service and click create a new Identity pool.Enter a unique Identity Pool name
        eg.,(AWSSumerian demo).
- Check the box below "Enable access to unauthenticated identities".
- If you allow your users to authenticate using any of these public providers, you can specify your application identifiers here(amazon,google,facebook etc.) only if needed. (Not required for this demo)
- Click on Create Pool and proceed to set permissions
- Under IAM role, choose create new IAM roles,for both authenticated and Unauthenticated identities and then click ALLOW.
- This will take you to this page.

  ![Cognito Pool](https://github.com/subhadharun/AWS-IMAGES/blob/master/Screenshot%202019-09-09%20at%2013.40.30.png)
  
- Now,Copy the AWS CREDENTIALS (as in the image)and save it on a Notepad, as you would need that at the Sumerian Console.
   You can always comeback to the Cognito-Federated Identies-Dashboard-Sample Code,to get the credentials,if you lose them.

#### 2. Create an IAM Role
  
- Go to the IAM service, click on ROLES and then Search for a Role **Cognito_awssumerianappUnauth_Role**
  -Click that Role and Attach policies - **Amazon Polly Read Only Access** - Select that policy and attach it.
  
#### 3. Go to Sumerian Service
  
- On the Home page, click on **AUGUMENTED REALITY** . Give a TITLE name and click create.
- You will find the Navigation bar to the left and Properties Inspector to the right.
- click on **Import Assets** at the top of the CANVAS, and search **cristine** . select a model and click add, at the right handside.
- Now,Drag and drop cristine under AR ANCHOR in the Navigation bar.
- Click on the TITLE name, and now go to the INSPECTOR,click on AWS CONFIGURATION- **Cognito Identity Pool ID**
- Paste the Cognito Pool ID (From STEP1) and save it.
- When you Click on **CRISTINE** under the Entities panel - you will find **Speech** and **State Machines** properties under the Inspector panel.
- Add the Speech file, SSML text file of your choice.(under - Drop Speech)
- Under State machines, you should add 2 components
       - Under Drop Behaviour add states - add actions - **Click/Tap Entity** and then **start speech with the SSML**

- After this step, you will find the 2 states below the Canvas, where you will have to draw lines from one box to other , establishing connection to each other.
- Now click on the Play Button to view your AR Video!

### REFERENCES

  AWS Sumerian lets you to create and run virtual reality (VR), augmented reality (AR), and 3D applications quickly and easily  [link to AWS SUMERIAN!](https://aws.amazon.com/sumerian/)
  
### 💡 Help/Suggestions or 🐛 Bugs

Thank you for your interest in contributing to our project. Whether it's a bug report, new feature, correction, or additional documentation or solutions, we greatly value feedback and contributions from our community. [Start here][200]

### 👋 Buy me a coffee

Buy me a [coffee ☕][900].

### 🏷️ Metadata

**Level**: 500

[100]: https://www.udemy.com/course/aws-cloud-development-kit-from-beginner-to-professional/?referralCode=E15D7FB64E417C547579

[200]: https://github.com/miztiik/aws-real-time-use-cases/issues

[900]: https://ko-fi.com/miztiik
