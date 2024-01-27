# frozen_string_literal: true
require 'capistrano'

# configuration tasks
namespace :config do
  desc 'Create .env'
  task :env do
    on roles(:app) do
      # copy Jenkins/parameter file to .env if it exists
      if test "[ -e #{fetch(:param_file)} ]"
        execute "cp -rf #{fetch(:param_file)} #{release_path}/.env"
      else
        raise Capistrano::Error, 'You must specify a valid parameter file.'
      end
    end
  end

  desc 'Create database.yml'
  task :db do
    on roles(:app) do
      execute "cp #{release_path}/config/database.yml.example.production "\
        "#{release_path}/config/database.yml"
    end
  end

  desc 'Copy secrets.yml'
  task :secrets do
    on roles(:app) do
      execute "cp #{release_path}/config/secrets.yml.example "\
        "#{release_path}/config/secrets.yml"
    end
  end
end
