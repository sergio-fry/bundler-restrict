require 'bundler/restrict/checks/date_check'

module Bundler
  module Restrict
    module Checks
      module Test
      end
      RSpec.describe DateCheck do
        subject(:check) { described_class.new gem_version  }
        let(:gem_version) { double(:gem_version, name: 'rails', release_date: release_date, number: '7.0.1') }

        context do
          let(:release_date) { Date.parse('2022-01-01') }
          it { expect(check).to be_valid }
        end

        context do
          let(:release_date) { Date.parse('2022-02-01') }
          it { expect(check).not_to be_valid }
          it { expect(check.error).to eq "Please downgrade 'rails' version '7.0.1: release date '2022-02-01' >= 2022-02-01" }
        end
      end
    end
  end
end
