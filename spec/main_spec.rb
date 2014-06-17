require 'spec_helper.rb'

describe GripIt do

	describe "simple examples with short file" do 

		before(:each) do
			@text_search=GripIt.new("files/short_excerpt.txt","word")
		end	

		it "should only return 1 hit" do 
			search = @text_search.searcher("sketch", 0)
			search.should include("sketch") 
		end

		it "should return 2 matches" do
			search = @text_search.searcher("naturalists", 0)
			search.should have(2).items  
		end	

		it "should return 3 words on either side of the matches" do
			search = @text_search.searcher("naturalists", 3)
			search.should =~ ["great majority of naturalists believed that species", "authors.  Some few naturalists, on the other"]
		end	

		it "should return 6 words on either side" do 
			search = @text_search.searcher("naturalists", 6)
			search.should =~ ["Until recently the great majority of naturalists believed that species were immutable productions","maintained by many authors.  Some few naturalists, on the other hand, have believed"]
		end	

		it "should handle overlaps" do
			search = @text_search.searcher("here", 4)
			search.should =~ ["I will here give a brief sketch"]
		end	

		it "should handle overlaps" do
			search = @text_search.searcher("existing", 3)
			search.should =~ ["and that the existing forms of life", "generation of pre existing forms."]
		end	
	end

	describe "more complex with larger file" do

		before(:each) do
			@text_search=GripIt.new("files/long_excerpt.txt","word")
		end	

		it "should return a sting with apostrophe" do
			search = @text_search.searcher("animal's", 4)
			search.should =~ ["not indeed to the animal's or plant's own good", "habitually speak of an animal's organisation as\r\nsomething plastic"]	 
		end	

		it "should return if a numeric query is made" do 
			search = @text_search.searcher("1844", 2)
			search.should =~ ["enlarged in 1844 into a", "sketch of 1844--honoured me" ]
		end	

		it "should return if a numeric query is made" do 
			search = @text_search.searcher("xxxxx10x", 3)
			search.should =~ ["date first edition [xxxxx10x.xxx] please check"]
		end

		it "should not care about case" do
			search1 = @text_search.searcher("SpEcIeS", 4)
			search2 = @text_search.searcher("Species", 4)
			search1.should =~ search2 		
		end	



	end


end		



