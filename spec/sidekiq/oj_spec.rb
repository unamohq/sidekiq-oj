require 'spec_helper'

describe Sidekiq::Oj do
  describe 'load_json' do
    it 'uses Oj' do
      string = "{\"hi\":\"there\"}"
      expect(Oj).to receive(:strict_load).with(string)
      Sidekiq.load_json(string)
    end

    it 'is compatible with original JSON implementation' do
      string = "{\"some\":\"data\",\"symbol\":10000,\"date\":\"2016-03-09\",\"time\":\"2016-03-09 20:52:45 +0100\",\"1\":1.2,\"complex\":[1,\"2\",3.3,\"2016-03-09 20:52:45 +0100\",\"hi\"]}"

      expect(Sidekiq.load_json(string)).to eq JSON.parse(string)
      expect(Sidekiq.load_json(string)).to be_a(Hash)
    end

    it 'strictly loads string' do
      string = JSON.dump(":testme")
      expect(Sidekiq.load_json(string)).to eq(':testme')
    end
  end

  describe 'dump_json' do
    it 'uses Oj' do
      object = { hi: "there" }
      expect(Oj).to receive(:dump).with(object, kind_of(Hash))
      Sidekiq.dump_json(object)
    end

    it 'is compatible with original JSON implementation' do
      object = {
        'some' => 'data',
        symbol: 10_000,
        'date' => Date.today,
        'time' => Time.now,
        1 => 1.2,
        complex: [1, '2', 3.3, Time.now, :hi]
      }

      expect(Sidekiq.dump_json(object)).to eq JSON.generate(object)
    end
  end
end
