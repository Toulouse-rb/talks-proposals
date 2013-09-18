
order = new Order
order.state # :cart
order.process_payment mock(valid?: true) # NoMethodError

order.transform!

order.ship! # raises error

order.process_payment mock(valid?: true)
order.state # :paid

order.process_payment mock(valid?: true) # raises error (can be paid only once)

order.paid? # true
