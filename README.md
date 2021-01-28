# Tooploox recruitment task

## RECRUITMENT TASK DESCRIPTION

### **JOB TITLE: Senior Cloud Engineer/ SRE**


<br>

Zadanie składa się z dwóch części:

1. Pierwsza część polega na przygotowaniu kodu terraforma, który zbuduje klaster GKE.
Proszę pamiętać o parametryzacji klastra (wielkość node’ów, lokacja, wersja Kubernetesa).
2. Druga część zadania polega na stworzeniu mechanizmu Continuous Deployment.
Mechanizm ma monitorować wybrany folder w repozytorium pod kątem zmian w plikach yaml, następnie po wykryciu zmiany deployować nowy plik na klaster GKE. Dobór narzędzi zostawiamy Tobie.


---
## Solution
1. GKE Cluster.
    
    GKE cluster creation terraform files can be found under [gke-cluster-terraform](gke-cluster-terraform/). 
    To get started create terraform.tfvars file with minimal content:
    ```
    service_account    = "<your GCP service account>"
    project_id         = "<your project id>"
    ```
    As default variables values will be used, regional cluster(`tooploox`) will be created in `us-central1`. 

2. Continous Deployment.

    [Cloud Build](https://cloud.google.com/cloud-build/docs/overview) was used for CD with GitHub based trigger defined in [trigger-terraform](trigger-terraform/). Minimal user variables for trigger:
    ```
    project_id     = "<your project id>"
    git_repo_owner = "<github username>"
    ```

Non default values for [cluster_name](gke-cluster-terraform/variables.tf), [watched_dir](trigger-terraform/variables.tf) and [region/zone](gke-cluster-terraform/variables.tf) must be also updated in [cloudbuild.yaml](cloudbuild.yaml).

---
Author: fieluba.dawid@gmail.com