require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'
require_relative 'connection'
require_relative 'models/school'
require_relative 'models/user'

namespace :db do 
  desc "create nyc_izone_db database"
  task :create_db do
    conn = PG::Connection.open()
    conn.exec('CREATE DATABASE nyc_izone_db;')
    conn.close
  end

  desc "drop nyc_izone_db database"
  task :drop_db do
    conn = PG::Connection.open()
    conn.exec('DROP DATABASE nyc_izone_db;')
    conn.close
  end

#   desc "migrate the database with the schools table"
#   task :migrate do
#     conn = PG::Connection.open( database: 'nyc_izone_db')
#     sql_statement = <<-eos
#       CREATE TABLE schools (
#         dbn INTEGER,
#         school varchar(255),
#         initiative varchar(50),
#         cohort INTEGER,
#         principal varchar(100),
#         email varchar(60),
#         phone varchar(60),
#         address varchar(255),
#         coach varchar(60)
#         );
#     eos

#     conn.exec(sql_statement)
#     conn.close
#   end

  desc "seed database with the schools dataset"
  task :load_data do
    require 'csv'
    CSV.foreach('iZone_School_List.csv', :headers => true) do |row|
      dbn = row['DBN']
      school = row['School']
      initiative = row['Initiative']
      cohort = row['Cohort']
      principal = row['Principal']
      email = row['Email']
      phone = row['Phone']
      address = row['Address']
      coach = row['Coach']

      School.create({
        dbn: dbn,
        school: school,
        initiative: initiative,
        cohort: cohort,
        principal: principal,
        email: email,
        phone: phone,
        address: address,
        coach: coach
        }) 
    end
  end

  desc 'create junk data'
  task :junk_data do
    15.times do 
      user = User.new({username: Faker::Internet.user_name, proof: Faker::Company.catch_phrase})
      user.password = Faker::Internet.password
      user.save
    end
  end
end