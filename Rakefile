ENV["SINATRA_ENV"] ||= "development"

require './config/environment'
require 'sinatra/activerecord/rake'

desc 'drop into the Pry console'
task :console do
  Pry.start
end

namespace :db do
  desc "Truncate all tables"
  task :truncate => :environment do
    conn = ActiveRecord::Base.connection
    tables = conn.execute("show tables").map { |r| r[0] }
    tables.delete "schema_migrations"
    tables.each { |t| conn.execute("TRUNCATE #{t}") }
  end
end
