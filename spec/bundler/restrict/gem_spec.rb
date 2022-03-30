require 'bundler/restrict/gem'

module Bundler
  module Restrict
    RSpec.describe Gem do
      it { expect(Gem.new('rails').version('7.0.1').release_date).to eq Date.parse('2022-01-06') }
    end
  end
end
