require 'bundler/restrict/bundler'
require 'bundler/restrict/gem'

module Bundler
  module Restrict
    class BundlerGems
      include Enumerable

      def initialize(bundler=Bundler.new)
        @bundler = bundler
      end

      def each
        @bundler.list.scan(/\*\s+([[:alnum:]-]+)\s+\(([\d\.]+)\)/).each do |match|
          yield Gem.new(match[0]).version(match[1])
        rescue Gems::NotFound
        end
      end
    end
  end
end

