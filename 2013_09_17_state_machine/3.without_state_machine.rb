# Trying to control assignment
class Order

  #...
  def state=(new_state)
    case new_state:
      when 'new':
        raise StateError if state!='cart'
      end
      when 'paid':
        raise StateError if state != 'new' && state != 'payment_refused'
      end
      # more case...when mess

    end
    trigger_transition @state, new_state
    @state = new_state

  end

  def trigger_transition old_state, new_state
    # some more messy stuff
  end

  #...
end