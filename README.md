PROJECT NAME :- Aatmaani project
-------------
Abstract
--------
Relaible documentation is very important in entire project.The documentaion presentations helps in keeping trarck of all aspects of an application and it improves the quality of software products.The main focuses are in maintanance, development and knowledge to other developers 

Introduction 
-------
The development Software Project is the complete procedure of software development is from requirement gathering to testing and maintenance, carried out according to the execution methodologies, in a specified period of time to achieve intended software product .

Technical documentation in software engineering is the umbrella term that encompasses all written documents and materials dealing with software product development.Documentation exists to explain product functionality, unify project-related information, and allow for discussing all significant questions arising between stakeholders and developers.




Tool used
---
Github :-
--
GitHub is a code hosting platform for version control and collaboration.I had stored here all the codes and dependencies which is required in our project

Docker :-
---
Docker is a software platform that allows you to build, test, and deploy applications quickly
i have used docker to build images for our project

Jenkins :-
--
Jenkins is used to build and test your software projects continuously making it easier for developers to integrate changes to the project and also used for integrating with other tool 

Terraform :-
--
Terraform is an infrastructure as code tool that lets you build, change, and version cloud  safely and efficiently and it can manage infrastructure on multiple cloud platform and it will help you to build our own custom resources in aws platform

Kubernetes :-
---
Kubernetes is an open source container orchestration platform that automates many of the manual processes involved in deploying, managing, and scaling containerized applications

Helm :-
--
Helm is a Kubernetes deployment tool for automating creation, packaging, configuration, and deployment of applications and services to Kubernetes clusters and also an package manager


Prometheus :-
---
Prometheus is a free software application used for event monitoring and alerting

Grafana :-
---
Grafana is a multi-platform open source analytics and interactive visualization web application.
allows users to see their data via charts and graphs used to monitor our deployed application for better understand to maintain quality product

Cloud providers and services used :-
--
AWS cloud 

ECR 

EKS 

Cloudformation

IAM & VPC 

Project Architecture :-
-------------------------------------------






![alt ](https://raw.githubusercontent.com/Ranjeetsheelvant/devops-repo/main/devops-project-diagram.jpg)

Phase 1
--
* Developer will push the project code in the git hub

* After getting code  i have created the repositories called Aatmaani project in git-hub

* And created sub repositories in Aatmaani project called devops & nodejs-project

* In the devops repo i have added helm chart as (ranjith-helm-chart)

* In helm chart there are three yaml file or manifest file namely  
   * 1 . dev.yaml  consist of 1 pod 
   *  2 . qa.yaml  consist of 1 pod 
   *  3 . prod.yaml consist of 2 pod
   
* If we want to access our application outside the cluster we should change our yaml files 
 1. dev.yaml 2. qa.yaml, 3. prod.yaml
 
* In our helm chart there will having templates in that we have deployment.yaml in the deployment file we need to change container port to 3000 its only because of our project is running in on 3000 port

* And wrote a docker file based on project requierment and in nodejs-project consist of project code and dockerfile to create docker images

Phase 2:-
---
* I have created vpc , subnets , kubernetes cluster with one node group  and minimum 1 spot machine  max 5 in aws cloud by using terraform code

* Along with create three diffrent namespaces  called dev ,qa , prod 

Phase 3 :-
--
* launched one EC2 instances t2.medium 

* Installed Docker and setuped to docker build a docker  image

* Installed jenkins using ansible and configured the jenkins 

* After installing jenkins created jobs and configured jenkins using pipelines

* In jenkins pipeline used declarative pipeline to automate my project and installed the required plugins like docker pipeline,kubernetes,slack notification plugins

Phase 4:-
--
* In jenkins pipeline configured github repositories it will fetch the code from the github

* Here after getting code there will be one dockerfile in that docker image will build called dev:latest and that image will pushes to aws-ecr

* After that helm is used to pull the dev:latest image from aws-ecr-repo and using helm chart deploy to dev namespacees in the kubernetes cluster

* If deployment fails we will slack notification to our slack channel

Phase 5 :-
---
* Now will  pull the image dev:latest from aws-ecr-repo and need to change tag qa:latest  after changing tag again it will push to aws-ecr-repo 

* Aws-ecr already having qa:latest image and also in helm chart there will be devops-repo in devops-repo having qa.yaml file and will the qa:latest image
* After pulling qa:latest image it will deploy to qa namespace with having one replica

* After that we need to check pod is running healthy or not 
* If deployment fails will get slack  notification to our slack channel 

Phase 6:-
--
* Again we need to pull qa:latest image from aws-ecr-repo and need to change tag to prod:latest 
after changing tag prod:latest again it will push to aws-ecr-repo

* Now aws-ecr-repo consist of prod:latest image ,helm-chart in devops repo consist of prod.yaml file and it will pull prod:latest image

* After pulling prod:latest image from aws-ecr-repo it will deploy to prod namespace with two replicas here in the prod.yaml file we have changed replicas count
 
* After that we need to check pod is running healthy or not 
*  In the prod.yaml file we made changes by enabling HPA-horizontal pod autoscaling its only because whenever the cpu stressed increased to 60% the extra pods will create automatically 
we already have given minimum and maximum count in our prod.yaml file

* If deployment fails we will be getting slack notification from the slack channel

Phase 7:-
---
* In kubernetes cluster i had installed promotheus and grafana  for the cluster monitoring
* It will monitor all the cpu,Ram,memory utilization 

* Node exporter will collect all the matrices from kubernetes cluster and it will give to the prometheus  
* Prometheus will display all the target port matrices in port  9090
* In grafana dashboard we can see all the parameters of our cluster it will run on the port of 3000

Conclusion
---
* It was a wonderful learning experience for me while working on this project.
* This project took me through the various phases of project development and gave me real insight into the world of software engineering.
















