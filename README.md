<p align="center">
  <img width="126" height="126" alt="image" src="https://github.com/user-attachments/assets/9d988702-0739-44f1-97cb-57fa2d2dc38b" />
</p>

<h1 align="center">TASK APP</h1>

<p align="center">
  A full-stack task management application built incrementally over 12 weeks,<br/>
  demonstrating real-world DevOps and Cloud Engineering workflows.
</p>

---

## 📌 Project Overview

This project demonstrates how to implement DevOps and Cloud Engineering workflows starting from basic to advanced tools. The project spans 12 weeks, with each week introducing new tools and updates to improve the workflow and showcase real DevOps practices.

---

## 🔋 Technologies Used

### Core

![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=node.js&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

### CI/CD

![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)
![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white)

### 📦 Containers & Infrastructure

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)

### ☁️ Cloud

![Microsoft Azure](https://img.shields.io/badge/Microsoft_Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)

---

## Week 1 — Project Files and Dependencies

1. Install Node.js and restart your computer

2. Verify installation: `node -v && npm -v`

3. Create Frontend and Backend folders

4. Create `html`, `css`, and `js` files inside the frontend folder

5. Create `server.js` and `package.json` inside the backend

6. Install dependencies:

   ```bash
   cd backend
   npm install
   ```

   This creates: `node_modules/` and `package-lock.json`

7. Start the server:

   ```bash
   node server.js
   ```

   You should see: `Server running on http://localhost:3000`

8. Test the API — open in your browser:
   ```
   http://localhost:3000/tasks
   ```
   You should see an empty array `[]`

**Outcome:**

- ✅ Frontend working locally
- ✅ Backend working locally
- ✅ API endpoint returning empty array

---

## Week 2 — Git & GitHub

1. Initialize git from the main project folder:

   ```bash
   git init
   git status
   ```

2. Create a GitHub repo named `Task App` (leave all defaults) and create

3. Connect your local project to the repo:

   ```bash
   git remote add origin https://github.com/iampryce/Task-App.git
   ```

4. Push local code to GitHub:
   ```bash
   git branch -M main
   git add .
   git commit -m "Task App frontend + backend"
   git push -u origin main
   ```

---

## Week 3 — CI Pipeline with GitHub Actions

### Objectives

Create a YAML workflow file that automatically runs when code is pushed to GitHub:

- Checks out the repo
- Sets up Node.js
- Installs backend dependencies
- Simulates a test
- Shows logs
- ✅ Pipeline green if everything works — ❌ fails if something breaks

### Steps

1. Create the workflow folder:

   ```bash
   mkdir -p .github/workflows
   ```

2. Create the CI file:

   ```bash
   touch .github/workflows/ci.yml
   ```

   The `ci.yml` file tells GitHub what to do automatically when code is pushed.

3. Write or copy the YAML config into `ci.yml`

4. Push to GitHub:

   ```bash
   git add .github/workflows/ci.yml
   git commit -m "Week 2: Add CI pipeline"
   git push
   ```

5. Watch it run:
   - Go to your GitHub repo → **Actions** tab
   - Click **Week 2 CI Pipeline**
   - You should see: Checkout ✅ Setup Node.js ✅ Install dependencies ✅ Simulate test ✅

---

## Week 4 — Jenkins (Enterprise-style CI/CD)

### What is Jenkins?

| GitHub Actions            | Jenkins             |
| ------------------------- | ------------------- |
| Managed by GitHub servers | Self-managed server |

### Objectives

- Launch a Linux server
- Install Jenkins
- Access Jenkins via browser
- Connect Jenkins to GitHub repo
- Run first Jenkins build automatically

### Steps

**1. Launch a VM**

Allow inbound traffic: SSH (22), HTTP (80), Custom TCP: 8080 (Jenkins)

**2. Connect to Server and Install Java**

```bash
sudo apt update
sudo apt install fontconfig openjdk-21-jre
java -version
```

**3. Install Node.js**

```bash
sudo apt update
sudo apt install nodejs npm -y
```

**4. Install Jenkins**

Use the official docs for Ubuntu/Debian: https://www.jenkins.io/download/

```bash
# Add Jenkins key
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install
sudo apt update
sudo apt install jenkins

# Enable and start
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
```

**5. Access Jenkins**

Open in browser: `http://your-IP:8080`

Get the default password:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Complete setup → Install suggested plugins → Create admin user → Save

**6. Build Jenkins Pipeline Job**

1. Create new item → name it `task-app-jenkins-ci` → select **Pipeline**
2. Configure: Scroll to Pipeline → choose **Pipeline script from SCM** → SCM: Git → add repo URL → change branch to `main` → set script path to `Jenkinsfile` → Save
3. Create `Jenkinsfile` with pipeline script and push:
   ```bash
   git add Jenkinsfile
   git commit -m "Add Jenkins pipeline"
   git push
   ```
4. Go to Jenkins → click **Build Now** to verify

**7. Enable GitHub Webhook Trigger**

In Jenkins job → **Configure** → **Build Triggers** → ✅ GitHub hook trigger for GITScm polling → Save

In GitHub → **Settings** → **Webhooks** → Add Webhook:

- URL: `http://yourIP:8080/github-webhook/`
- Content Type: `application/json`
- Events: Just the push event

Test it:

```bash
git add .
git commit -m "Test Jenkins webhook"
git push
```

Jenkins will now build automatically on every push.

---

## Week 5 — Docker

### What is Docker?

Docker packages your application and all its dependencies into a single standardized container that runs consistently across any environment — from a developer's laptop to the cloud.

### Steps

**1. Create the Dockerfile** in the root of your project

**2. Build Docker Image locally**

```bash
docker build -t task-app .
```

**3. Run the Container**

```bash
docker run -p 3000:3000 task-app
```

Open: `http://localhost:3000`

**4. Push Dockerfile to GitHub**

```bash
git add Dockerfile
git commit -m "Add Dockerfile for containerization"
git push
```

**5. Install Docker on Jenkins Server**

```bash
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
```

**6. Allow Jenkins to Use Docker**

```bash
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
```

**7. Update Jenkinsfile** to add Docker build stage

Jenkins now: Pull repo → Install dependencies → Verify Node → Build Docker image

**8. Verify the Docker build** in Jenkins console output

**9. Confirm the image exists on the server:**

```bash
docker images
```

---

## Week 5B — Container Registry (Docker Hub)

### Objectives

Push Docker images to Docker Hub so they can be accessed from anywhere.

### Steps

**1. Create a repository on Docker Hub**

- Log in at https://hub.docker.com
- Navigate to **Repositories** → Add name and description → **Create**

**2. Login to Docker Hub on Jenkins Server**

```bash
sudo docker login
```

Use the secure browser login: https://login.docker.com/activate

**3. Tag your Docker image**

```bash
sudo docker images
sudo docker tag [IMAGE_ID] [dockerusername]/[reponame]:task-appv1
```

**4. Push the image**

```bash
docker push [your-username]/[your-repo-name]:task-appv1
```

**5. Verify on Docker Hub**

Go to hub.docker.com → your repository → **Tags** tab

**6. Pull and Run from anywhere**

```bash
docker pull YOUR_DOCKER_USERNAME/your-repo-name:v1
docker run -p 8080:3000 YOUR_DOCKER_USERNAME/your-repo-name:v1
```

**7. Automate in Jenkins**

Update Jenkinsfile to add:

- **Tag stage** → prepares image for Docker Hub
- **Push stage** → uploads image automatically

```bash
# On Jenkins server
sudo su - jenkins
docker login
```

```bash
git add .
git commit -m "Automate Docker push in Jenkins"
git push
```

---

## Week 6 — Infrastructure as Code (Terraform + Azure)

### What is Terraform?

Terraform lets you define and create cloud infrastructure using code instead of manual clicks in the console.

### Objectives

1. Install Terraform
2. Connect Terraform to Azure
3. Create a VM using code
4. SSH into the server

### Steps

**1. Install Terraform and Azure CLI**

- Download Terraform: https://developer.hashicorp.com/terraform/downloads
- Download Azure CLI: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli

Verify:

```bash
terraform -v
az version
```

Login and configure Azure:

```bash
az login --use-device-code
az account show
az account list --output table
az account set --subscription "SUBSCRIPTION_ID"
```

**2. Create Terraform Files**

```bash
mkdir terraform-ec2
cd terraform-ec2
touch main.tf
```

Copy the Terraform configuration into `main.tf`.

**3. Generate SSH Key Pair**

```bash
ssh-keygen -t rsa -b 4096 -m PEM -f ~/.ssh/azure-devops-key.pem
ls ~/.ssh
```

- `~/.ssh/azure-devops-key.pem` → private key (keep secure)
- `~/.ssh/azure-devops-key.pem.pub` → public key (shared with server)

**4. Run Terraform**

```bash
terraform init    # Downloads provider plugins
terraform plan    # Preview changes
terraform apply   # Create infrastructure
```

SSH into your server:

```bash
ssh -i ~/.ssh/azure-devops-key.pem azureuser@YOUR_PUBLIC_IP
```

**5. Verify on Azure Portal**

Open the portal and confirm all resources were created.

**6. Clean Up**

```bash
terraform destroy
```

> Create a `.gitignore` file to exclude Terraform state files from being pushed to GitHub.

---

## Week 7 / 8 — Kubernetes + Full App (Frontend + Backend)

### Overview

At this stage, we move from a single containerized application to a realistic production-ready structure with separate Frontend and Backend services.

| Service      | Responsibility                         |
| ------------ | -------------------------------------- |
| **Frontend** | User interface (HTML, CSS, JavaScript) |
| **Backend**  | App logic and APIs                     |

### What is Kubernetes?

Kubernetes is a system that automatically runs and manages containerized applications. Instead of manually starting containers and restarting them when they fail, Kubernetes takes over these responsibilities and ensures the application is always running as expected.

**Key benefits:**

- Automatically restarts failed containers
- Scales up or down based on demand
- Manages communication between services using stable internal names (e.g. `backend-service`)
- Shifts container management responsibility from the developer to the system

### Build Docker Images — Frontend & Backend

1. Create a `Dockerfile` inside both `frontend/` and `backend/` folders (delete the old root Dockerfile)

2. Build images:

   ```bash
   docker build -t [username]/[backend-repo]:latest ./backend
   docker build -t [username]/[frontend-repo]:latest ./frontend
   ```

3. Verify images:

   ```bash
   docker images
   ```

4. Push to Docker Hub:
   ```bash
   docker push [backend-image]
   docker push [frontend-image]
   ```

### Kubernetes Steps

**1. Install Kubernetes (K3s) on VM**

```bash
curl -sfL https://get.k3s.io | sh -
sudo kubectl get nodes
```

**2. Backend Deployment**

```bash
mkdir k8s
```

Create `k8s/backend-deployment.yaml` with your backend image, then apply:

```bash
sudo kubectl apply -f backend-deployment.yaml
sudo kubectl get pods
```

**3. Create Backend Service**

Create `k8s/backend-service.yaml`, push to GitHub, pull to VM, then apply:

```bash
sudo kubectl apply -f backend-service.yaml
sudo kubectl get svc
```

You should see a ClusterIP and port 3000 listed.

**4. Frontend Deployment**

Create `k8s/frontend-deployment.yaml` and `k8s/frontend-service.yaml`, push and pull to VM, then apply:

```bash
sudo kubectl apply -f frontend-deployment.yaml
sudo kubectl apply -f frontend-service.yaml
sudo kubectl get pods
sudo kubectl get svc
```

**5. Verify**

```bash
curl http://localhost:30007
```

If you get HTML back — Kubernetes is working and the frontend is running ✅

**6. Open firewall port**

Update `main.tf` NSG rules:

```hcl
security_rule {
  name                       = "allow-frontend"
  priority                   = 1004
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "30007"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}
```

```bash
terraform apply
```

Test in browser: `http://YOUR-VM-IP:30007`

---

## Jenkins → Kubernetes Integration

Every push triggers a full automated pipeline:

```
Push Code → Jenkins builds images → Jenkins pushes to Docker Hub → Jenkins updates Kubernetes → Kubernetes pulls new image → Rolling update
```

### Setup Steps

**1. Update your Jenkinsfile** to build both services, push to Docker Hub, and deploy to Kubernetes

**2. Generate a Docker Hub Access Token**

- hub.docker.com → Profile → **Account Settings** → **Security** → **New Access Token**
- Description: `jenkins-ci` | Access: **Read & Write**
- Copy the token immediately — you won't see it again

**3. Add credentials to Jenkins**

Manage Jenkins → Credentials → System → Global → **Add Credentials**

| Field       | Value                    |
| ----------- | ------------------------ |
| Kind        | Username with password   |
| Username    | your Docker Hub username |
| Password    | paste the access token   |
| ID          | `dockerhub-creds`        |
| Description | Docker Hub Access Token  |

**4. Give Jenkins access to Kubernetes**

SSH into your VM:

```bash
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
sudo usermod -aG sudo jenkins
```

**5. Add Jenkins to sudoers**

```bash
sudo visudo
```

Add at the bottom:

```
jenkins ALL=(ALL) NOPASSWD: /usr/local/bin/kubectl
```

**6. Restart Jenkins**

```bash
sudo systemctl restart jenkins
```

**7. Test the full pipeline**

```bash
git add .
git commit -m "add jenkins cicd"
git push
```

**8. Verify deployment**

```bash
kubectl get pods
```

You should see newly created pods with a recent AGE — confirming Jenkins built, pushed, and Kubernetes deployed the update automatically ✅

**9. End-to-End Final Test**

1. Make a small change in the HTML file
2. Commit and push
3. Verify pods: `kubectl get pods`
4. Open the app in the browser and confirm changes are live

---

## Week 9 — Monitoring (Prometheus & Grafana)

### Overview

This phase introduces full observability into the system by deploying a monitoring stack inside Kubernetes. Prometheus collects metrics from the cluster, and Grafana provides a visual dashboard to explore them in real time.

### Steps

**1. Install Helm on your server**

```bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm version
```

Helm installs complex applications into Kubernetes using pre-configured packages. Instead of writing many YAML files manually, Helm handles it for you.

**2. Add Prometheus Repository**

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```

Connects Helm to the public repository that contains ready-made configurations for Prometheus and Grafana.

**3. Update Helm Repositories**

```bash
helm repo update
```

Fetches the latest versions of all packages, ensuring you install the most up-to-date monitoring stack.

**4. Configure Kubernetes Access**

```bash
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
```

Gives your user permission to read the Kubernetes config file. Without this, Helm and kubectl cannot connect to the cluster.

**5. Export KUBECONFIG**

```bash
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
```

Tells your system which config file to use to connect to Kubernetes.

Test the connection:

```bash
kubectl get nodes
```

**6. Install Monitoring Stack**

```bash
helm install monitoring prometheus-community/kube-prometheus-stack
```

Deploys a complete monitoring system into your Kubernetes cluster in one command — Prometheus, Grafana, and Alertmanager all included.

**7. Verify Installation**

```bash
kubectl get pods
```

You should see new pods for Prometheus, Grafana, and Alertmanager — confirming the monitoring stack is running ✅

**8. Configure Grafana Service Ports**

Check the current Grafana service:

```bash
kubectl get svc monitoring-grafana
```

You will see `TYPE: ClusterIP` — meaning it's internal only and not accessible from outside the cluster.

Create `k8s/grafana-service.yaml` with the following:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: monitoring-grafana
  namespace: default

spec:
  type: NodePort

  selector:
    app.kubernetes.io/instance: monitoring
    app.kubernetes.io/name: grafana

  ports:
    - name: http-web
      port: 80
      protocol: TCP
      targetPort: 3000
      nodePort: 32000
```

Push to GitHub:

```bash
git add .
git commit -m "Expose Grafana via NodePort"
git push
```

Pull on your VM:

```bash
cd Task-App
git pull
```

Delete the old service and apply the new one:

```bash
kubectl delete svc monitoring-grafana
kubectl apply -f k8s/grafana-service.yaml
kubectl get svc monitoring-grafana
```

You should now see: `NodePort 80:32000/TCP` ✅

Update `terraform-ec2/main.tf` to open port 32000 and apply:

```hcl
security_rule {
  name                       = "allow-grafana-nodeport"
  priority                   = 1009
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "32000"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}
```

```bash
terraform apply
```

**9. Login to Grafana**

Open in your browser: `http://YOUR_SERVER_IP:32000`

Get the admin password:

```bash
kubectl get secret monitoring-grafana -o jsonpath="{.data.admin-password}" | base64 -d ; echo
```

| Field    | Value       |
| -------- | ----------- |
| Username | `admin`     |
| Password | your output |

**10. Open Kubernetes Dashboards**

In Grafana you should see pre-built folders:

- Kubernetes / Compute Resources / Node
- Kubernetes / Compute Resources / Pod
- Kubernetes / Networking

Launch your app, perform some tasks, then return to Grafana and watch the metrics spike in real time.

### Full Pipeline Flow

```
GitHub → Jenkins → Docker → Kubernetes → App runs → Prometheus collects data → Grafana shows it
```

### Conclusion

This phase introduced the feedback layer into the DevOps workflow. Without monitoring, systems operate blindly — making it difficult to detect issues or understand performance. With Prometheus and Grafana in place, the cluster can now observe itself, tracking CPU usage, memory, pod health, and application resource usage in real time.

The pipeline has evolved beyond just building and deploying. It now includes full observability — a foundational requirement for any production-ready environment.
