require "bundler/gem_tasks"
require 'rake/testtask'
Bundler::GemHelper.install_tasks

task :console do
  puts "Loading development console..."
  system("irb -r jackie")
end

task :help do
  puts "Available rake tasks: "
  puts "rake console - Run a IRB console with all enviroment loaded"
  puts "rake test - Run tests"
end

task :fake_s3 do
  system "fakes3 --port 10453 --root test_root &"
end

task :test do
  Dir.chdir('test')
end

Rake::TestTask.new(:test) do |t|
  t.libs << '../lib'
  t.libs << '../test'
  t.test_files = FileList['*_test.rb']
  t.verbose = false
end

task :default => :test
