if RUBY_PLATFORM != "java"
	raise "Run this script with JRuby: http://jruby.org/getting-started"
end

require 'LeapJava.jar'

java_import java.lang.Math;
java_import com.leapmotion.leap.Listener
java_import com.leapmotion.leap.Controller
java_import com.leapmotion.leap.Vector


class SampleListener < Listener
	def onInit(controller)
		puts "Initialized"
	end

	def onConnect(controller)
		puts "Connected"
	end

	def onDisconnect(controller)
		puts "Disconnected"
	end

	def onExit(controller)
		puts "Exit"
	end

	def onFrame(controller)
		frame = controller.frame
		hands = frame.hands
		puts "Frame id: #{frame.id}, " +
				 "timestamp: #{frame.timestamp}, " +
				 "hands: #{hands.count}, " +
				 "fingers: #{frame.fingers.count}, " +
				 "tools: #{frame.tools.count}#"

		if hand = hands.first
      # Check if the hand has any fingers
      if fingers = hand.fingers
      	# Calculate the hand's average finger tip position
      	numFingers = fingers.count
      	pos = fingers.map(&:tipPosition).inject(Vector.zero, &:plus).divide(numFingers)
      	puts "Hand has #{numFingers} fingers with average tip position #{pos}"
      end

      # Get the palm position
      puts "Palm position: #{hand.palmPosition}"

			# Get hand normal vector  and direction
			normal = hand.palmNormal
			direction = hand.direction

      # Calculate the hand's pitch, roll, and yaw angles
			puts "Pitch: #{Math.toDegrees direction.pitch} degrees, " +
			     "Roll: #{Math.toDegrees normal.roll}, " +
			     "Yaw: #{ Math.toDegrees direction.yaw} degrees"

			# Get the radius of the hand sphere.
			puts "Hand curvature radius: #{hand.sphereRadius} mm"
		end
	end
end

listener = SampleListener.new
controller = Controller.new
controller.addListener listener

puts "Press Enter to quit"
gets

controller.removeListener listener