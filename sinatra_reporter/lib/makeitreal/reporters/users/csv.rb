require 'csv'

module Makeitreal
  module Reporters
    module Users
      class Csv
        def self.report users
          puts 'Creating a report'

          file = CSV.open 'users_report.csv', 'w+'
          file << ['email', 'fullname', 'role']
          users.each do |user|
            file << [ user.email, user.fullname, user.role ]
          end
          file.close
          puts 'Done Creating a report'
          file
        end

        def self.generate users
          puts 'Generating a report'

          content = CSV.generate do |csv|
            csv << ['email', 'fullname', 'role']
            users.each do |user|
              csv << [ user.email, user.fullname, user.role ]
            end
          end

          puts 'Done Generating a report'
          content
        end
      end
    end
  end
end
