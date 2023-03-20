require_relative '../../lib/cart'

RSpec.describe Cart do
  let!(:working_input) do
    [
      "2 book at 12.49",
      "1 music CD at 14.99",
      "1 chocolate bar at 0.85"
    ]
  end

  describe "#initialize" do
    it "should create a new instance and create 3 items" do
      new_cart = described_class.new(working_input)

      expect(new_cart.items.size).to be 3
    end
  end

  describe "#total_price" do
    it "should have a right total price" do
      new_cart = described_class.new(working_input)

      expect(new_cart.total_price).to be 42.32
    end
  end

  describe "#receipt_details" do
    it "should have a right total price" do
      new_cart = described_class.new(working_input)

      expect(new_cart.receipt_details).to include("Sales Taxes: 1.5")
      expect(new_cart.receipt_details).to include("Total: 42.32")
    end
  end
end