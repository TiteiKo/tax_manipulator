require "bundler/gem_tasks"

%w(bundler find rake/testtask).each { |lib| require lib }

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.libs << "test"
  t.test_files = FileList['test/**/test_*.rb', 'test/**/*_spec.rb']
  t.verbose = true
end

task default: :test
