# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, 'public-server'
# set :repo_url, "git@example.com:me/my_repo.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :log_level, :debug

# on roles(:all) do |host|
#   execute 'whoami'
#   host.user = 'root'
#   sudo 'su'
# end

# set :application, 'donair_club'
set :repo_url, 'git@github.com:zoiec/donair_club.git'
set :branch, ask("Branch name? or enter for master", "master")
set :deploy_to, '/srv/www/donair_club'
set :pty, true
# set :linked_files, %w{config/database.yml config/application.yml}
set :linked_files, fetch(:linked_files, []).push('.env') << ".bundle"
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
# set :rvm_type, :user
# set :rvm_ruby_version, 'jruby-1.7.19' # Edit this if you are using MRI Ruby

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 1
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

# Global options
# --------------
set :ssh_options, {
  keys: %w(/Users/zoiec/.ssh/zoie-aws-resources.pem),
  forward_agent: true,
  auth_methods: %w(publickey)
}

set :ec2_contact_point, :public_ip
set :ec2_region, %w{us-west-2}

set :rbenv_ruby, '2.4.1'