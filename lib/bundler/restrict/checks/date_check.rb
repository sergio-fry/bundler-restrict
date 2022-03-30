require 'date'

module Bundler
  module Restrict
    module Checks
      class DateCheck
        def initialize(gem_version)
          @gem_version = gem_version
        end

        def z_date
          Date.parse ENV.fetch('BUNDLE_RESTRICT_Z_DATE', '2022-02-01')
        end

        def valid?
          @gem_version.release_date < z_date
        end

        def error
          return if valid?

          "Please downgrade '#{@gem_version.name}' version '#{@gem_version.number}: release date '#{@gem_version.release_date}' >= #{z_date}"
        end
      end
    end
  end
end
