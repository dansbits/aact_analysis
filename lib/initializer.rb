require 'sequel'
require 'yaml'
require 'mysql'
require_relative 'aact/schema_creator'
require_relative 'aact/text_file_processor'
require_relative 'aact/partial_date_transformer'
require_relative 'aact/full_date_transformer'

db_config = db_config = YAML.load_file("secrets.yml")['database']

# set up the database connection
sequel_config = {
  adapter: 'mysql',
  database: db_config['name'],
  user: db_config['user'],
  password: db_config['password'],
  host: db_config['host']
}

DB = Sequel.connect(sequel_config)
