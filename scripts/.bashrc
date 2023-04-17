alias k=kubectl
alias kn=kubens
alias w3p="watch -n3 -d \"kubectl get pod -A | egrep -v '(kube-system|kube-mon|istio|gitlab|elk|monitor|logstash|schedule)'\""
alias w3p_api="watch -n3 -d \"kubectl get pod -A --sort-by='.metadata.creationTimestamp' | grep '-api'\""
alias w3p_noapi="watch -n3 -d \"kubectl get pod -A --sort-by='.metadata.creationTimestamp' | egrep -v '(kube-system|kube-mon|monitor|istio|gitlab|elk|-api|schedule)'\""
alias w3po="watch -n3 -d \"kubectl get pod -A -owide| egrep -v '(kube-system|kube-mon|istio|gitlab|elk)'\""
alias w3pos="watch -n3 -d \"kubectl get pod -owide -A --sort-by='.spec.nodeName' | egrep -v '(kube-system|kube-mon|istio|gitlab|elk)'\""
alias knl="kubectl get pod -owide --sort-by='.spec.nodeName' -A | egrep -v '(kube-system|kube-mon|istio|schedule|gitlab|elk)'"
alias ktop="watch -n3 -d \"kubectl get hpa -A --no-headers; kubectl top node --no-headers; kubectl top pod -A --no-headers  --sort-by=cpu -A| egrep -v '(kube-mon|kube-system|istio-system|gitlab-runner|kube-mon)' | head -n26\""
alias ktopsm="watch -n3 -d \"kubectl get hpa -A --no-headers; kubectl top node --no-headers; kubectl top pod -A --no-headers  --sort-by=memory -A| egrep -v '(kube-mon|kube-system|istio-system|gitlab-runner|kube-mon)' | head -n26\""

