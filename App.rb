require 'colorize'
require_relative "Imperial"
require_relative "Metric"


class App

	def initialize
		@imp = Imperial.new
		@metr = Metric.new
		@answer = ''
	end 

	def hello
		while @answer != 'q' do
			puts "=========================================================="
			puts "Please select measurment system you would like to convert."
			puts "Enter 1 for imperial metric system"
			puts "Enter 2 for metric system"
			puts "Enter q for exit "
			puts "=========================================================="
			print ">"
		
		@answer = gets.chomp.downcase
		
		if @answer == "1"
			@imp.msg
			@imp.converter
		
		elsif @answer == "2"
			@metr.msg
			@metr.converter

		elsif @answer == "q"
			puts "Thank you for using the converter!!"
			break
		else
			puts "Please check your data...".colorize(:red)
		end
	end
end

end


app1 = App.new
app1.hello


