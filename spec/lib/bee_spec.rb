require 'spec_helper'

describe Sweetness::Bee do
  subject {described_class.new(1)}

  describe '#initialize' do
    it 'should set attributes' do
      expect(subject.id).to eq 1
    end
  end
end