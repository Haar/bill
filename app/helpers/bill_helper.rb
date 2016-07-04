module BillHelper
  def bill_period(place=:from)
    date_string(bill[:statement][:period][place])
  end

  def currency(number)
    number_to_currency(number, unit: '£')
  end

  def date_string(string)
    Date.parse(string).strftime('%d %b')
  end

  def rental_charge_total
    bill[:sky_store][:rentals].sum { |rental| rental[:cost] }
  end
end
