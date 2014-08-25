require 'spec_helper'

describe Sweetness::Sugar do
  let(:pollen) {double(sugar_per_mg: 2)}
  subject {described_class.new(pollen)}

  describe '#initialize' do
    it 'should set attributes' do
      expect(subject.pollen).to eq pollen
    end
  end

  describe '#weight_for' do
    it 'should return number of milligrams of sugar
        produced from given milligrams of pollen' do
      expect(subject.weight_for(10)).to eq(20)
    end  
  end
end