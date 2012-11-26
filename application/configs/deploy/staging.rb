role :app do
  ["219.94.250.40"]
end

role :web do
  ["219.94.250.40"]
end

role :db, "219.94.250.40", :primary => true

set :deploy_to, "/deploy/geek_app"

set :user, "geek"
set :password, "geek"

