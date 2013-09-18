
module OrderStateMachine
  extend ActiveSupport::Concern

  included do
    state_machine initial: 'cart' do
      #....
      after_transition on: :sent, do: :notify_shipping
      #....
    end

    def notify_shipping
      Notifier.shipping_notification(self).deliver!
    end

    async_method :notify_shipping, queue: :order, loner: true
  end
end