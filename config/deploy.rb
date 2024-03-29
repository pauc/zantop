# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "zantop"
set :repo_url, "git@github.com:pauc/zantop.git"

set :user, "deployer"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, "main"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/zantop"

# rbenv
set :rbenv_type, :user
set :rbenv_ruby, File.readlines(".tool-versions", chomp: true).find { |line| line.sub!(/\Aruby /, "") }
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

# nvm
set :nvm_type, :user
set :nvm_node, "v" + File.readlines(".tool-versions", chomp: true).find { |line| line.sub!(/\Anodejs /, "") }
set :nvm_map_bins, %w{node npm yarn sass}

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/credentials/production.key",
                      "config/credentials/production.yml.enc",
                      ".nvmrc"

# Default value for linked_dirs is []
append :linked_dirs, "log",
                     "tmp/pids",
                     "tmp/cache",
                     "tmp/sockets",
                     "public",
                     "uploads",
                     "node_modules"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
set :ssh_options, user: fetch(:user), verify_host_key: :always

# PUMA
set :puma_preload_app, true
set :puma_init_active_record, true

# NGINX
set :nginx_server_name, "mireiazantop.com"
set :nginx_use_ssl, false #true
