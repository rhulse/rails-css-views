require 'rake'
require 'rake/testtask'

task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.test_files=Dir.glob( "test/**/*_test.rb" ).sort
  t.verbose = true
end
