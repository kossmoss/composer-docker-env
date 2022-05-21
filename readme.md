# Docker environment for composer packages management

Simple docker environment made to quick deploy, manage and test maintained composer packages 

PHP 8.1 used to make old packages compatible with their dependencies new versions.

User's home directory /home/composer_docker stored in Docker volume to ease access to recent commands history and customize personal preferences.

```
docker-compose run php bash
```
