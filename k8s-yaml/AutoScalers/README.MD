Why Metrics Server is required for HPA: 
           1) Metrics Server collects CPU and memory usage from kubelets on each node.
           2) HPA uses these metrics to decide whether to scale pods

Install Metrics Server: kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

and then check kubectl get pods -n kube-system