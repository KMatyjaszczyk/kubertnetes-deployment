# Database
## Setup
```
cd deployment
kubectl apply -f postgres-config.yaml
```
After database setup load DDL/DML script `db/database_setup.sql`  
## Configure connection in IDE
```
kubectl get pods # copy postgres pod name
kubectl port-forward 5433:5432 <postgres-pod-name>
```
Connection parameters:
- URL: `jdbc:postgresql://localhost:5433/postgres_db`
- username: `postgres`
- password: `12345`
***
# Api - backend
## Setup
```
cd transport-services-api
mvn clean install -DskipTests=true
docker build -t api:1.0 .
minikube image load api:1.0
cd ..\deployment
kubectl apply -f api-config.yaml
```
## Expose api url eg. for tests
```
minikube service api --url
```
***
# Frontend
## Setup
```
cd transport-services-react
docker build -t frontend:1.0 .
minikube image load frontend:1.0
cd ..\deployment
kubectl apply -f frontend-config.yaml
```
## Expose frontend url for usage from localhost
```
minikube service frontend --url
```
***
# Network policies
Two network policies are created:
- allow database to communicate with api
- allow api to communicate with backend and frontend
```
cd deployment
kubectl apply -f .\netpol-config.yaml
kubectl get netpol
```
***
# Useful commands
- check built images: `docker images`
- remove image: `docker image rm <image_name>`
- get into minikube: `minikube ssh`
  - inside minikube we can list and remove docker images
- list pods: `kubectl get pods`
- check pod's logs: `kubectl logs -f <pod_name>`
- list services: `kubectl get svc`