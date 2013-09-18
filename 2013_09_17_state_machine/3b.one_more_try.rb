# One more try ?
class Order < ActiveRecord::Base

  validates :validate_state
  #...
  def validate_state
    # retreive dirty state and try not to put too much
    # case..when mess :<
  end

  #...
end