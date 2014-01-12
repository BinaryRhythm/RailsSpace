require 'active_record'
require 'active_record/fixtures'

namespace :db do
  DATA_DIRECTORY = "E:/Aptana Studio 3 Workspace/rails_test/lib/tasks/sample_data"
  namespace :sample_data do
    TABLES = %w(users specs faqs)
    MIN_USER_ID = 1000

    desc "Load sample data"
    task :load => :environment do |t|
      class_name = nil
      TABLES.each do |table_name|
        fixture = ActiveRecord::Fixtures.new(ActiveRecord::Base.connection,
               table_name,class_name,File.join(DATA_DIRECTORY,table_name.to_str))
        ## fixture.insert
        database = YAML::load_file("E:/Aptana Studio 3 Workspace/rails_test/lib/tasks/sample_data/#{table_name}.yml")
        #database.insert()
        puts "Loaded data from #{table_name}.yml"
      end
    end
    
    desc  "Remove sample data"
    task :delete => :environment do |t|
      User.delete_all("id >= #{MIN_USER_ID}")
      Spec.delete_all("user_id >= #{MIN_USER_ID}")
      Faq.delete_all("user_id >= #{MIN_USER_ID}")
    end
  end
end
