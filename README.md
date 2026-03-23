<p align="center">
 <img width="126" height="126" alt="image" src="https://github.com/user-attachments/assets/9d988702-0739-44f1-97cb-57fa2d2dc38b" />

</p>

<h1 align="center"> TASK APP
</h1>

<p align="center">

## 📌Project Overview

This project demonstrate how i implement DevOps and Cloud Enginner workflows starting from basic to advance tool. This project is set to take about 12 weeks. Each week contains new tools and updates on chanhes to improve the workflow to show real DevOps Work flow.

## 🔋 Technologies Used

![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=node.js&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

## CI/CD

![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)
![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white)

## 📦 Containers & Infrastructure

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)

## ☁️ Cloud

![Microsoft Azure](https://img.shields.io/badge/Microsoft_Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)

## Week 1 (Project files and dependencies)

1.  Install Nodejs and restart your computer

2.  Verify if node is installed: run node -v && npm -v

3.  Created Frontend and back end folder

4.  Created html, css and js files inside the frontend folder

5.  Created server.js and package.json inside the backend

6.  Install Dependencies: cd backend -> run npm install This creates : node modules/ package-lock.json

7.  Start Server: run node server.js you should see Server running on http://localhost:3000 (this is to be sure everything is working)

8.  Test API : copy -> http://localhost:3000/tasks to your browser you should see an empty array [ ]

9.  Frontend working locally

10. Backend working locally

11. API endpoint returning empty array

## (Git & GitHub)

1.  Initialize git : go to the main folder Task-Manger-App/ and run : git init you can check if your git is initialized by runing: git status

2.  Create a github repo Name Task App leave all as default and create

3.  Connect Your Local Project to your repo: got to the main local folder Task-Manger-App/ run: git remote add origin(copy the link in your repo here) example: git remote add origin https://github.com/iampryce/Task-App.git

4.  Push Local Code to github repo: Before this make sure your are in the main branch you can run this code to set it up: git branch -M main then run: git add . to add the files you wish to commit to staging area.

5.  Commands: (make sure your in the main folder)

6.  git branch -M main (set it to main branch)

7.  git add . (add your filles to staging)

8.  git commit -m "Task App frontend + backend" (commit your project files)

9.  git push -u origin main (push to main branch)

---

## Week 2 (CI Pipeline GitHub Action)

### Objectives:

We will create a yaml file and give it actions we want it to take when we push the file to our repo.

When we push code.

GitHub will automatically Checkout repo

Sets up Node.js

Installs backend dependencies

Simulates a test

Shows logs

If something breaks -> pipeline fails

If everything works -> pipeline green

---

### 1. Create workflow folder inside the root: mkdir -p .github/workflows

### 2. Create CI file inside the github/workflows: touch ci.yml

The ci.yml file tells GitHub what to do automatically when we push the code.

### 3. Write or copy the yml codes to the ci.yml file

### 4. Push It run: git add .github/workflows/ci.yml

git commit -m "Week 2: Add CI pipeline"
git push

### 5. Watch It Run

Go to your GitHub repo
Click Actions tab
Click Week 2 CI Pipeline
Watch it run
You should see.
Checkout repository, Setup Node.js , Install dependencies ,Simulate tes and it should end with: Success green.

---

## Week 3 (Jenkins – Enterprise-style CI/CD.)

### What ia Jenkins in simple terms.

Github Action is managed by GIthub sever

Jenkins Sever is self managed.

Objectives:
Launch a Linux server

Install Jenkins

Access Jenkins via browser

Connect Jenkins to GitHub repo

Run first Jenkins build

Outcome:
GitHub repo -> Jenkins -> Build runs automatically

Steps

1. Launch EC2 Server  
   Allow inbound traffic: SSH (22) HTTP (80) Custom TCP: 8080 (for Jenkins)

2. Connect to Server ( install Java ) sudo apt update sudo apt install fontconfig openjdk-21-jre Verify java version: java -version

3. Install Node.js : sudo apt update sudo apt install nodejs npm -y

4. Install Jenkins: use the official documentation for Ubuntu debian https://www.jenkins.io/download/ select Ubuntu/debian and follow the installation process

Choose the Long Term Support release and run the commands:
These following commands will download Jenkins’ security key, add its official repository to Ubuntu, update the package list, and then install Jenkins.

Commands 1

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \

https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \

https://pkg.jenkins.io/debian-stable binary/ | sudo tee \

/etc/apt/sources.list.d/jenkins.list > /dev/null

Commands 2

sudo apt update

sudo apt install jenkins

Enable/Start/Check status

sudo systemctl enable jenkins

sudo systemctl start jenkins

sudo systemctl status jenkins

5. Access Jenkins in Browser http://your IP:8080 change the ip before the port to your own. Get the jenkins defualt password when the window opens :

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

Complete Jenkins Setup, Install suggested plugins , Create admin user , Save and continue.

Building Jenkins Pipeline job and connecting it to the Task App.
Steps

1. Create Pipeline Job : create a new item and name it : task-app-jenkins-ci , Selet pipeline.

2. Configure Pipeline : Scroll to pipeline and choose Pipeline script from SCM and select SCM → Git, add your repo URL ---------- , change to main if it says master by default, create a script path for Jenkinsfile and Save after.

3. Create a Jenkinsfile, and paste the pipeline script . GitHub Actions uses YAML for configuration. Jenkins uses a Groovy based pipeline language for scripting builds. So this is similar but just better than GitHub Action YAML.

4. Push the Jenkins file to your repo git add Jenkinsfile git commit -m "Add Jenkins pipeline" git push

5.Run Jenkins Build: Go back to Jenkins and click Build Now Verify if it works. This was manual because we had to click build now we will automate in the next step.

6. Enable GitHub Trigger in Jenkins: Go to your Jenkins job and click configure. Scroll down to Build Triggers and select GitHub hook trigger for GITScm polling . and save.

7. Add Webhook in GitHub: Go to your GitHub repo Settings -> Webhooks -> Add Webhook. Copy ypur jenkins url that contains your or ip http://yourIP:8080 and add /github-webhook/ at the end.

Eg: http://yourIP:8080/github-webhook/ and make sure it is http not https. Content Type: application/json Which events: Just the push event then click add Webhook.

To test this: Make some changes in your local folder, maybe your html code. Then save and push to test. Now we don’t need to click build in jenkins it will run automatically.

git add .

git commit -m "Test Jenkins webhook"

git push

---

## Week 4 (Docker)

### What is Docker?

Docker is an open source software platform for building, testing, and deploying applications using containerization. It allows developers to package an application and all its dependencies (libraries, system tools, code, and runtime) into a single, standardized unit called a container, ensuring it runs consistently across different computing environments, from a developer's laptop to the cloud.

So we will be using docker to package our Task APP dependencies and build an image locally make sure it works before we now make jenkins run it automatically.

Prerequisite : Install Docker desktop locally and sign up.

Steps

1. Create the Dockerfile In the root of your project (same level as Jenkinsfile)
2. Explanation:

In this file we will Docker how to package the backend application into a container image using Node.js.

2.Build Docker Image Locally

Run this in your project root:

```
 docker build -t task-app .
```

Explanation:

This builds a Docker image from the Dockerfile so we can verify it works before automating it in Jenkins.

3.Run the Container

Run this: docker run -p 3000:3000 task-app

We are mapping the backend to run on port => 3000

Open this in your browser: http://localhost:3000

Explanation:

This tells Docker to create and start a running container from the image we built (task-app).

Before running the next step confirm that your jenkins server IP is the same. If not change your webhook IP

4.Push Dockerfile to GitHub

Run

```
 git add Dockerfile

 git commit -m "Add Dockerfile for containerization"

 git push
```

Explanation:

This uploads the Dockerfile to your GitHub repository so Jenkins can access it when running the CI pipeline.

Because Jenkins is connected to GitHub through the webhook, pushing new code will automatically trigger a new Jenkins build.

5.install Docker on Jenkins Server

On your EC2 Jenkins server run: sudo apt update

```
 sudo apt install docker.io -y
```

Explanation:

This installs Docker on the Jenkins server so the CI pipeline can build and run container images during automated builds.

6. Then run:

```
 sudo systemctl start docker

 sudo systemctl enable docker
```

Explanation:

This starts the Docker service and ensures Docker starts automatically whenever the server restarts.

7.Allow Jenkins to Use Docker

Run this:

```
 sudo usermod -aG docker jenkins
 sudo systemctl restart jenkins
```

Explanation:

Jenkins runs under its own user account, so we grant it permission to run Docker commands.

Without this, Jenkins pipelines will fail when trying to build Docker images.

See it like this, Jenkins is just a server. If we want Jenkins to build Docker images, Docker must be installed on that server.

8.Update the Jenkins Pipeline (jenkinsfile) to Build the Docker Image

In week 3 jenkins pipele we added just two stages

I.Install dependencies

II.Verify Node is installed

That means Jenkins is only testing the environment, not building the container yet.

To complete Week 4 , we just need to add one more stage.

So now jenkins will

Pull repo

Install dependencies

Verify Node

Build Docker image

By adding the Docker build stage, Jenkins can now automatically package the application into a container image whenever new code is pushed to GitHub.

9.Push the Updated Jenkinsfile to GitHub

10.Verify the Docker Build : Go to your jenkins server and verify your console output

11.Confirm the Image exists on the Jenkins Server, Run :

```
 docker images
```

you should see your task app image there

Summary: In this step we automated container creation. Every time code is pushed, Jenkins now builds a Docker image of the application and include updates and new versions.

---

## WeeK 5 (Container Registry)

In Week 4, we built our Docker image using Jenkins, but the image only exists on the Jenkins server.
This is a problem because other servers or developers cannot access or reuse the image.
To solve this, we use a container registry (Docker Hub) a central place to store Docker images so they can be pulled and run anywhere.

TASK: CREATE A REPOSITORY IN DOCKER HUB AND PUSH DOCKER IMAGES THERE

1.  Create a repository on Dockerhub

1.  Log in to docker via web not the desktop app https://hub.docker.com

2.Navigate to the menu on the left and select Repositories

3.Add name and a short description and click create

Explanation:

Docker Hub is a container registry where your Docker images will be stored so they can be accessed from anywhere.

2.  Login to Docker Hub (on Jenkins Server)

1.      access docker from the terminal, use command  “ sudo docker login” .

1.      Use the secure browser login instead of typing password in terminal. https://login.docker.com/activate  (copy out the link to your broswer and also use the one time device confirmation code provided to sign in. You should see the succeeded login when this is done

1.  Add Tags to your Docker image
    Tagging links your local Docker image to your Docker Hub repository.

Obtain your docker image ID, run “ sudo docker images” you will see your task app and other images.

Tag your image by using the command “ sudo docker tag [your image ID] [dockerusername]/[docker reponame]:[tag]” . you can tag it task-appv1

Replace the objects in parentheses with the actual values including your desired tag word

4.  Push the Image to Docker Hub

Use the command- “docker push [your-user-name ] [your-repo-name]:[tag]”

Replace and your-repo-name with the actual values you used when building. Example : docker push clint8/task-app:task-appv1

You'll see layers being pushed one by one, then a final digest confirming success. (img1: digest:
sha256:5ab865d487d42bedd7de4b1afa9c173931f89bf116f01e733f822efdcb
209ecb size: 856)

