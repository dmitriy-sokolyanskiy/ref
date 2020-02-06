RSpec.describe Console do
  let(:current_subject) { described_class.new }
  let(:input_sequence) { %w[create exit] }

  describe '#console' do
    context 'when correct method calling' do

      it 'create account if input is create' do
        allow(current_subject).to receive_message_chain(:gets, :chomp).and_return(*input_sequence)
        current_subject.console
        expect(current_subject).to receive(:load)
      end
    end
  end
end
