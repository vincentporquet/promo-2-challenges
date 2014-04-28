require 'sqlite3'
require 'active_record'
require 'pathname'
<<<<<<< HEAD
require 'YAML'
=======
require 'yaml'

>>>>>>> 785bc78a435b2cc1b3aad2711f947f34bef71e6a

# gets root of current directory
APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))

# loads the yml database config file
DB_CONFIG = YAML::load(IO.read(File.join(File.dirname(__FILE__),'database.yml')))

# gets the path of the database
DB_PATH =  APP_ROOT.join(DB_CONFIG["development"]["database"])

ActiveRecord::Base.configurations = DB_CONFIG
ActiveRecord::Base.establish_connection('development')



