require "sidekiq/oj/version"
require "oj"
require "sidekiq"

module Sidekiq
  def self.load_json(string)
    ::Oj.strict_load(string)
  end

  def self.dump_json(object)
    ::Oj.dump(object, mode: :compat)
  end
end
