#!/bin/bash

# Check if .env file exists and include it if it does
ifneq ("$(wildcard .env)","")
	include .env
	export  # Export all variables defined in .env
endif

# Target: start
# Description: Starts the Docker containers in detached mode.
start:
	docker compose up -d

# Target: stop
# Description: Stops the Docker containers.
stop:
	docker compose stop
	
# Target: restart
# Description: Restarts the Docker containers by stopping and then starting them.
restart:
	$(MAKE) stop && $(MAKE) start

# Target: bash
# Description: Opens a bash shell inside the WordPress container.
bash:
	docker exec -it $(WORDPRESS_CONTAINER_NAME) bash

# Target: mysql_bash
# Description: Opens a bash shell inside the MySQL container.
mysql_bash:
	docker exec -it $(MYSQL_CONTAINER_NAME) bash

# Target: logs
# Description: Displays the logs of the main application container (likely the WordPress container).  The exact container depends on docker-compose.yml
logs:
	docker logs $(WORDPRESS_CONTAINER_NAME)

# Target: nginx_logs
# Description: Displays the logs of the Nginx container.
nginx_logs:
	docker logs $(NGINX_CONTAINER_NAME)

# Target: mysql_logs
# Description: Displays the last 100 lines of the MySQL general log.
mysql_logs:
	docker exec -it $(MYSQL_CONTAINER_NAME) tail -n 100 /var/lib/mysql/general.log
