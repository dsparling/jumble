# jumble


## DESCRIPTION:

Create and solve Jumble word puzzles

This is a port of my Perl module Games::Jumble


## SYNOPSIS

```ruby
#!/usr/bin/env ruby
require 'rubygems'
require 'jumble'

# Find solutions for jumbled word
j = Jumble.new()
good_words = j.solve_word('rta')
puts good_words

# Jumble a word
j = Jumble.new()
jumbled_word = j.jumble_word('ruby')
puts jumbled_word

# Create a jumble
j = Jumble.new()
j.word_lengths_allowed(3,4,5)
jumble = j.create_jumble
puts jumble.inspect
```

## Version history and stuff

* **0.0.1**: initial release. (2008)
* **0.1.0**: added jumble_word().
* **0.2.0**: added create_jumble.
* **0.9.0**: updated to use gemspec/expect syntax/cleanup of some cruft.

## LICENSE:

(The MIT License)

Copyright (c) 2008-2013 Doug Sparling

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
