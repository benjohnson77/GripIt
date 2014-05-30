

class TextSearcher 

	# Initializes the text searcher with the contents of a text file.
	# The current implementation just reads the contents into a string 
	# and passes them to #init().  You may modify this implementation if you need to.
	
	attr_accessor :file 		


	def initialize(file)
		@file = File.open(file) 
	end

	def searcher(word,context_count)
		context_count || context_count = 0
		rex = "A-Za-z0-9_'!$"
		@file.read.scan(/(?:[#{rex}.]+[^#{rex}]+){0,#{context_count}}#{word}(?:[^#{rex}]+[#{rex}.]+){0,#{context_count}}/)
	end 
	

	
# 	/**
# 	 *  Initializes any internal data structures that are needed for
# 	 *  this class to implement search efficiently.
# 	 */
# 	protected void init(String fileContents) {
# 		// TODO -- fill in implementation
# 	}
	
# 	/**
# 	 * 
# 	 * @param queryWord The word to search for in the file contents.
# 	 * @param contextWords The number of words of context to provide on
# 	 *                     each side of the query word.
# 	 * @return One context string for each time the query word appears in the file.
# 	 */
# 	public String[] search(String queryWord,int contextWords) {
# 		// TODO -- fill in implementation
# 		return new String[0];
# 	}
# }

end