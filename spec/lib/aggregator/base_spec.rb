require 'spec_helper'

describe Sweetness::Aggregator::Base do
  subject {described_class.new([1,2,3])}

  describe '#initialize' do
    it 'should set attributes' do
      expect(subject.items).to eq [1,2,3]
    end
  end

  it { expect{subject.groups}.to raise_error(NotImplementedError) }

  describe '#empty_group' do
    subject {described_class.new([]).empty_group}

    it 'should return empty group object' do
      is_expected.to be_an_instance_of(Sweetness::Group)
      expect(subject.key).to be_nil
      expect(subject.value).to eq(0)
      expect(subject.count).to eq(0)
    end
  end
end