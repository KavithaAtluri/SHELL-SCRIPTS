WEB_SCRIPT="nginx-setup.sh"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[35m%-10s\033[0m %s\n", $$1, $$2}'
web: ## Web Server setup, Configures Nginx
	@sh ${WEB_SCRIPT}
app: ## App Server setup, Configures STUDENT APP + PRODUCT APP
	 @echo APP Install setup
db: ## DB Server Setup, Configures MariaDB + MongoDB +RabbitMQ
	 @echo APP Install setup
