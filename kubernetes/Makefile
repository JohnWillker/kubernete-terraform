minikube/init:
	minikube start
	minikube addons enable ingress
	minkube ip
	sudo bash -c 'echo "$(minikube ip) hello-node.local" >> /etc/hosts'
	eval $(minikube docker-env)

docker/build:
	docker buil -t node-app .

helm/init:
	kubectl apply -f deploy/helm_rbac.yml
	helm init --service-account tiller --upgrade
	kubectl rollout status -n kube-system -w "deployment/tiller-deploy"

helm/deploy:
	helm upgrade --install \
			--set image.repository="node-app" \
			--set image.tag="latest" \
			--set image.pullPolicy=Never \
			--set application.track="stable" \
			--set releaseOverride="production-node" \
			--set serviceweb.enabled="true" \
			--set service.internalPort="3000" \
			--set service.externalPort="80" \
			--set service.type="NodePort" \
			--set service.probe.healthcheck="/" \
			--set replicaCount="3" \
			--set application.application_name="node-app" \
			--set show.name="Jhonn" \
			--set livenessprobe.initialDelaySeconds="15" \
			--set readinessprobe.initialDelaySeconds="15" \
			--set resources.requests.memory="100Mi" \
			--set resources.requests.cpu="100m" \
			--set resources.limits.memory="500Mi" \
			--set resources.limits.cpu="1000m" \
			--namespace="node-app" \
			--version="1" \
			"production-node" \
			deploy/
	kubectl rollout status -n node-app -w "deployment/production-node"

helm/delete:
	helm delete --purge production-node

test:
	curl hello-node.local

deploy: minikube/init docker/build helm/init helm/deploy test
