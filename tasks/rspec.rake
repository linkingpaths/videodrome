require "rspec/core/rake_task"

desc "Run all tests"
RSpec::Core::RakeTask.new(:spec)