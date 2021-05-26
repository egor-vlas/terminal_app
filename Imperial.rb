require 'colorize'
require 'tty-box'
require "tty-prompt"

class Imperial

	# convert message
	def msg
		puts "=========================================================="
		puts "Please 	enter data you would like to convert following exact format:"
		arr_of = ["41 F for Farenheit",
							"41 in for Inches",
							"41 ft for Foots",
							"41 ml for Milles",
							"41 oz for ounces"
							]
		arr_of.each {|i| puts i}
		puts "=========================================================="				
	end


	def converter
	arr_of_scale = ["f", "in", "ml", "oz", "ft"]
	print ">"
	str = gets.chomp
	raise ArgumentError, "Data can not be empty" if str.empty?
	data, scale = str.split(" ") 	
	if arr_of_scale.include?(scale)
		case scale
			when 'f'
				farenheit_to_celsius(data)
			when "in"
				inch_to_cm(data)
			when "ml"
				ml_to_km(data)
			when "oz"
				oz_to_gr(data)
			when "ft"
				foot_to_cm(data)
			else
				puts "Please check your data ..."		
		end
	end
	end

	# convertors methods
	def farenheit_to_celsius(data)
		result = (data.to_i - 32) / 1.8
		save_data(result)	
		display_result(result.round(2).to_s + " C")
		
	end

	def inch_to_cm(data)
		result = data.to_i * 2.5
		save_data(result)
		display_result(result.to_s + " cm")
	end

	def foot_to_cm(data)
		result = data.to_i * 30.48
		save_data(result)
		display_result(result.to_s + " cm")
	end

	def  ml_to_km(data)
		result = data.to_i / 1.6
		save_data(result)
		display_result(result.to_s + " km")
	end

	def oz_to_gr(data)
		result = data.to_i / 0.035274
		save_data(result)
		display_result(result.round(2).to_s + ' gr')
	end

	def display_result(result)
		box = TTY::Box.success(result.colorize(:red))
		print box		
	end

	def save_data(result)
		puts 'Would you like to save your data in a file?'
		puts 'If you do enter Y otherwise enter N'
		print ">"
		answ = gets.chomp.downcase
		answ == "y" ? (saving(result)) : (puts "No")
	end

	def saving(result)
		File.open("Data.txt", 'w') { |file| file.write(result) }
		puts "Your data has been saved!!".colorize(:green)
	end	
end