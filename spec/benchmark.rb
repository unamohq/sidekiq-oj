require 'benchmark/ips'
require 'json'
require 'oj'

STRING ="{\"some\":\"data\",\"symbol\":10000,\"date\":\"2016-03-09\",\"time\":\"2016-03-09 20:52:45 +0100\",\"1\":1.2,\"complex\":[1,\"2\",3.3,\"2016-03-09 20:52:45 +0100\",\"hi\"]}".freeze

OBJECT = {
  'some' => 'data',
  symbol: 10_000,
  'date' => Date.today,
  'time' => Time.now,
  1 => 1.2,
  complex: [1, '2', 3.3, Time.now, :hi]
}.freeze

Benchmark.ips do |x|
  x.report("load - json") do
    JSON.parse(STRING)
  end

  x.report("load - oj") do
    Oj.load(STRING)
  end

  x.compare!
end

Benchmark.ips do |x|
  x.report("dump - json") do
    JSON.generate(OBJECT)
  end

  x.report("dump - oj") do
    Oj.dump(OBJECT)
  end

  x.compare!
end
