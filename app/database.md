```
docker run --detach \
  --name mysql_project_poll \
  --env MYSQL_ROOT_PASSWORD=root_password \
  --env MYSQL_USER=project_poll_user \
  --env MYSQL_PASSWORD=project_poll_password \
  --env MYSQL_DATABASE=project_poll_development \
  --publish 3306:3306 \
  mysql
```
