require 'bundler/restrict/bundler_gems'

module Bundler
  module Restrict
    module Test
      class FakeBundler
        def list
          <<~LIST
Gems included by the bundle:
  * bundler-restrict (0.1.0)
  * diff-lcs (1.5.0)
  * gems (1.2.0)
  * rake (13.0.6)
  * rspec (3.11.0)
  * rspec-core (3.11.0)
  * rspec-expectations (3.11.0)
  * rspec-mocks (3.11.0)
  * rspec-support (3.11.0)
Use `bundle info` to print more detailed information about a gem
LIST

        end
      end
    end
    RSpec.describe BundlerGems do
      subject(:gems) { described_class.new Test::FakeBundler.new }


      it { expect(gems.first.name).to eq 'diff-lcs' }
      it { expect(gems.first.number).to eq '1.5.0' }
    end
  end
end
