java_import com.leapmotion.leap.Listener

module Leap
	class Listener < com.leapmotion.leap.Listener
		def initialize
				@init_events       = []
				@connect_events    = []
				@disconnect_events = []
				@exit_events       = []
				@frame_events      = []
		end

		def on(action=nil, &callback)
			case action
			when :init
				@init_events << callback
			when :connect 
				@connect_events << callback
			when :disconnect 
				@disconnect_events << callback
			when :exit 
				@exit_events << callback
			when :frame
				@frame_events << callback
			else
				raise "#{action} event not supported"
			end
		end

		def onInit(controller)
			@init_events.each { |e| e.call(controller) }
		end

		def onConnect(&controller)
			@connect_events.each { |e| e.call(controller) }
		end

		def onDisconnect(&controller)
			@disconnect_events.each { |e| e.call(controller) }
		end

		def onExit(controller)
			@exit_events.each { |e| e.call(controller) }
		end

		def onFrame(controller)
			@frame_events.each { |e| e.call(controller) }
		end
	end
end