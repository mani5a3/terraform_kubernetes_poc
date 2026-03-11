# aws eks update-kubeconfig --region <region> --name <cluster-name>

Kubernetes components:
   Control server: 1) Api server 2) etcd 3) scheduler 4) controller
   Data plane or node or worker node: 1) kubelt 2) container engine 3) kube proxy


Api Server: Entry Point to the Cluster. All the requests from kubelet, controller, scheduler will come to this component

Controller: Watches the cluster state and makes sure the actual state matches the desired state
    1) Watch the API Server
    2) Compare desired vs current state
    3) Take action to fix differences

Scheduler: When a Pod is created, Pod has no node assigned then Scheduler sees this Pod and checks all nodes and Picks the best node

etcd : etcd is the key-value database where Kubernetes stores all cluster data like pod, service, deployments etc..

kubelet:
    Step-by-step flow:
        Pod crashes on Node
        kubelet detects failure
        kubelet updates Pod status in the API Server
        The controller is watching the API
        Controller sees Pod is failed / missing
        Controller creates a replacement Pod



Kubernetes Complete Concepts Checklist:
1) Core Fundamentals:
        Kubernetes Architecture
        Control Plane Components
        Node Components
        Cluster vs Node vs Pod
        Container Runtime (containerd / CRI-O)
        Kubernetes API 
        etcd

2) Workloads (Running Applications):
        Pod
        Multi-container Pod (Sidecar, Init, Adapter patterns)
        Init Containers
        Ephemeral Containers
        Labels
        Selectors
        Annotations

3) Controllers:
        ReplicaSet
        Deployment
        Rolling Updates
        Rollbacks
        DaemonSet
        StatefulSet
        Jobs
        CronJobs
        ReplicationController (legacy)

5) Networking:
        Cluster Networking Model
        Pod-to-Pod Communication
        Service
        ClusterIP
        NodePort
        LoadBalancer
        Headless Service
        Endpoints / EndpointSlice
        kube-proxy
        CoreDNS
        Ingress
        Ingress Controller
        Gateway API
        Network Policies
        CNI Plugins

5) Storage:
        Volumes
        emptyDir
        hostPath
        PersistentVolume (PV)
        PersistentVolumeClaim (PVC)
        StorageClass
        Dynamic Provisioning
        Access Modes (RWO, ROX, RWX)
        Reclaim Policies
        CSI Drivers
        Volume Snapshots
        Stateful Storage with StatefulSets

6) Configuration Management:
        ConfigMaps
        Secrets
        Environment Variables
        Downward API
        Projected Volumes

7) Security:
        Namespaces
        RBAC (Role, ClusterRole, RoleBinding, ClusterRoleBinding)
        Service Accounts
        Pod Security Standards
        Security Context
        Network Policies
        TLS in Kubernetes
        ImagePullSecrets
        Secrets Encryption at Rest
        Admission Controllers
        OPA / Gatekeeper

8) Scheduling & Resources:
        Scheduler
        Resource Requests
        Resource Limits
        QoS Classes
        NodeSelector
        Node Affinity
        Pod Affinity / Anti-Affinity
        Taints
        Tolerations
        Topology Spread Constraints
        Priority Classes
        Pod Disruption Budget (PDB)

9) Scaling & Reliability:
        Horizontal Pod Autoscaler (HPA)
        Vertical Pod Autoscaler (VPA)
        Cluster Autoscaler
        Self-Healing
        Liveness Probe
        Readiness Probe
        Startup Probe

10) Updates & Deployment Strategies:
        Rolling Update
        Recreate Strategy
        Blue-Green Deployment
        Canary Deployment

11) Observability:
        kubectl logs
        kubectl exec
        kubectl describe
        Events
        Metrics Server
        Prometheus
        Grafana
        EFK / ELK Logging Stack
        Distributed Tracing (Jaeger)

12) Cluster Management:
        kubeadm
        Managed Kubernetes (EKS, AKS, GKE)
        Node Upgrade
        Control Plane Upgrade
        Backup & Restore etcd
        Cluster Networking Setup
        High Availability Control Plane

13) Advanced Workloads:
        Operators
        Custom Resource Definitions (CRDs)
        Helm
        Kustomize
        GitOps (ArgoCD / Flux)
        Service Mesh (Istio / Linkerd)
        Multi-Cluster
        Federation

14) CI/CD Integration:
        kubectl in pipelines
        Helm in CI/CD
        GitHub Actions with Kubernetes
        Image Tagging Strategies
        Rollback via CI/CD

15) Troubleshooting:
        Pod CrashLoopBackOff
        ImagePullBackOff
        Pending Pods
        Node NotReady
        DNS Issues
        Network Debugging
        Resource Starvation

16) Runtime & Internals:
        Kubelet
        kube-proxy
        CRI (Container Runtime Interface)
        CNI (Container Network Interface)
        CSI (Container Storage Interface)
        Container Lifecycle Hooks
        Graceful Termination
        Garbage Collection

17) Policies & Governance:  
        Resource Quotas
        LimitRanges
        Pod Security Admission
        Kyverno
        OPA Policies

18) Emerging & Pro Level:
        eBPF in Kubernetes
        Gateway API vs Ingress
        WASM Workloads
        Karpenter (EKS autoscaling)
        Cluster API
        RuntimeClass
        Seccomp / AppArmor


Aws eks cluster creation using aws cli: 