require 'spec_helper'

describe Board do
  subject { Board.new }

  describe '#position_valid?' do
    context 'when the position is invalid' do
      it 'returns false' do
        subject.robot.place(6, 6, 'N')
        expect(subject.position_valid?(subject.robot.position)).to be false
      end
    end

    context 'when the position is valid' do
      it 'returns true' do
        subject.robot.place(1, 3, 'N')
        expect(subject.position_valid?(subject.robot.position)).to be true
      end
    end
  end
end
