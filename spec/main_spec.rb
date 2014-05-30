require 'spec_helper.rb'

describe TextSearcher do

	describe "simple examples with short file" do 

		before(:each) do
			@text_search=TextSearcher.new("files/short_excerpt.txt")
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
			@text_search=TextSearcher.new("files/long_excerpt.txt")
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


# 	/** Searcher can execute multiple searches after initialization. */
# 	@Test
# 	public void testMultipleSearches() throws Exception {
# 		File file = new File("files/short_excerpt.txt");
# 		TextSearcher searcher = new TextSearcher(file);
# 		String[] expected;
# 		String[] results;
		
# 		// Just runs the same queries as other tests, but on a single TextSearcher instance:
# 		expected = new String[] {
# 				"on the Origin of Species.  Until recently the great",
# 				"of naturalists believed that species were immutable productions, and",
# 				"hand, have believed that species undergo modification, and that" };
# 		results = searcher.search("species",4);
# 		assertArraysEqual(expected,results);
		
# 		expected = new String[] { "I will here give a brief sketch" };
# 		results = searcher.search("here",4);
# 		assertArraysEqual(expected,results);
		
# 		expected = new String[] { "and that the existing forms of life",
# 									"generation of pre existing forms." };
# 		results = searcher.search("existing",3);
# 		assertArraysEqual(expected,results);
# 	}
	
# 	/** Overlapping hits should just come back as separate hits. */
# 	@Test
# 	public void testOverlappingHits() throws Exception {
# 		String[] expected = {
# 				"of naturalists believed that species were immutable",
# 				"hand, have believed that species undergo modification",
# 				"undergo modification, and that the existing forms",

# 		};
# 		File file = new File("files/short_excerpt.txt");
# 		TextSearcher searcher = new TextSearcher(file);
# 		String[] results = searcher.search("that", 3);
# 		assertArraysEqual(expected, results);
# 	}

# 	/** If no hits, get back an empty array. */
# 	@Test
# 	public void testNoHits() throws Exception {
# 		File file = new File("files/long_excerpt.txt");
# 		TextSearcher searcher = new TextSearcher(file);
# 		String[] results = searcher.search("slejrlskejrlkajlsklejrlksjekl", 3);
# 		Assert.assertNotNull(results);
# 		Assert.assertEquals(0, results.length);
# 	}
	
# 	/** Verify the tokenizer. This should always pass. */
# 	@Test
# 	public void testTokenizer() throws Exception {
# 		String input = "123, 789: def";
# 		// In this test we define words to be strings of digits
# 		String[] expected = { "123",", ","789", ": def" };
# 		TextTokenizer lexer = new TextTokenizer(input,"[0-9]+");
# 		List<String> tokens = new ArrayList<String>();
# 		while (lexer.hasNext()) { 
# 			tokens.add(lexer.next());
# 		}
# 		String[] results = (String[])tokens.toArray(new String[tokens.size()]);
# 		assertArraysEqual(expected,results);
		
# 		Assert.assertTrue(lexer.isWord("1029384"));
# 		Assert.assertFalse(lexer.isWord("1029388 "));
# 		Assert.assertFalse(lexer.isWord("123,456"));
# 	}
# }


