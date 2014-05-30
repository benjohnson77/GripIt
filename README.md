# Text Searcher

### Approach:

I was given a java project that demonstrated searching a file for a word and returning the words around it. I translated the java code to a simple ruby example. 

The java code had a tokenizer class, if this was not a educational example I might have used something like solr to search multiple files and return words around them, but instead I used a regular experssion. I also didn't quickly find a gem that I know would behave enough like this sample tokenizer class so i didn't look. 

The java project contained existing test (love it when that happens). I worked through each test and made sure my regualar experssion match the exact responses. I used the ruby scan method to trigger the regex. I did not use any loops or chuck the file in anyway.  

I am no bueno at regualar expressions so it took some time to get the expression to match the expected results in the test.

### Usage

class TextSearcher

methods:  
new(file) --> takes any file
searcher("string", # of words before and after)

```
text = TextSearcher.new("files/short_excerpt.txt")
search = text.searcher("sketch", 0)
```

### Install and Run if you wish:

from your favorite project dir

check if you have ruby installed

```
ruby -v
```

I tested on ruby2.1.0, if you don't have ruby installed, rvm is recommended.

```
\curl -sSL https://get.rvm.io | bash -s stable --ruby
```
pull the project form GitHub

```
git clone git@github.com:benjohnson77/TextSearcher.git
cd TextSearcher
bundle install
```

if bundle install doesn't install its ok, just run.

```
gem install rspec
```

to see the tests run 

```
rspec spec
```

to use the program enter irb

```
irb
irb>text = TextSearcher.new("files/short_excerpt.txt")
irb>search = text.searcher("sketch", 0)
```




