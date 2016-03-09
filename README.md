# Sidekiq::Oj

Put [oj](https://github.com/ohler55/oj) in your [sidekiq](https://github.com/mperham/sidekiq) for some speed! If you're running Sidekiq at big scale this should save you some precious resources.

_Not yet production battle tested! No official release!_

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sidekiq-oj'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sidekiq-oj

## Usage

`sidekiq-oj` requires `sidekiq` for you, if you are using bundler remember to add it _after_ `sidekiq` as it overrides two methods in `Sidekiq` module.

## Silly benchmarks

```
$ ruby spec/benchmark.rb

Warming up --------------------------------------
         load - json    14.937k i/100ms
           load - oj    27.115k i/100ms
Calculating -------------------------------------
         load - json    164.117k (± 5.5%) i/s -    821.535k
           load - oj    321.167k (± 7.4%) i/s -      1.600M

Comparison:
           load - oj:   321166.6 i/s
         load - json:   164117.3 i/s - 1.96x slower

Warming up --------------------------------------
         dump - json     7.441k i/100ms
           dump - oj    22.182k i/100ms
Calculating -------------------------------------
         dump - json     79.879k (± 2.2%) i/s -    401.814k
           dump - oj    257.247k (± 0.5%) i/s -      1.287M

Comparison:
           dump - oj:   257247.1 i/s
         dump - json:    79878.8 i/s - 3.22x slower

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/positionly/sidekiq-oj.
