module Bundler
  module Restrict
    class Bundler
      def list
        `bundle list`
      end
    end
  end
end

