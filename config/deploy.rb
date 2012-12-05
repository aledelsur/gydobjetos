set :application, "gyd"
set :repository,  "git@github.com:aledelsur/gydobjetos.git"
#set :use_sudo, true
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "li396-128.members.linode.com", :app, :web, :db, :primary => true

set :branch, "production"
set :user, "lucasminissale"
set :scm_username, "lucasminissale"

default_run_options[:pty] = true
set :rvm_ruby_string, 'ruby-1.9.3-p194@gyd'

namespace :bundle do

  desc "run bundle install and ensure all gem requirements are met"
  task :install do
    run "cd #{current_path} && bundle install  --without=test"
  end

end

namespace(:customs) do
  task :config, :roles => :app do
    run <<-CMD
      ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml
    CMD
  end
end

namespace :log do

  task :download, :roles => :app do
    get "#{shared_path}/log/#{rails_env}.log","tmp/benchmark/#{rails_env}.log"
  end

  desc "Size of log"
  task :size, :roles => :app do
    run "ls -lh #{shared_path}/log/#{rails_env}.log" do |channel, stream, data|
      puts "#{data}"
      break if stream == :err
    end
  end

  desc "A pinch of tail and keep open"
  task :tailf, :roles => :app do
    run "tail -n 500 -f #{shared_path}/log/#{rails_env}.log" do |channel, stream, data|
      puts "#{data}"
      break if stream == :err
    end
  end

  desc "A pinch of tail and close"
  task :tail, :roles => :app do
    run "tail -n 500 #{shared_path}/log/#{rails_env}.log" do |channel, stream, data|
      puts "#{data}"
      break if stream == :err
    end
  end


  desc "Grep actions and highlight long time actions > 300ms"
  task :grep_long, :roles => :app do
    run "grep '^Completed' #{shared_path}/log/#{rails_env}.log | tail -n 1000 | perl -pe 's/Completed in ([3-9][0-9]{2,}|1[0-9]{3,})+ms.+]/\e[1;33;44m$&\e[0m/g'" do |channel, stream, data|
      puts "#{data}"
      break if stream == :err
    end
  end

  # gem install request-log-analyzer
  desc "Request-log-analyzer"
  task :rla, :roles => :app do
    run "cd #{current_path} && bundle exec request-log-analyzer #{shared_path}/log/#{rails_env}.log --output html --file tmp/#{rails_env}.analyzed.html"
    get "#{current_path}/tmp/#{rails_env}.analyzed.html","tmp/benchmark/#{rails_env}.analyzed.html"
  end

  desc "Empty log file"
  task :clear, :roles => :app do
    run  "cat /dev/null > #{shared_path}/log/#{rails_env}.log"
  end
end
after "deploy:finalize_update", "bundle:install"
after "deploy:finalize_update", "customs:config"
after "deploy", "deploy:cleanup"
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