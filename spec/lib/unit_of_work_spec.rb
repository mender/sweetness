require 'spec_helper'

describe Sweetness::UnitOfWork do
  before { Sweetness::PollenDictionary.add({id: 2}) }
  let(:work) {Sweetness::UnitOfWork.new(1, '2010-01-01', 2, 5)}

  describe '#initialize' do
    it 'sets bee_id attribute' do
      expect(work.bee_id).to eq(1)
    end
    it 'sets day attribute' do
      expect(work.day).to eq('2010-01-01')
    end
    it 'sets pollen_id attribute' do
      expect(work.pollen_id).to eq(2)
    end
    it 'sets mg attribute' do
      expect(work.mg).to eq(5)
    end
  end

  describe '#pollen' do
    it 'takes pollen from dictionary' do
      expect(work.pollen).to be(Sweetness::PollenDictionary.find(2))
    end
  end

  describe '#bee' do
    it 'should create new bee' do
      allow(Sweetness::Bee).to receive(:new)
      work.bee
      expect(Sweetness::Bee).to have_received(:new)
    end

    it 'should reuse created bee' do
      expect(work.bee).to be(work.bee)
    end
  end

  describe '#sugar_mg' do
    it 'should call pollen#sugar_from_mg' do
      allow(work.pollen).to receive(:sugar_from_mg).and_return(42.0)
      result = work.sugar_mg
      
      expect(work.pollen).to have_received(:sugar_from_mg).with(5)
      expect(result).to eq(42.0)
    end
  end
end