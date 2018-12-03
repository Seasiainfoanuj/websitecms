# config valid only for current version of Capistrano
lock '3.3.5'

# set :rvm_ruby_version, '2.0.0-p247'
set :application, 'cms'
set :repo_url, 'git@github.com:bus4x4/cms.git'

set :deploy_to, '/var/www/bus4x4_cms'

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs) + %w{public/uploads public/media public/sitemaps}

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
