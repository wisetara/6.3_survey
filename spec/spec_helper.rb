require "active_record"
require "rspec"
require "shoulda-matchers"
require "survey"
require "question"

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |splurg|
  splurg.after(:each) do
    Survey.all.each { |gorp| gorp.destroy }
  end
end
