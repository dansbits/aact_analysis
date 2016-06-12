require 'sequel'
require_relative 'aact/schema_creator'
require_relative 'aact/text_file_processor'

# set up the database connection
DB = Sequel.connect(adapter: 'sqlite', database: 'aact.db')