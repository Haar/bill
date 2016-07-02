class Bill
  END_POINT = 'http://safe-plains-5453.herokuapp.com/bill.json'

  def self.latest
    json = API.get(END_POINT)

    return if json.blank?

    Bill.new(json)
  end

  def initialize(source)
    @source = underscore_keys(source)
  end

  def method_missing(*args)
    @source.send(*args)
  end

  private

  def underscore_keys(value)
    case value
    when Array
      value.map(&method(:underscore_keys))
    when Hash
      Hash[value.map { |k, v| [underscore_key(k), underscore_keys(v)] }]
    else
      value
    end
  end

  def underscore_key(key)
    key.to_s.underscore.to_sym
  end
end
