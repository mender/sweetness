require 'spec_helper'

describe Sweetness::Harvest do
  subject {described_class.new}

  describe '#initialize' do
    it 'should set default items' do
      expect(subject.items).to eq []
    end
  end

  describe '#add' do
    it 'should add new unit of work to items' do
      expect{subject.add({})}.to change{subject.items}.to contain_exactly(
        an_instance_of(Sweetness::UnitOfWork)
      )
    end

    context 'when invalid data types' do
      before {subject.add(
        bee_id: '1', 
        day: '2014-01-01', 
        pollen_id: '2', 
        miligrams_harvested: '23.1'
      )}
      let(:item) {subject.items.first}

      it 'should convert bee_id to integer' do
        expect(item.bee_id).to eq(1)
      end
      it 'should convert pollen_id to integer' do
        expect(item.pollen_id).to eq(2)
      end
      it 'should convert miligrams_harvested to float' do
        expect(item.mg).to eq(23.1)
      end
    end
  end
end