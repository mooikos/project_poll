# project poll

project for polling for events

## running locally

run server
- `bundle exec ruby app/project_poll.rb`

database framework
- https://github.com/jeremyevans/sequel (/ https://devhints.io/sequel)
- security: https://github.com/jeremyevans/sequel/blob/master/doc/security.rdoc

## hosting docs

ruby apps docs
- https://fly.io/docs/languages-and-frameworks/ruby/

apps dashboard
- https://fly.io/dashboard

requires gem in bundle
- `rackup`

install CLI
- `brew install flyctl`

auth CLI
- `fly auth login`

prepare for deployment
- `flyctl launch`
- will generate files
  - `Dockerfile`
  - `fly.toml`

deploy
- `fly deploy`
