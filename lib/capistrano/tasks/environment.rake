namespace :environment do
  set :environment_file, '.env'
  set :temp_folder, './tmp/env_config'
  set :project_folder, './'
  set :environment_branch, ENV.fetch('ENV_BRANCH', 'master')

  # desc 'Fetch lastest rails_env repo to tmp locally'
  # task :fetch do
  #   run_locally do
  #     if /\Ay\z/i =~ fetch(:update_env)
  #       temp_path = File.expand_path(fetch(:temp_folder))
  #       info "cloning latest rails_envs into #{temp_path}, branch: #{fetch(:environment_branch)}"
  #       system "rm -rf #{temp_path} && git clone -b #{fetch(:environment_branch)} #{fetch(:environment_repository)} --depth 1 #{temp_path}"
  #     else
  #       info 'config .env not fetched'
  #     end
  #   end
  # end

  # desc 'delete the temp env repo locally'
  # task :remove do
  #   run_locally do
  #     temp_path = File.expand_path(fetch(:temp_folder))
  #     if Dir.exist?(temp_path)
  #       info "deleting #{temp_path}"
  #       system "rm -rf #{temp_path}"
  #     else
  #       info 'skipping local env cleanup'
  #     end
  #   end
  # end

  desc 'Upload current stage env file from local machine to the server'
  task :push do
    on roles(:app) do
      if /\Ay\z/i =~ fetch(:update_env)
        # temp_path = File.expand_path(fetch(:temp_folder))
        # require 'pry'
        # binding.pry
        file_path = File.join(fetch(:project_folder), ".env.#{fetch(:stage)}")
        if File.exist?(file_path)
          file = File.open(file_path)
          info "uploading #{file_path} to server"
          upload!(file, File.join(shared_path, fetch(:environment_file)))
        else
          error "unable to open file #{file_path}"
        end
      else
        info 'config .env not pushed'
      end
    end
  end
end