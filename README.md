# Sidekiq::Oj

[![Build Status](https://travis-ci.org/positionly/sidekiq-oj.svg?branch=master)](https://travis-ci.org/positionly/sidekiq-oj)
[![Dependency Status](https://gemnasium.com/positionly/sidekiq-oj.png)](https://gemnasium.com/positionly/sidekiq-oj)
[![Gem Version](https://badge.fury.io/rb/sidekiq-oj.png)](http://badge.fury.io/rb/sidekiq-oj)

Put [oj](https://github.com/ohler55/oj) in your [sidekiq](https://github.com/mperham/sidekiq) for some speed! If you're running Sidekiq at big scale this should save you some precious resources.

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

`sidekiq-oj` requires `sidekiq` for you and it overrides two methods in `Sidekiq` module.

## Silly benchmarks

```
$ ruby spec/benchmark.rb

Warming up --------------------------------------
         load - json     6.526k i/100ms
           load - oj    10.010k i/100ms
Calculating -------------------------------------
         load - json     72.797k (±20.4%) i/s -    345.878k
           load - oj    158.011k (±13.2%) i/s -    770.770k

Comparison:
           load - oj:   158010.9 i/s
         load - json:    72796.7 i/s - 2.17x slower

Warming up --------------------------------------
         dump - json     3.439k i/100ms
           dump - oj    12.881k i/100ms
Calculating -------------------------------------
         dump - json     38.250k (±29.6%) i/s -    158.194k
           dump - oj    157.075k (±25.9%) i/s -    695.574k

Comparison:
           dump - oj:   157074.8 i/s
         dump - json:    38249.9 i/s - 4.11x slower

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/positionly/sidekiq-oj.