5. Verify on Docker Hub

Go to hub.docker.com → your repository → click the Tags tab. Your image
(v1) should now be listed there.

6.  Pull & Run from Anywhere

To show that the app is no longer tied to one server. Run:

docker pull YOUR_DOCKER_USERNAME/your-repo-name:v1

docker run -p 8080:3000 YOUR_DOCKER_USERNAME/your-repo-name:v1

The first command downloads the Docker image from Docker Hub to any machine.

The second command runs the container and maps port 8080 (host) to 3000 (container) so the application can be accessed from the browser.

7.Automate in Jenkins

Update your Jenkinsfile: get the latest on github and replace the correct details at the top of the code.

We are updating the jenkins file because we are adding two stages: We are adding:

Tag stage → prepares image for Docker Hub

Push stage → uploads image automatically

Explanation:

We automated Docker image publishing so every code change is built and stored in the registry automatically.

8.Push Your Changes

On your Jenkins server =>

Switch to Jenkins user: sudo su - jenkins

Login to docker hub: docker login

Enter your docker hub username and password

This logs docker in for the jenkins user, so pipelines can push images.

git add .

git commit -m "Automate Docker push in Jenkins"

git push

Confirm It Worked

Go to Jenkins → Build → Console Output: Look for
docker push your-username/repo-name:ltag
...
Pushed

