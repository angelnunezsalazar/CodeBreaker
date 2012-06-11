class CodeBreaker

	attr_reader :secret_code
	
	def initialize
		@secret_code = generate_random_code
	end
	
	def generate_random_code
		code = ""
		4.times { code += (1+rand(6)).to_s }
		return code
	end
	
	def set_secret_code(code, key)
		if code == key.reverse
			@secret_code = code
		end
	end
	
	def try_with(code)
		exact_matches = ""
		number_matches = ""
		
		for index in (0..3) do
			if (code[index]==@secret_code[index])
				exact_matches += "X"
			elsif (@secret_code.include?( code.split('')[index]))
				number_matches += "_"
			end
		end
		
		return exact_matches+number_matches
	end

end
