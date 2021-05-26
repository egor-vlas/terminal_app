require 'colorize'
require 'tty-link'
require 'tty-font'
require "tty-prompt"
require_relative "Imperial"
require_relative "Metric"
require_relative "Info"


class App

	def initialize
		@imp = Imperial.new
		@metr = Metric.new
		@info = Info.new
		@font = TTY::Font.new(:standard)
		@prompt = TTY::Prompt.new
		@answer = ''
	end 

	def hello
		# Wecome message
		while @answer != 'Exit' do
			puts "=========================================================="
			@answer =	@prompt.select("Choose your destiny?", %w(Imperial Metric Exit))
			# puts "Please select measurment system you would like to convert."
			# puts "Enter 1 for imperial measuring system"
			# puts "Enter 2 for metric measuring system"
			# puts "Enter 3 for retriving information from a file"		
			# puts "Enter q for exit "
			# puts ""
			puts TTY::Link.link_to("Link to my website", "https://vlasenkoiegor.com")
			puts "=========================================================="
			
		
		# @answer = gets.chomp.downcase
		
		raise StandardError, "You should provide data to convert" if @answer.empty?	

		if @answer == "Imperial"
			@imp.msg
			@imp.converter
		
		elsif @answer == "Metric"
			@metr.msg
			@metr.converter

		elsif @answer == "3"
			@info.explanation

		elsif @answer == "Exit"
			puts @font.write("Thank you ")
			puts @font.write("For Using ")
			puts @font.write("converter ")
			
			break
		else
			puts "Please check your data...".colorize(:red)
		end
	end
end

end


app1 = App.new
app1.hello


