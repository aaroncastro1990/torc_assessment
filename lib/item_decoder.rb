class ItemDecoder
  attr_reader :name, :price, :units

  # @param string [String] receives a string with the item details in a raw format
  # using this structure example "1 soda at 10.00"
  # @return [ItemDecoder] a new instance of the decoder
  def initialize(string)
    array = string.split(" ")

    @name = get_name(array)
    @price = get_price(array)
    @units = get_units(array)
  end
  
  # @param array [Array] an array of items unformmated
  # @return [Integer] the total units of the item
  def get_units(array)
    array.first.to_i
  end

  # @param array [Array] an array of items unformmated
  # "1 soda at 10" returns soda
  # @return [String] a string with the name of the item
  def get_name(array)
    array[1..-3].join(" ")
  end

  # @param array [Array] an array of items unformmated
  # @return [Float] the value `price` of the item
  def get_price(array)
    array.last.to_f
  end
end