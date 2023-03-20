require_relative 'taxes'

# BaseItem class will take care of all item properties, name and price of the items.
class Item
  include Taxes
  # adding accessor methods for name and price
  attr_reader :unit_price, :units, :name, :price

  # @param name [String] the name of the item
  # @param price [Float] the price of the item
  # @return [BaseItem] new instance
  def initialize(name, price, units)
    @unit_price = price.to_f
    @name = name
    @price = price.to_f * units # to_f to ensure that a 0.0 is if is not a valid number # @TODO; We might need an exception when no a valid number
    @units = units
  end

  # @return [Float] the total price including taxes of the item
  def total_price
    @total_price ||= (price + taxes)
  end

  # @return [Float] the amount of taxes applied
  def taxes
    @taxes ||= calculate_taxes
  end    
end