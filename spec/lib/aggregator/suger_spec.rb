require 'spec_helper'

describe Sweetness::Aggregator::Sugar do
  before { parse_pollens <<-POLLENS }
1,Canola,10
2,Bluebell,3  
  POLLENS

  describe '#groups' do
    let(:aggregator) { described_class.new(parse_harvest(<<-HARVEST).items) }
7,2013-04-01,2,4
8,2013-04-01,1,5
7,2013-04-03,1,3  
    HARVEST
    subject { aggregator.groups }

    it 'should group items by pollen_id' do
      expect(subject.map(&:key)).to eq [2, 1]
    end
    it 'should aggregate mg of sugar in groups' do
      expect(subject.map(&:value)).to eq [12.0, 80.0]
    end
  end
end