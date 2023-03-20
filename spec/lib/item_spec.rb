require_relative '../../lib/item'

RSpec.describe Item do
  describe "#initialize" do
    it "should create a new instance and create its attributes" do
      new_item = described_class.new("soda", 10, 1)

      expect(new_item.name).to eq "soda"
      expect(new_item.price).to be 10.to_f
      expect(new_item.units).to be 1
    end
  end

  describe "#total_price" do
    it "should have a right total price" do
      new_item = described_class.new("soda", 10, 1)

      expect(new_item.total_price).to be 11.0
    end

    it "should have a right total price for multiple units" do
      new_item = described_class.new("soda", 10, 5)

      expect(new_item.total_price).to be 55.0
    end
  
    it "should have a right total price for food" do
      new_item = described_class.new("chocolate", 10, 5)

      expect(new_item.total_price).to be 50.0
    end
  
    it "should have a right total price for imported items and food" do
      new_item = described_class.new("imported chocolate", 10, 5)

      expect(new_item.total_price).to be 52.5
    end

    
    it "should have a right total price for imported items" do
      new_item = described_class.new("imported music cd", 10, 5)

      expect(new_item.total_price).to be 57.50
    end
  end

  describe "#taxes" do
    it "should have a right taxes" do
      new_item = described_class.new("soda", 10, 1)

      expect(new_item.taxes).to be 1.0
    end

    it "should have a right taxes for multiple units" do
      new_item = described_class.new("soda", 10, 5)

      expect(new_item.taxes).to be 5.0
    end
  end
end