# docker-wordpress-dev

## .env file
You need to create a .env file in the root directory of this repository. For example:

```sh
IP=127.0.0.1
PROJECT_NAME=<replace_by_your_project_name>
DOMAIN=<replace_by_your_project_name>.local
WORDPRESS_DB_NAME=<wordpress_database_name>
WORDPRESS_DB_USER=<wordpress_database_user>
WORDPRESS_DB_PASSWORD=<wordpress_database_password>
MYSQL_ROOT_PASSWORD=<mysql_root_password>
WORDPRESS_DEBUG=<true/false>
```

Another example:

```bash
IP=127.0.0.1
PROJECT_NAME=foo
DOMAIN=foo.local
WORDPRESS_DB_NAME=wp-foo
WORDPRESS_DB_USER=wp_foo_db_user
WORDPRESS_DB_PASSWORD=wp123456
MYSQL_ROOT_PASSWORD=root
WORDPRESS_DEBUG=true
```

## Create certificates to eanble SSL

To enable HTTPS support, we need to create SSL certificates for our local environment. In the **cli** directory, you will find scripts that assist with this process. Specifically, the add-host.sh script adds the selected PROJECT_NAME to the hosts file, and the create-sh script generates the SSL certificates associated with the PROJECT_NAME. For example:

```bash
cd cli
bash add-hosts.sh
bash create-cert.sh
```

## Run docker
You can use makefile in order to start/restart, stop, see logs of docker. Make sure you're in root of the repository

```bash
make start
```

## xdebug
By default, this repository enable xdebug (see docker/Dockerfile). If you use Visual Studio Code, the configuration is:
```bash
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for Xdebug",
            "type": "php",
            "request": "launch",
            "port": 9003,
            "pathMappings": {
                "/var/www/html": "${workspaceFolder}/wordpress"
            }
        }
    ]
}
```


