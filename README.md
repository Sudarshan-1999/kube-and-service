# README


# Ruby version
# Ruby Version for sample ruby project
    ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-linux]


# System dependencies
# The following system requirement need to install and setup the node 
    gpg --keyserver hkp://pgp.mit.edu --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s stable
    rvm list known
    rvm install ruby-3
    sudo apt-get install libpq-dev
    sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo apt-get update
    sudo apt install postgresql


# Configuration
# Create an database user 
    sudo su - postgres
    psql
    create role myapp with createdb login password 'password1';
    grant all privileges on mydatabase to myuser;
    alter user myuser with superuser;

    gem install rails
    rails new admin_app --database=postgresql
# Database credentials add to the deployment.yml 
# vim config/deployment.yml
 
    development:
    adapter: postgresql
    encoding: unicode
    database: myapp_development
    pool: 5
    username: myapp
    password: password1

    test:
    adapter: postgresql
    encoding: unicode
    database: myapp_test
    pool: 5
    username: myapp
    password: password1


# Database creation
    rake db:create


# Database initialization
# insert the database credentials into the config/deployment.yml
# restart the postgres service to effect the db crendentials 
    service postgresql restart
    rake db:setup
    rake db:create
# Run the ruby sample app using the following command 
    rails runner
    rails generate controller welcome index
    rake db:migrate

# How to run the test suite
    rails server --binding=0.0.0.0 --environment=development
