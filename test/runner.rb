require 'rubygems'
require 'heist'

runtime = Heist::Runtime.new(:except => ['library'])
runtime.top_level.define('not') { |x| !x }

begin
  runtime.run('test/support.scm')
  runtime.run('lib/app.scm')
  runtime.run('test/tests.scm')
  runtime.exec [:'run-tests!']
rescue Exception => e
  puts e
end

