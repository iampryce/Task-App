

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

 2.  Verify if node is installed: run  node -v && npm -v

 3.  Created Frontend and back end folder 

 4.  Created html, css and js files  inside the frontend folder 

 5.  Created server.js and package.json inside the backend 

 6.  Install Dependencies: cd backend -> run npm install This creates : node modules/ package-lock.json

 7.  Start Server: run node server.js    you should see Server running on http://localhost:3000 (this is to be sure everything is working)

 8.  Test API : copy ->  http://localhost:3000/tasks to your browser you should see an empty array [ ]

 9.  Frontend working locally

 10.  Backend working locally

 11.  API endpoint returning empty array


## (Git & GitHub)

 1.  Initialize git : go to the main folder  Task-Manger-App/ and run : git init   you can check if your git is initialized by runing: git status

 2.  Create a github repo Name Task App leave all as default and create 

 3.  Connect Your Local Project to your repo: got to the main local folder Task-Manger-App/ run:  git remote add origin(copy the link in your repo here)          example:   git remote add origin https://github.com/iampryce/Task-App.git

 4.  Push Local Code to github repo: Before this make sure your are in the main branch you can run this code to set it up: git branch -M main  then run:  git add .    to add the files you wish to commit to staging area.  

 5.  Commands:  (make sure your in the main folder)

 6.  git branch -M main  (set it to main branch)

 7.  git add .     (add your filles to staging)

 8.  git commit -m "Task App frontend + backend"   (commit your project files)

 9.  git push -u origin main     (push to main branch)



##  Week 2  (CI Pipeline  GitHub Action) 

### Objectives:

We will create a yaml file and give it actions we want it to take when we push the file to our repo.

When we push code.

GitHub will automatically Checkout repo

Sets up Node.js

Installs backend dependencies

Simulates a test

Shows logs

If something breaks -> pipeline fails 

If everything works  -> pipeline green 

---------------------------------------------------------------------------------------
### 1. Create workflow folder inside the root: mkdir -p .github/workflows

### 2. Create CI file inside the github/workflows:  touch ci.yml 
The ci.yml  file tells GitHub what to do automatically when we push the code.

### 3. Write or copy the yml codes to the ci.yml file

### 4. Push It   run:   git add .github/workflows/ci.yml
git commit -m "Week 2: Add CI pipeline"
git push

### 5.  Watch It Run
Go to your GitHub repo
Click Actions tab
Click Week 2 CI Pipeline
Watch it run
You should see.
Checkout repository, Setup Node.js , Install dependencies ,Simulate tes and it should end with: Success green.



## Week 3    (Jenkins – Enterprise-style CI/CD.) 

### What ia Jenkins in simple terms.

Github Action is managed by GIthub sever

Jenkins Sever is self managed.

Objectives:
Launch a Linux server

Install Jenkins

Access Jenkins via browser

Connect Jenkins to GitHub repo

Run  first Jenkins build

Outcome:
GitHub repo  -> Jenkins  -> Build runs automatically 

Steps
1. Launch EC2 Server  
Allow inbound traffic: SSH (22)           HTTP (80)        Custom TCP: 8080 (for Jenkins)

2. Connect to Server ( install Java )  sudo apt update   sudo apt install fontconfig openjdk-21-jre    Verify java version:   java -version 

3. Install Node.js   :  sudo apt update     sudo apt install nodejs npm -y

4. Install Jenkins: use the official documentation for Ubuntu debian https://www.jenkins.io/download/      select Ubuntu/debian and follow the installation process 

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


5. Access Jenkins in Browser  http://your IP:8080  change the ip before the port to your own. Get the jenkins defualt password when the window opens : 

sudo cat /var/lib/jenkins/secrets/initialAdminPassword     

Complete Jenkins Setup, Install suggested plugins , Create admin user , Save and continue.

Building Jenkins Pipeline job and connecting it to the Task App.
Steps

1. Create Pipeline Job : create a new item and name it :  task-app-jenkins-ci , Selet pipeline. 

2. Configure Pipeline : Scroll to pipeline and choose Pipeline script from SCM and select  SCM → Git,  add your repo URL ----------   ,  change to main  if it says master by default, create a script path for Jenkinsfile  and  Save after.    

3. Create a Jenkinsfile, and paste the pipeline script .  GitHub Actions uses YAML for configuration. Jenkins uses a Groovy based pipeline language for scripting builds. So this is similar but just better than GitHub Action YAML.

4. Push the Jenkins file to your repo git add Jenkinsfile    git commit -m "Add Jenkins pipeline"     git push

5.Run Jenkins Build: Go back to Jenkins and click Build Now  Verify if it works. This was manual because we had to click build now we will automate in the next step.

6. Enable GitHub Trigger in Jenkins: Go to your Jenkins job and click configure. Scroll down to Build Triggers  and select GitHub hook trigger for GITScm polling . and save.

7. Add Webhook in GitHub: Go to your GitHub repo  Settings -> Webhooks ->  Add Webhook. Copy ypur jenkins url that contains your or ip http://yourIP:8080 and add  /github-webhook/ at the end.

 Eg:  http://yourIP:8080/github-webhook/ and make sure it is http not https.   Content Type: application/json  Which events: Just the push event   then click add Webhook.  

To test this: Make some changes in your local folder, maybe your html code. Then save and push to test. Now we don’t need to click build in jenkins it will run automatically. 


git add .

git commit -m "Test Jenkins webhook"

git push





