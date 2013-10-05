# Recurator

[![Gem Version](https://badge.fury.io/rb/recurator.png)](http://badge.fury.io/rb/recurator)
[![Build Status](https://travis-ci.org/ksss/Recurator.png?branch=master)](https://travis-ci.org/ksss/Recurator)

Recurator is object for recursive processing like Enumeator.

Recurator is included `Enumeable` module.

## Synopsis

```ruby
obj = {
  "one" => {
    "two" => [1,2,3],
    "three" => "foo",
    "four" => {
      "five" => {}
    }
  }
}
recur = Recurator.new obj # or obj.to_recur

p recur.values.grep(Hash)
#=> [{"two" => [1,2,3],"three" => "foo","four" => {"five" => {}}}, {"five" => {}}, {}]

p recur.keys
#=> ["one", "two", "three", "four", "five"]
```

## Install

    gem install recurator
