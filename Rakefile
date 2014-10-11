require "bundler/gem_tasks"
require "rspec/core/rake_task"

namespace :db do
  desc "Migrate /spec/dummy app's database"
  task :migrate do
    `cd spec/dummy && rake db:migrate` 
  end

  desc "Rollback /spec/dummy app's database"
  task :rollback do
    `cd spec/dummy && rake db:rollback` 
  end

  desc "Reset /spec/dummy app's development and test databases"
  task :reset do
    `cd spec/dummy && rake db:drop && rake db:create`
  end
end

RSpec::Core::RakeTask.new(:spec)
task :default => :spec
