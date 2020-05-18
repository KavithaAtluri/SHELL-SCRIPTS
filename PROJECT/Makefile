WEB_SCRIPT="nginx-setup.sh"
STUDENT_APP_SCRIPT="app-student.sh"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[35m%-10s\033[0m %s\n", $$1, $$2}'

git:
	@echo -e "\e[33mpulling code from git ...\e[0m\n"
	@git pull &>/dev/null

web: git## Web Server setup, Configures Nginx
	@sh ${WEB_SCRIPT}

app: git## App Server setup, Configures STUDENT APP + PRODUCT APP
	@sh ${STUDENT_APP_SCRIPT}

db: git## DB Server Setup, Configures MariaDB + MongoDB +RabbitMQ
	@echo APP Install setup
