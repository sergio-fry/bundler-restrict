require 'date'

module Bundler
  module Restrict
    class GemVersion
      def initialize(gem, info)
        @gem = gem
        @info = info
      end

      def name
        @gem.name
      end

      def number
        @info['number']
      end

      def release_date
        Date.parse @info['built_at']
      end
    end
  end
end
