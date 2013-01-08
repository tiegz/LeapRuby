raise "Install JRuby first: http://jruby.org/getting-started" if RUBY_PLATFORM != "java"

require 'LeapJava.jar'
require 'leap/listener'
require 'leap/controller'
require 'leap/vector'


module Leap
end
