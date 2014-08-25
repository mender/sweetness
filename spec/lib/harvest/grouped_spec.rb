require 'spec_helper'

describe Sweetness::Harvest::Grouped do
  let(:groups) {[
    double(:value => 1, :avg => 0.5),
    double(:value => 2, :avg => 0.3),
    double(:value => 3, :avg => 0.2)
  ]}
  subject { described_class.new(nil, nil) }
  before { allow(subject).to receive(:groups).and_return(groups) }

  it 'should return group with max value' do
    expect(subject.max.value).to eq(3)
  end
  it 'should return group with min value' do
    expect(subject.min.value).to eq(1)
  end
  it 'should return group with max average value' do
    expect(subject.max_avg.avg).to eq(0.5)
  end
  it 'should return group with min average value' do
    expect(subject.min_avg.avg).to eq(0.2)
  end

  context 'when data set is empty' do
    before { allow(subject).to receive(:groups).and_return([]) }
    before { allow(subject).to receive(:empty_group).and_return(
      double(:value => 0, :avg => 0.0)
    ) }

    it 'should return empty group when max is requested' do
      expect(subject.max.value).to eq(0)
    end
    it 'should return empty group when min is requested' do
      expect(subject.min.value).to eq(0)
    end
    it 'should return empty group when max_avg is requested' do
      expect(subject.max_avg.avg).to eq(0.0)
    end
    it 'should return empty group when min_avg is requested' do
      expect(subject.min_avg.avg).to eq(0.0)
    end
  end
end