require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql_backup"
load "config/recipes/postgresql"
load "config/recipes/rbenv"
load "config/recipes/check"
load "config/recipes/config_files"
load "config/recipes/assets"
#load "config/recipes/newrelic"
load "config/recipes/log"
load "config/recipes/apt"
load "config/recipes/db_utils"

server "176.58.122.177", :web, :app, :db, primary: true

set :application, "zantop"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:pauc/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# nginx stuff
set :server_names, '<%= nginx_server_names %>'
set :nginx_page_caching, true

set :newrelic_license_key, '369e370691bc6fc878b2eb7c331ebb0aefc64548'

# config files settings
set :config_files, ['amazon_s3.yml', 'smtp.yml']


after "deploy", "deploy:cleanup" # keep only the last 5 releases

