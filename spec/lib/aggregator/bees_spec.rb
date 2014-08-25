require 'spec_helper'

describe Sweetness::Aggregator::Bees do
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

    it 'should group items by bee_id' do
      expect(subject.map(&:key)).to eq [7, 8]
    end
    it 'should aggregate sugar in groups' do
      expect(subject.map(&:value)).to eq [42.0, 15.0]
    end
  end
  
  context 'when one bee harvested different types of pollen in one day' do
    let(:aggregator) { described_class.new(parse_harvest(<<-HARVEST).items) }
7,2013-04-01,2,4
7,2013-04-01,1,1
8,2013-04-01,2,5  
7,2013-04-02,2,5  
    HARVEST
    subject { aggregator.groups }

    it 'should not duplicate bee ids' do
      expect(subject.map(&:key)).to eq [7, 8]
    end
    it 'should aggregate average sugar for each bee per day' do
      expect(subject.map(&:avg)).to eq [18.5, 15.0]
    end
  end
end