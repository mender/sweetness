require 'spec_helper'

describe Sweetness::Aggregator do
  describe '#group_by' do
    subject do
      items = [
        {key: 1, value: 1}, 
        {key: 2, value: 15}, 
        {key: 1, value: 2}
      ]
      described_class.new(items).group_by do |item| 
        [item[:key], item[:value]]
      end
    end

    it 'should return an array of groups' do
      is_expected.to match a_collection_containing_exactly(
        an_instance_of(Sweetness::Group), an_instance_of(Sweetness::Group)
      )
    end

    it 'should use first variable returned from block as group key' do
      expect(subject.map(&:key)).to eq [1, 2]
    end

    it 'should use second variable returned from block as value' do
      expect(subject.map(&:value)).to eq [3, 15]
    end
  end
end