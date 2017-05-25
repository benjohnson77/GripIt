# GripIt

### Approach:

I need to search a whole mess of files for a word and return the words around it to determine the context.  

I didn't want to set up solr because I didn't want to persist this, I just needed a fast way to highlight the items that matched the search.

I used the ruby scan attribute and figured out some regular expression that searches the way a human would expect by ignoring punctuation but including it in the response.


### Usage

```
text = GripIt.new("files/short_excerpt.txt", "word")
search = text.searcher("sketch", 0)
```

Some Sample files are included to see the tests run.   

```
rspec spec
```

# TODO
There is a URL method roughed in that I want to finish aka right tests for.
I want to add some other similar common regex patterns and add them as additional types.
Maybe this is worth making a gem too, not sure.
