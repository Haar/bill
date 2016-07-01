class Bill
  END_POINT = 'http://safe-plains-5453.herokuapp.com/bill.json'

  def self.latest
    json = API.get(END_POINT)

    return nil if json.blank?
  end
end

