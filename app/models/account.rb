# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id           :bigint           not null, primary key
#  email        :string
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  status       :integer          default("pending"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_accounts_on_email         (email)
#  index_accounts_on_phone_number  (phone_number)
#  index_accounts_on_status        (status)
#
class Account < ApplicationRecord
  validates :first_name, :last_name, :email, :phone_number, presence: true

  enum status: {
    unverified: -1,
    pending: 0,
    verified: 1
  }, _suffix: true

  has_many :receipts, class_name: 'Transaction', foreign_key: :receive_by_id
  has_many :payments, class_name: 'Transaction', foreign_key: :send_by_id

  # the user can send money only if have sufficiant balance
  # and also should be a verified account
  def can_pay?(amount)
    verified_status? && balance >= amount
  end

  # it will return total balance for account
  def balance
    receipts.sum(:amount) - payments.sum(:amount)
  end
end
