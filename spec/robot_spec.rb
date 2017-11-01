require 'spec_helper'

describe Robot do
  subject { Robot.new }

  describe '#place' do
    it 'places the robot at x, y locations facing given direction' do
      subject.place(0, 0, 'N')
      expect(subject.report).to eq('0, 0, N')
    end
  end

  describe '#move' do
    it 'moves the robot towards the current direction by 1' do
      subject.move
      expect(subject.report).to eq('0, 1, N')
    end
  end

  describe '#report' do
    it 'reports the current location and direction of the robot' do
      expect(subject.report).to eq('0, 0, N')
    end
  end

  describe '#left' do
    it 'changes current direction by 90 degrees anti clockwise' do
      subject.left
      expect(subject.report).to eq('0, 0, W')
    end
  end

  describe '#right' do
    it 'changes current direction by 90 degrees clockwise' do
      subject.right
      expect(subject.report).to eq('0, 0, E')
    end
  end

  it 'moves one step and reports' do
    subject.place(0, 0, 'N')
    subject.move
    expect(subject.report).to eq('0, 1, N')
  end

  it 'changes direction left by 90 degrees and reports' do
    subject.place(0, 0, 'N')
    subject.left
    expect(subject.report).to eq('0, 0, W')
  end

  it 'places the robot, moves 2 steps, turns left, moves 1 step and reports' do
    subject.place(1, 2, 'E')
    subject.move
    subject.move
    subject.left
    subject.move
    expect(subject.report).to eq('3, 3, N')
  end

  it 'turn left 5 times' do
    5.times { subject.left }
    expect(subject.report).to eq('0, 0, W')
  end
end
