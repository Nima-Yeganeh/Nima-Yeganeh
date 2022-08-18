docker compose run --no-deps web rails new . --force --database=postgresql
sudo chown -R $USER:$USER .
docker compose build

# old db config
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>


# Replace the contents of config/database.yml with the following:
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: 5


docker compose up -d
docker compose run web rake db:create
docker compose down
docker compose up
