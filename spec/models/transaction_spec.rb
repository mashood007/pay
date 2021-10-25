# == Schema Information
#
# Table name: transactions
#
#  id            :bigint           not null, primary key
#  amount        :float
#  note          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  receive_by_id :integer
#  send_by_id    :integer
#
# Indexes
#
#  index_transactions_on_receive_by_id  (receive_by_id)
#  index_transactions_on_send_by_id     (send_by_id)
#
require 'rails_helper'

RSpec.describe Transaction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  subject { build(:transaction) }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:amount) }
    it { should belong_to(:send_by) }
    it { should belong_to(:receive_by) }
  end
end
