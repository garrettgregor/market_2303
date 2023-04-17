require "spec_helper"

RSpec.describe Vendor do
  describe "#initialize" do
    it "initializes with name and inventory" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      
      expect(vendor.name).to eq("Rocky Mountain Fresh")
      expect(vendor.inventory).to eq({})
    end
  end
  
  describe "#check_stock" do
    it "checks stock against inventory" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      #=> #<Vendor:0x00007f85683152f0...>
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      #=> #<Item:0x007f9c56740d48...>
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      #=> #<Item:0x007f9c565c0ce8...>
      expect(vendor.check_stock(item1))
      #=> 0

      # vendor.stock(item1, 30)

      # vendor.inventory
      # #=> {#<Item:0x007f9c56740d48...> => 30}

      # vendor.check_stock(item1)
      # #=> 30

      # vendor.stock(item1, 25)

      # vendor.check_stock(item1)
      # #=> 55

      # vendor.stock(item2, 12)

      # vendor.inventory
      # #=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}
    end
  end

  
end