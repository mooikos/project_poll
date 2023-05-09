```
docker run --detach \
  --name postgres_project_poll \
  --env POSTGRES_PASSWORD=postgres \
  --env POSTGRES_DB=project_poll_database \
  --publish 5432:5432 \
  postgres

psql --username postgres
create user project_poll_user;
alter user project_poll_user with encrypted password 'project_poll_password';
grant all privileges on database project_poll_database to project_poll_user;
```
