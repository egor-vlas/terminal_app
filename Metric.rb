require 'colorize'


class Metric < Imperial
	def msg
		puts "=========================================================="
		puts "Please 	enter data you would like to convert following exact format:"
		arr_of = ["41 C for celsius",
							"41 cm for centimiters",
							"41 m for meters",
							"41 km for km",
							"41 gr for gramms"
							]
		arr_of.each {|i| puts i}
		puts "=========================================================="
	end


	def converter
		arr_of_scale = ["c", "cm", "m", "km", "gr"]
		
		print ">"
		
		str = gets.chomp
		raise ArgumentError, "Data can not be empty" if str.empty?
		data, scale = str.split(" ")		
		if arr_of_scale.include?(scale)
			case scale
				when 'c'
					celsius_to_farenheit(data)
				when "cm"
					cm_to_inch(data)
				when "m"
					m_to_foot(data)
				when "km"
					km_to_m(data)
				when "gr"
					gr_to_oz(data)
				else
					puts "Please check your input..."				
			end
		end
	end

	def celsius_to_farenheit(data)
		result = (data.to_i * 9/5) + 32
		save_data(result)
		display_result(result.to_s + " F")	
	end

	def cm_to_inch(data)
		result = data.to_i / 2.5
		save_data(result)
		display_result(result.to_s + " inch")
end

	def m_to_foot(data)
		result = data.to_i * 3.28
		save_data(result)
		display_result(result.round(2).to_s + " ft")
	
	end

	def  km_to_m(data)
		result = data.to_i * 1.6
		save_data(result)
		display_result(result.round(2).to_s + " ml")
	end

	def gr_to_oz(data)
		result = data.to_i * 0.035274
		save_data(result)
		display_result(result.round(2).to_s + ' oz')
	end




end