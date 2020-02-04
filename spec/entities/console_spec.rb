RSpec.describe Console do
  let(:current_subject) { described_class.new }

  describe '#console' do
    context 'when correct method calling' do
      after do
        binding.pry  # @state=:greeting
        current_subject.console
        binding.pry  # @state=nil
      end

      it 'create account if input is create' do
        allow(current_subject).to receive_message_chain(:gets, :chomp) { %w(create exit) }

        expect(current_subject).to receive(:create)
      end
    end
  end
end
