require 'spec_helper'

describe Board do
  subject { Board.new }
  let(:robot) { Robot.new }

  describe '#add_robot' do
    it 'adds robots to board' do
      expect(subject.robots.length).to eq(0)
      robot.place(0, 0, 'N')
      subject.add_robot(robot)
      expect(subject.robots.length).to eq(1)
    end
  end

  describe '#position_valid?' do
    let(:robot) { Robot.new }
    it 'checks if a position is valid' do
      robot.place(6, 6, 'N')
      expect { subject.add_robot(robot) }.to raise_error('invalid position')
    end
  end
end
