set :application, "gyd"
set :repository,  "git@github.com:aledelsur/gydobjetos.git"
#set :use_sudo, true
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "li396-128.members.linode.com", :app, :web, :db, :primary => true


set :user, "lucasminissale"
set :scm_username, "lucasminissale"

default_run_options[:pty] = true
set :rvm_ruby_string, 'ruby-1.9.3-p194@gyd'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end