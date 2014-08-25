require 'spec_helper'

describe Sweetness::Group do
  subject {described_class.new('key')}

  describe '#initialize' do
    it 'should set key attribute' do
      expect(subject.key).to eq 'key'
    end
    it 'should set default value' do
      expect(subject.value).to eq(0)
    end
    it 'should set counter to zero' do
      expect(subject.count).to eq(0)
    end
  end

  describe '#add' do
    it 'should change value' do
      expect{subject.add(2)}.to change{subject.value}.from(0).to(2)
    end
    it 'should increment counter' do
      expect{subject.add(2)}.to change{subject.count}.from(0).to(1)
    end
  end

  describe '#avg' do
    it 'should return zero for empty group' do
      expect(subject.avg).to eq(0)
    end
    it 'should return average value of added values' do
      subject.add(1)
      subject.add(2)
      expect(subject.avg).to eq(1.5)
    end
  end
end