defmodule Shipping do
  @tax_rates [ NC: 0.075, TX: 0.08 ]

  def orders_with_total_amount(orders) do
    Enum.map(orders, &apply_tax/1)
  end

  def apply_tax(order = [_, {:ship_to, :NC}, _]) do 
    Keyword.put(order, :total_amount, @tax_rates[:NC] + order[:net_amount])
  end

  def apply_tax(order = [_, {:ship_to, :TX}, _]) do 
    Keyword.put(order, :total_amount, @tax_rates[:TX] + order[:net_amount])
  end

  def apply_tax(order) do 
    Keyword.put(order, :total_amount, order[:net_amount])
  end
# orders = [
#         [ id: 123, ship_to: :NC, net_amount: 100.00 ],
#         [ id: 124, ship_to: :OK, net_amount:  35.50 ],
#         [ id: 125, ship_to: :TX, net_amount:  24.00 ],
#         [ id: 126, ship_to: :TX, net_amount:  44.80 ],
#         [ id: 127, ship_to: :NC, net_amount:  25.00 ],
#         [ id: 128, ship_to: :MA, net_amount:  10.00 ],
#         [ id: 129, ship_to: :CA, net_amount: 102.00 ],
#         [ id: 130, ship_to: :NC, net_amount:  50.00 ] ]

  

end