Week 5 Conclusion

In Week 5, we moved beyond just building Docker images to storing and distributing them using Docker Hub.

Previously, our images were only available on the Jenkins server, which limited how the application could be used. By introducing a container registry, we made the application portable and accessible from anywhere.

We also automated the entire process in Jenkins, so every code push now builds, tags, and pushes a Docker image without manual intervention.

Finally, we validated this by pulling and running the image on another environment, proving that the application is consistent and can run anywhere.

# TASK APP

## Week 6:

infrastructure as code (Terraform)

What is Terraform?
Terraform is a tool that lets you define and create cloud infrastructure using code instead of manual clicks.

Objectives:

1.Install Terraform
2.Connect Terraform to AZURE/ AWS
3.Create an EC2 instance using code
4.SSH into the server
5.(Later) prepare it for Docker apps

Steps

1.Install Terraform

Download and install Terraform from: https://developer.hashicorp.com/terraform/downloads
Verify installation: terraform -v
Download and install AZURE CLI https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
Download the Windows installer (.msi) and install it.
Verify Installation
Open your terminal and run: az version
Login to Azure: az login --use-device-code
Verify Account: az account show
Set Subscription: az account list --output table
Choose your subscription and replace "SUBSCRIPTION_ID" : az account set --subscription "SUBSCRIPTION_ID"

