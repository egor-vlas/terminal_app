require 'Imperial'

describe "Imperial" do
	let(:imperial) {Imperial.new}
	# it 'returns strings' do
	# 	imperial_msg = imperial.msg
	# 	expect(imperial_msg).to be_an_instance_of(String)
	# end

	# it 'returns the correct name' do
	# 	result = "41 F"
	# 	imperial_result = imperial.display_result(result)
	# 	expect(imperial_result).to be_an_instance_of(String)
	# end

	it 'returns correct value' do
		data = 160
		imperial_ml = imperial.ml_to_km(data)
		expect(imperial_ml).to eq("100.0 km")
	end
end