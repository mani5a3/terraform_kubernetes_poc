                Pod
                │
                ▼
                ServiceAccount
                │
                ├── IRSA (IAM Role)
                │      │
                │      ▼
                │    AWS S3 Access
                │
                └── RoleBinding
                        │
                        ▼
                    Role
                        │
                        ▼
                Kubernetes API Access
Authentication: Authentication verifies the identity of the user or service accessing the Kubernetes API.
authorization: Authorization decides what actions the authenticated user can perform.


Authorization Mechanisms: 
            1) Node Authorizer
            2) attribute based access authorization
            3) role base access control
            4) webhook

KubeConfig: The main purpose of kubeconfig is to tell kubectl how to connect and authenticate with a Kubernetes cluster.

kubectl config get-contexts : It lists all contexts available in your kubeconfig file.
kubectl config current-context : it will give current context
kubectl config use-context context-name: to switch from one context to another context
kubectl config view --minify --> it will give  API server endpoint
kubectl cluster-info --> it will give cluster info
curl -k -H "Authorization: Bearer TOKEN_VALUE" https://5FE22D1EA5AC5245A33BC9BE2FF3E39A.gr7.us-east-1.eks.amazonaws.com/version 


An API Group is a collection of related Kubernetes resources exposed through the Kubernetes API.

Example resources:  Pods
                    Deployments
                    Services
                    StatefulSets

| API Group                 | Example Resources                  |
| ------------------------- | ---------------------------------- |
| core (no group)           | Pod, Service, ConfigMap            |
| apps                      | Deployment, StatefulSet, DaemonSet |
| batch                     | Job, CronJob                       |
| networking.k8s.io         | Ingress, NetworkPolicy             |
| rbac.authorization.k8s.io | Roles, RoleBindings                |


| Resource   | API Group         | RBAC apiGroups          |
| ---------- | ----------------- | ----------------------- |
| Pod        | core              | `[""]`                  |
| Service    | core              | `[""]`                  |
| Deployment | apps              | `["apps"]`              |
| Job        | batch             | `["batch"]`             |
| Ingress    | networking.k8s.io | `["networking.k8s.io"]` |


kubectl api-resources --> here you can see to which api group it belongs to.

kubectl auth can-i create deployments --> you can check the access by using this like whether you have pod creation or updation like that

kubectl auth can-i delete pods --as dev-user
kubectl auth can-i delete pods --as <username value> --namespace <value>
kubectl auth can-i list pods -n prod --as system:serviceaccount:dev:my-sa

kubectl api-resources --namespaced=true

            | Resource                     | Scope      | Description                              |
            | ---------------------------- | ---------- | ---------------------------------------- |
            | Pods                         | Namespaced | Smallest deployable unit                 |
            | ReplicaSets                  | Namespaced | Maintains number of pod replicas         |
            | Deployments                  | Namespaced | Manages ReplicaSets and updates          |
            | Jobs                         | Namespaced | Runs batch tasks once                    |
            | Services                     | Namespaced | Exposes pods inside or outside cluster   |
            | Secrets                      | Namespaced | Stores sensitive information             |
            | ConfigMaps                   | Namespaced | Stores configuration data                |
            | Roles                        | Namespaced | RBAC permissions within a namespace      |
            | RoleBindings                 | Namespaced | Assigns Role permissions to users/groups |
            | PersistentVolumeClaims (PVC) | Namespaced | Request storage from PV                  |

kubectl api-resources --namespaced=false

            | Resource                        | Scope   | Description                           |
            | ------------------------------- | ------- | ------------------------------------- |
            | Nodes                           | Cluster | Worker machines in cluster            |
            | Namespaces                      | Cluster | Logical isolation for resources       |
            | PersistentVolumes (PV)          | Cluster | Storage resource available to cluster |
            | StorageClasses                  | Cluster | Defines storage provisioning          |
            | ClusterRoles                    | Cluster | RBAC permissions across cluster       |
            | ClusterRoleBindings             | Cluster | Assigns ClusterRole permissions       |
            | CustomResourceDefinitions (CRD) | Cluster | Defines custom resources              |
            | MutatingWebhookConfiguration    | Cluster | Admission controller configuration    |
            | ValidatingWebhookConfiguration  | Cluster | Admission validation rules            |


