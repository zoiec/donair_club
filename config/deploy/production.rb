set :rails_env, 'production'
ec2_role :app, user: 'ec2-user'
ec2_role :web, user: 'ec2-user'