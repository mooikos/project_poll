```
docker run --detach \
  --name postgres_project_poll \
  --env POSTGRES_PASSWORD=postgres \
  --env POSTGRES_DB=project_poll_development \
  --publish 5432:5432 \
  postgres

psql --username postgres --dbname project_poll_development
create user project_poll_user;
alter user project_poll_user with encrypted password 'project_poll_password';
create schema project_poll_schema authorization project_poll_user;
grant all privileges on schema project_poll_schema to project_poll_user;
grant all privileges on database project_poll_development to project_poll_user;
```
