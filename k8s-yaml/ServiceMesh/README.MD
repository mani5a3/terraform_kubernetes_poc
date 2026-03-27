
Flow: 
    frontend → backend service

            ↓

        VirtualService

            ↓
    subset selection (v1 / v2)

            ↓
    DestinationRule maps subset → pods

            ↓
        actual pod


kubectl create namespace istio-system
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
helm install istio-base istio/base -n istio-system
helm install istiod istio/istiod -n istio-system --set meshConfig.accessLogFile=/dev/stdout
helm install istio-ingress istio/gateway -n istio-system --> (optional) it creates the load balancer
 
To learn more about the release, try:
    $ helm status istiod -n istio-system
    $ helm get all istiod -n istio-system