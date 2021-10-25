module Api
  module V1
    class PaymentsController < ApplicationController
      before_action :current_user, :find_reciever, only: [:create]

      def create
        if @current_user.can_pay?(params[:amount].to_f) && @receiver.verified_status?
          @payment = @current_user.payments.new(transaction_params)
          if @payment.save
            render json: @payment, status: :created
          else
            render json: { errors: @payment.errors.full_messages },
                   status: :unprocessable_entity
          end
        else
          render json: { error: 'not verifeid user/ no balance' }, status: 403
        end
      end

      private

      def current_user
        puts params,'-------'
        @current_user = Account.find(params[:user_id])
      end

      def find_reciever
        @receiver = Account.find_by(receive_by_params)
      end

      def transaction_params
        params.permit(:amount, :note).merge(receive_by: @receiver)
      end

      def receive_by_params
        params.permit(:receive_by)
      end
    end
  end
end
