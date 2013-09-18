class Order

  state_machine :state, initial: :cart do

    event :transform do
      transition :cart => :new
    end

    event :checkout do
      transition [:new, :payment_refused] => :paid
    end

    event :fail_payment do
      transition [:new, :payment_refused] => :payment_refused
    end

    event :ship do
      transition :paid => :sent
    end

    state :new, :payment_refused do
      def process_payment payment_data
        payment_data.valid? ? checkout! : fail_payment!
      end
    end

    after_transition on: :sent, do: :notify_shipping
  end

  def notify_shipping
    # notify customer
  end

end
