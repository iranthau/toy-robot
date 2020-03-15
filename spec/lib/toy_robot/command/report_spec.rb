RSpec.describe ToyRobot::Command::Report do
  subject(:report_command) { described_class.new(robot) }

  let(:robot) { nil }

  describe '.new' do
    context 'when the robot is missing' do
      it 'raises an error' do
        expect{ report_command }.to raise_error(ToyRobot::Command::CommandError, 'robot is required')
      end
    end

    context 'when the params are given' do
      let(:robot) { instance_double(ToyRobot::Robot) }

      it 'does NOT rais an error' do
        expect{ report_command }.not_to raise_error
      end
    end
  end

  describe '#run' do
    subject(:run) { report_command.run }

    let(:robot) { instance_double(ToyRobot::Robot, report: true) }

    it 'reports the location' do
      run

      expect(robot).to have_received(:report)
    end
  end
end