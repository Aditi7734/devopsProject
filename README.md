## README.md

````markdown
# DevOps CI/CD Web Application Project

## Prerequisites
- Git
- Jenkins
- Docker
- Docker Hub account
- Kubernetes (Minikube)
- kubectl

## Setup Steps

### 1. Clone Repository
```bash
git clone https://github.com/your-username/devops-cicd-demo.git
cd devops-cicd-demo
````

### 2. Update Configuration

* Replace `your-dockerhub-username` in:

  * `Jenkinsfile`
  * `k8s/deployment.yaml`
* Replace the GitHub repository URL in `Jenkinsfile`.

### 3. Create Jenkins Credentials

* Open Jenkins → Manage Jenkins → Credentials.
* Add Docker Hub username/password.
* Set the credential ID to `dockerhub-creds`.

### 4. Start Minikube

```bash
minikube start
```

### 5. Configure Jenkins Agent

Ensure Jenkins can run:

* `docker`
* `kubectl`

### 6. Create Pipeline Job

* New Item → Pipeline
* Pipeline script from SCM
* Select Git
* Enter repository URL
* Script Path: `Jenkinsfile`

### 7. Run the Pipeline

Click **Build Now**.

### 8. Access the Application

```bash
minikube service devops-cicd-demo-service --url
```

## Expected Workflow

1. Push code to GitHub.
2. Jenkins triggers automatically.
3. Docker image is built and pushed to Docker Hub.
4. Kubernetes deploys the latest version.
5. Application is accessible in the browser.

```

---

## Customization Checklist

Before running the project, update these placeholders:
- `your-dockerhub-username`
- `your-username`
- Docker Hub credentials in Jenkins

---

## Interview Explanation

**Project Summary:** This project automates software deployment using GitHub, Jenkins, Docker, and Kubernetes. Whenever code is pushed to GitHub, Jenkins builds a Docker image, pushes it to Docker Hub, and deploys the latest version to a Kubernetes cluster.
