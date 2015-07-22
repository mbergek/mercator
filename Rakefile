require "bundler/gem_tasks"

# Test
require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = "test/*_test.rb"
  t.verbose = true
end

# Console
desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r mercator.rb"
end
