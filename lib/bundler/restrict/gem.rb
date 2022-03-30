require 'gems'
require 'bundler/restrict/gem_version'

module Bundler
  module Restrict
    class Gem
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def version(number)
        versions.find { |ver| ver.number == number }
      end

      def versions
        Gems.versions(@name).map { |info| GemVersion.new(self, info) }
      end
    end
  end
end
