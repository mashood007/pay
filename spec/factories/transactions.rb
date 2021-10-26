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
FactoryBot.define do
  factory :transaction do
    send_by { build(:account) }
    receive_by { build(:account) }
    amount { 10 }
    note { "MyText" }
  end
end
