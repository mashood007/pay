require 'swagger_helper'

RSpec.describe 'Payments API' do
  path '/api/v1/payments' do
    post 'create payment' do
      tags 'payments'
    consumes 'application/json'
    parameter name: :blog, in: :body, schema: {
      type: :object,
      properties: {
        user_id: { type: :integer },
        amount: { type: :integer },
        note: { type: :string },
        receive_by: {
        type: :object
        }
      },
      required: [ 'user_id', 'amount', 'receive_by' ]
    }

      response '201', 'payments created' do
        let(:payment) { build(:transaction) }
        run_test!
      end
    end
  end
end
