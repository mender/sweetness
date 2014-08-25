require 'spec_helper'

describe Sweetness::PollenDictionary do
  subject {described_class}
  before { Sweetness::PollenDictionary.clear }

  it 'should contain empty items hash' do
    expect(subject.items).to eq({})
  end

  describe '#clear' do
    before { subject.add({}) }

    it 'should clear items' do
      expect(subject.items).to_not be_empty
      expect{subject.clear}.to change{subject.items}.to(be_empty)
    end
  end

  describe '#add' do
    it 'should add new pollen to items' do
      expect{subject.add({})}.to change{subject.items.values}.to contain_exactly(
        an_instance_of(Sweetness::Pollen)
      )
    end

    it 'should use pollen id as an item key' do
      subject.add({id: 1})
      expect(subject.items.keys).to eq [1]
    end

    it 'should convert item key to integer' do
      subject.add({id: '1'})
      subject.add({id: 'key'})
      expect(subject.items.keys).to eq [1, 0]
    end

    context 'when invalid data types' do
      before {subject.add(
        id: '1', 
        name: 'Pollen', 
        sugar_per_mg: '2'
      )}
      let(:item) {subject.items.values.first}

      it 'should convert id to integer' do
        expect(item.id).to eq(1)
      end
      it 'should convert sugar_per_mg to integer' do
        expect(item.sugar_per_mg).to eq(2)
      end
    end
  end

  describe '#find' do
    before do
      subject.add(id: 1)
      subject.add(id: 2)
    end
    
    it 'should return item by id' do
      expect(subject.find(1)).to be(subject.items[1])
    end
    it 'should return default item if not found' do
      default = Sweetness::Pollen.new(nil, nil, 0)
      allow(subject).to receive(:default).and_return(default)
      expect(subject.find(3)).to be(default)
    end
  end

  describe '#default' do
    subject { described_class.default }

    it 'should return empty pollen object' do
      is_expected.to be_an_instance_of(Sweetness::Pollen)
      expect(subject.id).to be_nil
      expect(subject.name).to be_nil
      expect(subject.sugar_per_mg).to eq(0)
    end
  end
end