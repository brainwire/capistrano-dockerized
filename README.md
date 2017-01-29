# Capistrano::Dockerized

Add tasks for capistrano to deploy with docker compose.

## Installation

Add this line to your Gemfile

``` ruby
gem 'capistrano-dockerized'
```

And then execute:

``` bash
$ bundle
```

Or install it yourself as:

``` bash
$ gem install capistrano-dockerized
```

## Usage

Add this line to your `Capfile`:

``` ruby
require 'capistrano/dockerized
```

## Options for deployment

You can specify the following options in you `deploy.rb` script or the environment specific deploy file:

* **dockerized_restart**: An array of services that should be restarted each deployment, if not specified dockerized will restart all services
* **dockerized_web_service**: The web service that will be used to execute commands inside like `rake` or any interactive command from `dockerized:run`, default value: :web
* **dockerized_rake_tasks**: A set of rake tasks to execute after each deploy, default value is `nil`

For a typical rails application the previous options should be as follows, given that the application container service name is `web`:

```ruby
set :dockerized_restart, [:web]
set :dockerized_web_service, :web
set :dockerized_rake_tasks, ['db:migrate', 'assets:precompile']
```

## Defined Tasks

```
dockerized:build                # build docker-compose services
dockerized:clean                # delete docker images that are not related to current build
dockerized:down                 # shutdown all project services with docker-compose
dockerized:rake_tasks           # execute a set of rake tasts inside the web container
dockerized:restart              # restart services of docker-compose and if not services listed restart all services
dockerized:run                  # run an interactive command inside the web container
dockerized:up                   # boot up all docker-compose services
```

## After the first deployment of a rails application

You would need to setup your database by invoking the `db:setup` task to create and seed your database:

* `cap production dockerized:run rake db:setup`

## General note

* This gem doesn't provide a `dockerfile` nor `docker-compose.yml` file, you have to create these files yourself
* The linked directories and files will not work and you should use docker data volumes anyway
