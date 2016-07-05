require 'sequel'
require 'yaml'
require_relative 'aact/schema_creator'
require_relative 'aact/text_file_processor'
require_relative 'aact/date_transformer'

db_config = db_config = YAML.load_file("database.yml")

# set up the database connection
DB = Sequel.connect(db_config)