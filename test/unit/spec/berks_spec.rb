require 'rspec'
require 'berkshelf/cli'
cookbooks = %w(
  curl
)
describe 'Berkshelf install' do
  let(:berks) { Berkshelf::Cli.start(['install']) }
  it 'gets at least the expected cookbooks' do
    cookbooks.each do |cookbook|
      expect { berks }.to output(/#{cookbook}/).to_stdout
    end
  end
end
