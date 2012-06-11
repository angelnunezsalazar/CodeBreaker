require "lib/game"

describe CodeBreaker do

	it "should generate a 4 characters secret code" do
		cb = CodeBreaker.new
		
		cb.secret_code.length.should == 4
	end
	
	it "should generate a random secret code" do
		cb1 = CodeBreaker.new 
		cb2 = CodeBreaker.new 
		cb3 = CodeBreaker.new 
		cb4 = CodeBreaker.new
		
		
		( cb1.secret_code!=cb2.secret_code && cb1.secret_code!=cb3.secret_code && cb1.secret_code!=cb4.secret_code && cb2.secret_code!=cb3.secret_code && cb2.secret_code!=cb4.secret_code && cb3.secret_code!=cb4.secret_code).should be true
		 
	end
	
	it "should let me overwrite the secret code for testing if i know the key" do
		cb = CodeBreaker.new
		
		cb.set_secret_code("ABCD","DCBA")
		
		cb.secret_code.should == "ABCD"
	end
	
	it "shouldn't let me overwrite the secret code for testing if i don't know the key" do
		cb = CodeBreaker.new
		
		cb.set_secret_code("ABCD","BGHY")
		
		cb.secret_code.should_not == "ABCD"
	end
	
	context "If the secret code is 1234" do
	
		before(:each) do
			@cb = CodeBreaker.new
			@cb.set_secret_code("1234", "4321")
		end
		
		it "it should return blank if I try with 5555" do
			@cb.try_with("5555").should == ""
		end
		
		it "it should return XXXX if I try with 1234" do
			@cb.try_with("1234").should == "XXXX"
		end
		
		it "it should return XXX if I try with 1235" do
			@cb.try_with("1235").should == "XXX"
		end
		
		it "it should return XX if I try with 1255" do
			@cb.try_with("1255").should == "XX"
		end
		
		it "it should return X if I try with 1555" do
			@cb.try_with("1555").should == "X"
		end
		
		it "it should return ____ if I try with 4321" do
			@cb.try_with("4321").should == "____"
		end
		
		it "it should return ___ if I try with 4325" do
			@cb.try_with("4325").should == "___"
		end
		
		it "it should return __ if I try with 4355" do
			@cb.try_with("4355").should == "__"
		end
		
		it "it should return _ if I try with 4555" do
			@cb.try_with("4555").should == "_"
		end
		
		it "it should return XX__ if I try with 1243" do
			@cb.try_with("1243").should == "XX__"
		end
		
		it "it should return XX_ if I try with 1245" do
			@cb.try_with("1245").should == "XX_"
		end
		
		it "it should return X_ if I try with 1545" do
			@cb.try_with("1545").should == "X_"
		end
		
		it "it should return X__ if I try with 1543" do
			@cb.try_with("1543").should == "X__"
		end
		
		it "it should return X___ if I try with 1423" do
			@cb.try_with("1423").should == "X___"
		end
		
	
	end

end
