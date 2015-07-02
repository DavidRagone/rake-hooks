# rake-hooks

Rake hooks let you add callbacks to rake:

[![Circle
CI](https://circleci.com/gh/DavidRagone/rake-hooks.svg?style=svg)](https://circleci.com/gh/DavidRagone/rake-hooks)
[![Code
Climate](https://codeclimate.com/github/DavidRagone/rake-hooks/badges/gpa.svg)](https://codeclimate.com/github/DavidRagone/rake-hooks)


## Usage

For example in your Rakefile

```ruby
require 'rake/hooks'

task :say_hello do
  puts "Good Morning !"
end

after :say_hello do
  puts "GoodBye"
end

after :say_hello do
  puts "Now go to bed !"
end

before :say_hello do
  puts "Hi !"
end
```

Now run with rake

```bash
$ rake say_hello
Hi !
Good Morning !
GoodBye
Now go to bed !
```

You can also pass more than one task and each task will be setup with the
callback

```ruby
before :say_hello, :say_goodbye do
  puts "Hi !"
end
```

If you need to save local state in your tasks, you can use `around`. **Note**
that the block you pass to `around` should expect a parameter, which is the
original rake task. In order for this task to run, you need to call `#invoke` on
it at whatever point you want it run.

```ruby
require 'rake/hooks'

task :slow_things do
  sleep rand 5
end

around :slow_things do |original|
  start = Time.now
  original.invoke
  finished = Time.now
  puts "Task took #{finished - start} seconds"
end
```

Now run with rake

```bash
$ rake slow_things
Task took 3.004006 seconds
```


## Installation

With rubygems use:
```bash
$ gem install rake-hooks
```

With other systems
  Add lib dir to load path.

## Dependencies

* Rake

## Author

* [Joel Moss](mailto:joel@developwithstyle.com)
* [Guillermo Álvarez](mailto:guillermo@cientifico.net)

## Web

http://github.com/guillermo/rake-hooks

