require 'bundler/restrict/bundler_gems'
require 'bundler/restrict/checks/date_check'

module Bundler
  module Restrict
    class CLI
      def self.start
        new.call
      end

      def call
        errors = []

        BundlerGems.new.each do |gem|
          [
            Checks::DateCheck
          ].map { |ch| ch.new(gem) }.each do |check|
            next if ignore?(gem)

            unless check.valid?
              print "\n"
              puts check.error

              errors << check.error 
            end
          end

          print '.'
        end

        if errors.empty?
          print "\n"
          puts "OK"
        else
          exit 1
        end
      end

      def ignore?(gem)
        ignored_gems.include? gem.name
      end

      def ignored_gems
        ['bundler-restrict'] + ENV.fetch('BUNDLE_RESTRICT_IGNORE_GEMS', '').split(',')
      end
    end
  end
end

