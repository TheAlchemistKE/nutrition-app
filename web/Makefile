.PHONY: docker-build-webapp docker-build-deploy-webapp

PROJECT_ID=nutrinow-338709
APP_PORT=80

docker-build-webapp:
	@echo Build WebApp
	@docker build -t gcr.io/$(PROJECT_ID)/nutrinow-webapp:v1 . -f Dockerfile \
    			--build-arg PROJECT_ID=$(PROJECT_ID) \
                --build-arg APP_PORT=$(APP_PORT)

docker-deploy-webapp:
	@echo Deploy WebApp
	@docker push gcr.io/$(PROJECT_ID)/nutrinow-webapp:v1

docker-build-deploy-webapp: docker-build-webapp docker-deploy-webapp