Note: The CLI allows Terraform to authenticate and interact with the cloud provider.

2.Create Terraform File
Inside the root folder create a folder: mkdir terraform-ec2
Go to the created folder and create a file: cd terraform-ec2 touch main.tf
Copy the terraform code from github to the main.tf file. In this file all resources that we need will be stated and later created by terraform. VPC, Subnet, IGW, Route table,

3.Generate SSH Key pair: ssh-keygen -t rsa -b 4096 -m PEM -f ~/.ssh/keyname-key.pem
List keys : ls ~/.ssh
~/.ssh/azure-key.pem → private key
~/.ssh/azure-key.pem.pub → public key
SSH keys replace passwords by using a public-private key pair for secure authentication.
The private key remains on your local machine and must be kept secure.
The public key is shared with the server (via Terraform) to allow access.

We will be using keypair to ssh into our sever insead of password.

4.Run Terraform
After creating the file and getting the code run:
terraform init
Explanation:
This prepares Terraform to work by downloading the required provider (AWS) and setting up the working directory. It ensures Terraform knows how to communicate with your cloud.

terraform plan

Explanation:
This shows a preview of what Terraform will create before making any changes. It helps you verify that the configuration is correct and prevents mistakes.

terraform apply

This command executes the plan and creates the infrastructure in your cloud . It is the step where your code becomes real resources.

After Terraform finishes, connect with: ssh -i ~/.ssh/azure-devops-key.pem azureuser@yourPublic_IP

5.Verify on Cloud
Open your management console and confirm that terraform deployed the resources

6.Clean Up
Run : terraform destroy and type yes when prompted

Explanation:
This removes all resources created by Terraform to avoid unnecessary costs and keeps your environment clean. So we can create and destroy when needed.

Create a gitignore file and state all the terraform state files, so as not avoid being pushed to github later

# Week 7 / 8

## Kubernetes + Full App (Frontend + Backend)

Note:  
At this stage, we are moving from a simple containerized application to a more realistic production-ready structure.
Previously, our application was packaged into a single Docker image, mainly focusing on the backend (API). While this works for learning and small setups, it is not how modern applications are built or deployed in real-world environments. So I will suggest you separate your Frontend & Backend files in two different folder so that we can build docker images separately from both.
Frontend: Handles user interface (HTML, CSS, JavaScript)

