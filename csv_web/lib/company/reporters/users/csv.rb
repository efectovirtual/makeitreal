require 'csv'
module Company
  module Reporters
    module Users
      class Csv
        def self.generate users
          puts "Generating users_report.csv"
          file = CSV.generate do |csv|
            csv << ['email', 'full_name', 'role']
            users.each do |user|
              csv << [ user.email, user.full_name, user.role ]
            end
          end
          puts "Done Generating users_report.csv"
          file
        end

        def self.create users
          puts "Creating users_report.csv"
          csv = CSV.open 'users_report.csv', 'w+'
          csv << ['email', 'full_name', 'role']
          users.each do |user|
            csv << [ user.email, user.full_name, user.role ]
          end
          csv.close
          puts "Done Creating users_report.csv"
          csv
        end
      end
    end
  end
end
