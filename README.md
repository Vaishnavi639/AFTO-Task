- Developed a basic **Todo list application** using Python's Flask framework.
- **Dockerized** using a **Multistage Dockerfile** to produce minimal and efficient images.
- Set up a **CI/CD pipeline using GitHub Actions** to automate:
  - Building Docker images
  - Tagging images with commit SHA
  - Pushing images to **Docker Hub**
  - Triggering deployment via **Docker Compose** on an AWS EC2 instance
-  Used a **self-hosted GitHub Actions runner on AWS EC2** for deployment.
-  Chose **Docker Hub** instead of Amazon ECR to avoid additional data transfer costs, which is ideal for startups and cost-conscious environments.

---
![Image](https://github.com/user-attachments/assets/29c63ddb-bc4a-4779-a8df-56d26e2161bf)

##  Tech Stack

| Component       | Tool/Service               |
|----------------|----------------------------|
| Backend         | Flask (Python)             |
| Containerization| Docker (Multistage Build)  |
| Orchestration   | Docker Compose             |
| CI/CD           | GitHub Actions             |
| Deployment      | Self-hosted runner on EC2  |
| Registry        | Docker Hub                 |
| Infrastructure  | AWS EC2 (Ubuntu)           |

---


---

## CI/CD Pipeline Flow

1. Developer pushes code to the `main` branch.
2. GitHub Actions triggers the workflow.
3. Docker image is built and tagged using commit SHA.
4. The image is pushed to Docker Hub.
5. A **self-hosted runner** on AWS EC2 pulls the latest image.
6. The app is (re)deployed using `docker-compose`.

---

##  Security & Best Practices

- Used **GitHub Secrets** to store Docker credentials.
- Built images are **tagged with unique Git SHAs** for traceability.
- Deployments occur **only from the main branch** to maintain production integrity.
- Docker Compose allows easy extension for multiple services (e.g., database, Redis).

---

##  Future Enhancements

- Add persistent storage with a database (e.g., PostgreSQL).
- Implement user authentication.
- Add automated testing (e.g., with `pytest`) in CI pipeline.
- Integrate logging & monitoring (Prometheus + Grafana).
- Deploy using ECS Fargate or Kubernetes for scaling.

---

##  Why Docker Hub over ECR?

While Amazon ECR is suitable for production-scale registries, it incurs **data transfer charges** when pulling images from EC2 in different availability zones. For this demo and in cost-sensitive environments (like startups), **Docker Hub** is a simpler and more budget-friendly alternative.

---



## Getting Started (Local)

```bash
# Clone the repo
git clone https://github.com/Vaishnavi639/AFTO-Task.git
cd your-repo-name

# Build and run using Docker Compose
docker-compose up --build