Backend: Handles App logic and APIs

Build Docker Image- Frontend & Backend(Ensure your Docker is running)

1.Create a Docker file inside Frotend & Backend folder (delete the old docker file)
2.Copy the Docker build code for each inside the corresponding file.
3.Build Backend image: From the main project folder run: docker build -t [your-docker-username]/[your-Docker-repo-name-backend]:latest ./backend
4.Build Frontend Image: docker build -t [your-docker-username]/[your-Docker-repo-name-frontend]:latest ./frontend
5.Verify Images: docker images
6.Push to Docker Hub: Push both images to docker hub
docker push [backed]
docker push [frontend]
Note: copy the images and replace accordingly.
Kubernetes
Docs read more https://kubernetes.io/docs/concepts/overview/

Introduction to Kubernetes
Kubernetes is a system used to run and manage containerized applications automatically. Instead of manually starting containers, restarting them when they fail, and figuring out how they communicate, Kubernetes takes over these responsibilities and ensures the application is always running as expected.

In our current setup, we have a frontend and a backend running as separate containers. When using Docker alone, we are responsible for starting these containers, keeping them running, and making sure they can talk to each other. If the backend crashes or the system needs to handle more users, we have to manage that manually. This approach works for small setups but becomes difficult to maintain as the application grows.

Kubernetes solves this by introducing a structured way to define how the application should run. Instead of running containers directly, we describe the desired state of the system, such as “one backend should always be running” or “the frontend should be accessible from the browser.” Kubernetes continuously ensures that this state is maintained. If a container stops, it is restarted automatically. If more capacity is needed, additional instances can be created.

Another important role Kubernetes plays is managing communication between services. In our application, the frontend needs to send requests to the backend. With Docker alone, this often depends on fixed ports or manual configuration. Kubernetes replaces this with internal services, allowing components to communicate using stable names like backend-service, regardless of where the containers are actually running.

In summary, Kubernetes shifts the responsibility of managing containers from the developer to the system. Instead of focusing on how to run and maintain containers, we focus on defining what we want the application to look like, and Kubernetes ensures it stays in that state.

Steps

1. Install Kubernetes (K3s on VM)
   Install: curl -sfL https://get.k3s.io | sh -
   Verify: sudo kubectl get nodes
   Expanation:
   You install K3s on the same VM where Jenkins is running. This is important because it keeps your pipeline and runtime environment together.
   Your VM is no longer just a server running containers manually. It becomes a Kubernetes node capable of running managed workloads.

2.Backend Deployment
Create a folder in your project root folder: mkdir k8s
Create a backend-deployment.yaml file inside the folder,
Then copy the updated yaml code and also make sure your correct image link is replace inside the yaml file.
Make your repository available on your VM. You can do this by cloning your repository: git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
Then cd to your cloned repo
This step is required because Kubernetes will read the YAML file from the VM.

Apply: Locate your kubernetes folder (k8s) inside your VM and run:
Sudo kubectl apply -f backend-deployment.yaml
This command sends the configuration file to Kubernetes and tells it to create the backend based on the instructions in the file.
Verify: sudo kubectl get pods

