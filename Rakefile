require 'rake'
require 'roodi'
require 'roodi_task'

desc 'Runs all specs and quality tests, then generates documentation'
task generate_all: [ :roodi, :documentation ]

desc 'Generates HTML version'
task :documentation do
  system('redcarpet README.md > README.html') or raise 'unable to generate README.html'
end

RoodiTask.new do |t|
  t.verbose = true
  t.config = File.dirname(__FILE__) + '/roodi.yml'
  t.patterns = [ '**/*.rb' ]
end
