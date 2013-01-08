$: << "lib"

require 'leap'
require 'rake'

desc "Test the connection to Leap"
task :default do
	listener = Leap::Listener.new
	listener.on(:connect)    { puts "Connected" }
	listener.on(:disconnect) { puts "Disonnected" }
	listener.on(:init)       { puts "Initialized" }
	listener.on(:exit) 			 { puts "Exit" }
	listener.on(:frame) 		 { |controller| 
		puts "Frame: %8d Timestamp: %10d Hands: %2d Fingers: %2d Tools: %2d" % \
		  [controller.frame.id, controller.frame.timestamp, controller.frame.hands.count, controller.frame.fingers.count, controller.frame.tools.count] 
	}

	controller = Leap::Controller.new
	controller.addListener listener

	begin
		puts "Press Enter to quit"
	  gets
	ensure
  	controller.removeListener listener 
	end
end