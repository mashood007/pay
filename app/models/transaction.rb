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
class Transaction < ApplicationRecord
  validates :amount, presence: true
  belongs_to :send_by, class_name: 'Account'
  belongs_to :receive_by, class_name: 'Account'
end
