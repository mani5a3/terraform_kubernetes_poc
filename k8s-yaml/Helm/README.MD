Helm charts are stored in repositories (like app stores). Let’s use Bitnami, hashicorp, stable etc..
   helm repo add bitnami https://charts.bitnami.com/bitnami --→ adds a repository
   helm repo update --> updates the list of available charts

Check if the nginx chart is available: helm search repo nginx

Install nginx chart: helm install my-nginx bitnami/nginx -> instead my-nginx you can give whatever we want that is release name


helm pull bitnami/nginx --untar --> it will download helm chart

helm template my-nginx bitnami/nginx -> This generates the actual Kubernetes YAML manifests locally and prints them to your terminal and You can see what would be applied to the cluster without actually creating any resources




helm install -f <foldername>/values.yaml -n <namespace> <release name> ./<foldername> --> to install custom helm chart


helm create helloworld --> it will create custom helm chart

Helm chart contains  --> chats.yaml --> metadata
                     --> values.yaml --> passing custom values to template
                     --> templates --> contains deployment, service, load balancer, volume, config map etc..
                     --> charts --> dependencies for your application redis etc..


helm package shipping --> it will create bundle or chart.

helm repo index . --> it will create an index file for your chart
 
# To install a Helm chart from a repository, we add the repo containing index.yaml, update it, and then install using repo/chart-name. 

helm install payments-app ./payments --> to install custom helm


pipe : name: {{ .Values.name | upper }} -->ex:  name: payments  --> name: PAYMENTS


example for include: You write once → reuse everywhere

     (_helpers.tpl):
            {{- define "payments.fullname" }}
            {{ .Release.Name }}-{{ .Chart.Name }}
            {{- end }}

      metadata:
      name: {{ include "payments.fullname" . }}


      Release = payments-app Chart = payments

      name: payments-app-payments