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
            unless check.valid?
              print "\n"
              puts check.error

              errors << check.error 
            end
          end

          print '.'
        end

        if errors.empty?
          puts "OK"
        else
          exit 1
        end
      end
    end
  end
end

