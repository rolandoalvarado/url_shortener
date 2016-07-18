require 'rake'
require 'roodi'
require 'roodi_task'

namespace :quality_check do
  desc 'Runs all quality tests, then generates documentation'
  task generate_all: [ :roodi, :documentation ]

  desc 'Generates HTML version'
  task :documentation do
    system("redcarpet #{Rails.root}/README.md > #{Rails.root}/README.html") or raise 'unable to generate README.html'
  end

  RoodiTask.new do |t|
    t.verbose = true
    t.config = File.dirname(__FILE__) + '/roodi.yml'
    t.patterns = [ '**/*.rb' ]
  end
end
