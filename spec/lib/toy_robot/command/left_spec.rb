RSpec.describe ToyRobot::Command::Left do
  subject(:left_command) { described_class.new(robot) }

  let(:robot) { nil }

  describe '.new' do
    context 'when the robot is missing' do
      it 'raises an error' do
        expect{ left_command }.to raise_error(ToyRobot::Command::CommandError, 'robot is required')
      end
    end

    context 'when the params are given' do
      let(:robot) { instance_double(ToyRobot::Robot) }

      it 'does NOT rais an error' do
        expect{ left_command }.not_to raise_error
      end
    end
  end

  describe '#run' do
    subject(:run) { left_command.run }

    let(:robot) { instance_double(ToyRobot::Robot, turn_left: true, report: true) }

    it 'turns left' do
      run

      expect(robot).to have_received(:turn_left)
      expect(robot).to have_received(:report)
    end
  end
end