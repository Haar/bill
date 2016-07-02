module BillHelper
  def bill_period(place=:from)
    date_string(resource[:statement][:period][place])
  end

  def currency(number)
    number_to_currency(number, unit: '£')
  end

  def date_string(string)
    Date.parse(string).strftime('%d %b')
  end
end
