require 'spec_helper'

describe Sweetness::Pollen do
  subject {described_class.new(1, 'Pollen', 23.1)}

  describe '#initialize' do
    it 'should set attributes' do
      expect(subject.id).to eq 1
      expect(subject.name).to eq 'Pollen'
      expect(subject.sugar_per_mg).to eq 23.1
    end
  end

  describe '#sugar_from_mg' do
    let(:sugar) {double(weight_for: 42)}
    before {allow(subject).to receive(:sugar).and_return(sugar)}

    it 'should use sugar object' do
      subject.sugar_from_mg(2)
      expect(sugar).to have_received(:weight_for).with(2)
    end
    it 'should return milligrams of sugar' do
      expect(subject.sugar_from_mg(2)).to eq(42)
    end
  end
end