Explanation: The yaml file contains the instructions of how your backend should run in Kubernetes.
Instead of manually starting a container, you are declaring:
Which image to use (task-app-backend) from docker hub
How many instances should run (replicas: 1 (you can have more.)
What port the application uses (3000)
Kubernetes reads this file and ensures that this backend is always running.

It runs and creates a Pod.
Note:
A Pod is the unit in which your application runs in Kubernetes, containing your container and managed automatically by the system.
Docker: runs containers
Kubernetes: runs Pods (which contain containers)

3.Create a Service.
Creating a service will:

· Give your backend a stable internal name
· Allow your frontend to connect to it
· Enable communication inside Kubernetes

Steps:

Create backend-service.yaml in your local folder insiide the k8s folder.
Copy the code into the folder and push to github
 Pull from github to your VM. Make it available on your VM
Confirm that the file now exist in your VM then apply: sudo kubectl apply -f backend-service.yaml
Verify: sudo kubectl get svc

You should see your backend service listed, along with:
A ClusterIP (internal IP)
The port (3000)

4.Frontend Deployment
Create the yaml file for both deploment and service file Inside k8s folder in your local project: frontend-deployment.yaml , frontend-service.yaml. Copy the config code accordingly. Don’t forget to update image name also
Push to guthub and pull to your VM
Go to your K8s folder and run: sudo kubectl apply -f frontend-deployment.yaml and sudo kubectl apply -f frontend-service.yaml
Verify they exist: sudo kubectl get pods and sudo kubectl get svc

Verifycurl in your VM: curl http://localhost:30007 if you get an html code it means
Kubernetes is working
Frontend is working

Add Rule for Kubernetes in your provider:
Allow in bound rule:  
Also Update the secutity rule in your main.tf and run: terraform apply
Port: 30007
Protocol: TCP
Access: Allow
Direction: Inbound

Test in browser: http://YOUR-VM-IP:30007 or make sure this port is the same as the front-end service in kubernestes

Kubernetes Implementation Summary
In this stage, we deployed our application (frontend and backend) into Kubernetes and connected all components together.
First, we created a Deployment for the backend. This allowed Kubernetes to run the backend container using the Docker image and ensure it is always running. Instead of manually starting containers, Kubernetes now manages the lifecycle of the backend.
Next, we created a Service for the backend. This gave the backend a stable internal name (backend-service) so other components, like the frontend, can reliably communicate with it. This solves the problem of changing Pod IP addresses.
We then repeated the same process for the frontend by creating a Deployment, which runs the UI inside Kubernetes, and a Service of type NodePort, which exposes the application to the outside world through the VM’s IP address and a specific port.
After configuring both services, we updated the frontend to communicate with the backend using the Kubernetes service name instead of localhost. This allows proper communication within the cluster.

Jenkins -> Kubernetes Integration
When we Push → Jenkins builds image → Jenkins pushes to Docker Hub → Jenkins updates Kubernetes

What Happens Step-by-Step
1.You push code to GitHub
2.Jenkins runs pipeline
3.Jenkins builds new image
4.Jenkins pushes image to Docker Hub
5.Jenkins tells Kubernetes to use that image
6.Kubernetes pulls the updated image
7.Kubernetes replaces old Pods

1.Update your jenkinsfile: copy the updated code from github and make sure you configure your image build in the file correctly.

The jenkins file is now updated to build both services, pushes them to Docker Hub, and automatically updates your running Kubernetes application.

2.Generate a Docker Hub Access Token
Go to hub.docker.com
Click your profile: Account Settings
Click Security: New Access Token
Description: jenkins-ci
Access: Read & Write
Click Generate and copy the token immediately

3.Add to Jenkins
Go to jenkins settings - Credentials - System - Global - Add Credentials
Kind: Username with password
Username: iamprycedev
Password: paste the access token (not your Docker Hub password)
ID: dockerhub-creds
Description: Docker Hub Access Token
Click Create

This Authenticate jenkins to build and push images to docker hub.

SSH into your VM
4.Give Jenkins access to the k3s config:
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
sudo usermod -aG sudo jenkins
5.Add Jenkins to sudoers so it can run sudo kubectl without a password prompt
SSH into your VM and run: sudo visudo
This opens the sudoers file safely. Scroll to the bottom and add this line:
jenkins ALL=(ALL) NOPASSWD: /usr/local/bin/kubectl

Restart Jenkins : sudo systemctl restart jenkins

Test.
git add .
git commit -m "add jenkins cicd"
git push

Jenkins will securely push images and automatically deploy updates to Kubernetes, this completes a full CI/CD pipeline.

6.Verify Pipeline:
Run on your VM: kubectl get pods
You should see newly created Pods with a recent AGE:

Explanation
This confirms that:
Jenkins successfully built and pushed new versioned images
Kubernetes detected the new image version
Kubernetes automatically performed a rolling update

7.Final Test - End-to-End Verification
Make a Small Change in the html file.
Commit and Push
Verify Kubernetes : kubectl get pods
Open the App in the browser to verify changes.
