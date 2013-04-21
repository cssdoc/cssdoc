require 'rake/testtask'

Rake::TestTask.new do |t|
    $LOAD_PATH << File.join(Dir.pwd, 'lib')
    t.libs << 'test'
end

desc "Run tests"
task :default => :test
