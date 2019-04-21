IMAGE_NAME=gcr.io/radical-sloth/example-static-site-migration-to-kubernetes

.PHONY: build
build:
	@docker build -t $(IMAGE_NAME) .

.PHONY: push
push:
	@docker push $(IMAGE_NAME)

.PHONY: run
run:
	@echo "Running on http://0.0.0.0:8000"; \
	docker run -p 8000:80 $(IMAGE_NAME)

.PHONY: deploy
deploy:
	@kubectl apply -f kubernetes/deployment.yaml -f kubernetes/service.yaml
