# One method for each event ?
class Order

  def transform!
    if state == :cart
      self.state= :new
      save!
    else
      raise InvalidStateError
    end
  end

  def process_payment! payment_data
    if state == :new || state == :payment_refused
      payment_data.valid? ? checkout! : fail!
    else
      raise InvalidStateError
    end
  end

  def checkout
    if state == :new || state == :payment_refused
      self.state = :new
      save!
    else
      raise InvalidStateError
    end
  end

  def fail
    if state == :new || state == :payment_refused
      self.state = :payment_refused
      save!
    else
      raise InvalidStateError
    end
  end
end