$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'capistrano/dockerized/version'

Gem::Specification.new do |s|
  s.name        = 'capistrano-dockerized'
  s.version     = Capistrano::Dockerized::VERSION
  s.authors     = ['GV']
  s.email       = ['']
  s.homepage    = 'https://github.com/wadik/capistrano-dockerized'
  s.summary     = 'Capistrano plugin to deploy your application inside docker containers using docker compose'
  s.description = 'Capistrano plugin to deploy your application inside docker containers using docker compose'
  s.license     = 'MIT'

  s.files = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.require_paths = ['lib']

  s.add_dependency 'capistrano', '~> 3.5'
end
