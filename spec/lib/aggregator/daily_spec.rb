require 'spec_helper'

describe Sweetness::Aggregator::Daily do
  before { parse_pollens <<-POLLENS }
1,Canola,10
2,Bluebell,3  
  POLLENS

  describe '#groups' do
    let(:aggregator) { described_class.new(parse_harvest(<<-HARVEST).items) }
7,2013-04-01,2,4
8,2013-04-01,2,5
7,2013-04-03,1,3  
    HARVEST
    subject { aggregator.groups }

    it 'should group items by days' do
      expect(subject.map(&:key)).to eq %w(2013-04-01 2013-04-03)
    end
    it 'should aggregate sugar in groups' do
      expect(subject.map(&:value)).to eq [27.0, 30.0]
    end
  end
end