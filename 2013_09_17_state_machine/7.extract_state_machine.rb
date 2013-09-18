# ActiveRecord example

# app/models/order.rb

class Order < ActiveRecord::Base
    include OrderStateMachine
end


# app/state_machines/order_state_machine.rb

module OrderStateMachine
  extend ActiveSupport::Concern

  included do
    state_machine initial: 'cart' do
      # ....
    end
  end
end