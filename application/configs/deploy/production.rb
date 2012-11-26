role :app do
  ["219.94.250.38", "219.94.250.39"]
end

role :web do
  ["219.94.250.38", "219.94.250.39"]
end

role :db, "219.94.250.39", :primary => true

set :deploy_to, "/deploy/geek_app"

set :user, "geek"
set :password, "geekgeek"

