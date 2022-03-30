require 'bundler/restrict/bundler_gems'
require 'bundler/restrict/checks/date_check'

module Bundler
  module Restrict
    class CLI
      def self.start
        errors = []


        BundlerGems.new.each do |gem|
          print '.'
          [
            Checks::DateCheck
          ].map { |ch| ch.new(gem) }.each do |check|
            errors << check.error unless check.valid?
          end
        end
        print "\n"

        if errors.empty?
          puts "OK"
        else
          puts errors.join("\n")
          exit 1
        end
      end
    end
  end
end

