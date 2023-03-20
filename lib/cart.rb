require_relative 'item'
require_relative 'item_decoder'

# Cart class represents a cart of items, it has different properties like the total price of all items.
class Cart
  attr_reader :items, :response_format
  # @params items [Array] a list of the items.
  # @return [Cart] a new instance of the class Cart
  def initialize(list_items)
    @items = create_items(list_items)
  end

  # creates an array of Items
  # @params list_items [Array] an array of strings with the item units, name and price without format
  # @return [Array] an array of [Item] elements
  def create_items(list_items)
    list_items.map do |item|
      decoded_item = ItemDecoder.new(item)

      Item.new(decoded_item.name, decoded_item.price, decoded_item.units)
    end
  end

  # @return [Float] the total price of all items
  def total_price
    items.map(&:total_price).reduce(:+)
  end

  # @return [String] the printable result of the receipt
  def receipt_details
    result = if response_format.eql?("default")
      <<~EOS
        #{list_of_items}
        Sales Taxes: #{total_taxes}
        Total: #{total_price}
      EOS
    else
      # @TODO; handle other formats
    end

    result
  end

  private
  
  # @return [Array] returns an array of items in a receipt format
  def list_of_items
    @list_of_items ||= items.map do |item|
      "#{item.units} #{item.name}: #{item.total_price}"
    end.join("\n")
  end

  # @return [Float] the total amount of taxes of the receipt
  def total_taxes
    items.map(&:taxes).reduce(:+)
  end

  # @return [String] the response format of the receipt
  def response_format
    @response_format || "default"
  end
end