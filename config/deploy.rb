# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "clonote"
set :repo_url, "git@github.com:Brainya/clonote.git"
set :branch, 'master'
set :deploy_to, '/var/www/clonote'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :stage, :production
set :rails_env, 'production'
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/keypair.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

set :default_env, {
	AWS_REGION: ENV['AWS_REGION'],
	AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
  AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"],
	AWS_BUCKET_NAME: ENV['AWS_BUCKET_NAME']
}

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end