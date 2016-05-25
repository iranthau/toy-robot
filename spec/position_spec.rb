require 'spec_helper'

describe Position do
  subject { Position.new }

  it 'has a initial position set to 0, 0' do
    expect(subject.x).to eq(0)
    expect(subject.y).to eq(0)
  end

  describe '#move_north' do
    it 'moves north by 1 step' do
      subject.move_north
      expect(subject.x).to eq(0)
      expect(subject.y).to eq(1)
    end
  end

  describe '#move_east' do
    it 'moves east by 1 step' do
      subject.move_east
      expect(subject.x).to eq(1)
      expect(subject.y).to eq(0)
    end
  end

  describe '#move_south' do
    let(:position) { Position.new(2, 3) }

    it 'moves south by 1 step' do
      position.move_south
      expect(position.x).to eq(2)
      expect(position.y).to eq(2)
    end
  end

  describe '#move_west' do
    let(:position) { Position.new(2, 3) }

    it 'moves west by 1 step' do
      position.move_west
      expect(position.x).to eq(1)
      expect(position.y).to eq(3)
    end
  end
end
