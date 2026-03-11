
1) Ensure EKS & VPC prerequisites
2) Create IAM OIDC provider for the cluster
3) Create IAM policy for AWS Load Balancer Controller
4) Create a Kubernetes ServiceAccount with IAM role (IRSA)
5) Install AWS Load Balancer Controller (ALB Ingress)
6) Create an IngressClass for ALB
7) Deploy your application + Service
8) Create a Kubernetes Ingress resource
9) Verify ALB and test traffic

eksctl utils associate-iam-oidc-provider --cluster my-cluster --approve

It creates a bridge between AWS IAM and your EKS cluster.This bridge is called an OIDC Provider.

Without this → Pods cannot assume IAM roles (IRSA will not work).

To get OIDC URL --> aws eks describe-cluster --name terraform-eks-cluster --query "cluster.identity.oidc.issuer" --output text

The AWS Load Balancer Controller is a cluster-wide controller, It does NOT only manage resources in its own namespace.
                It watches:
                    All Ingress objects
                    All Service objects (type LoadBalancer)
                    Across all namespaces

kube-system is a reserved namespace for: 
                    CoreDNS
                    kube-proxy
                    VPC CNI
                    EBS CSI driver
                    AWS Load Balancer Controller
                    Metrics Server

When you install AWS Load Balancer Controller, you are installing a Kubernetes controller (just a pod running in your cluster).
It continuously watches:
        Ingress resources
        Service type = LoadBalancer
        TargetGroupBinding CRDs

# Install AWS Load Balancer Controller via Helm: 

 helm repo add eks https://aws.github.io/eks-charts
 helm repo update
 helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=terraform-eks-cluster \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=us-east-1 \
  --set vpcId=vpc-001369d41bff0bbb1

kubectl get pods -n kube-system # Verify Installation


# Install Without Helm (Official Way)
    curl -o v2_7_1_full.yaml https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.7.1/v2_7_1_full.yaml
edit below things in yaml:
    Cluster name
    Region
    ServiceAccount (if using IRSA, remove default SA section)


kubectl apply -f v2_7_1_full.yaml

Flow of ingress: 
                Browser
                ↓
                ALB (Listener 80)
                ↓ (Path rule match)
                /app1
                ↓
                Target Group: app1
                ↓
                Pod IP
                ↓
                Response back