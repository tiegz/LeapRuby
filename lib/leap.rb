raise "Install JRuby first: http://jruby.org/getting-started" if RUBY_PLATFORM != "java"

require 'LeapJava.jar'

module Leap; end

require 'leap/listener'
require 'leap/multi_callback_listener'
require 'leap/controller'
require 'leap/vector'
require 'leap/finger_list'
require 'leap/float_array'
