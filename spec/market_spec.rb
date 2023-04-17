require "spec_helper"

RSpec.describe Market do
  describe "#initialize" do
    it "initializes with name and empty collection of vendors" do
      market = Market.new("South Pearl Street Farmers Market")

      expect(market.name).to eq("South Pearl Street Farmers Market")
      expect(market.vendors).to eq([])
    end
  end
  
  describe "#add_vendor" do
    it "add vendors to market" do
      market = Market.new("South Pearl Street Farmers Market")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor1.stock(item1, 35)    
      vendor1.stock(item2, 7)    
      
      vendor2 = Vendor.new("Ba-Nom-a-Nom")    
      vendor2.stock(item4, 50)    
      vendor2.stock(item3, 25)
      
      vendor3 = Vendor.new("Palisade Peach Shack")    
      vendor3.stock(item1, 65)  

      market.add_vendor(vendor1)    
      market.add_vendor(vendor2)    
      market.add_vendor(vendor3)
      
      expect(market.vendors).to eq([vendor1, vendor2, vendor3])
    end
  end
  
  describe "#vendor_names" do
    it "creates a list of vendor names from list of vendors" do
      market = Market.new("South Pearl Street Farmers Market")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      #=> #<Item:0x007f9c56740d48...>
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      #=> #<Item:0x007f9c565c0ce8...>
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      #=> #<Item:0x007f9c562a5f18...>
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      #=> #<Item:0x007f9c56343038...>
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      #=> #<Vendor:0x00007fe1348a1160...>
      vendor1.stock(item1, 35)    
      vendor1.stock(item2, 7)    

      vendor2 = Vendor.new("Ba-Nom-a-Nom")    
      #=> #<Vendor:0x00007fe1349bed40...>
      vendor2.stock(item4, 50)    
      vendor2.stock(item3, 25)

      vendor3 = Vendor.new("Palisade Peach Shack")    
      #=> #<Vendor:0x00007fe134910650...>
      vendor3.stock(item1, 65)  

      market.add_vendor(vendor1)    
      market.add_vendor(vendor2)    
      market.add_vendor(vendor3)
      
      expect(market.vendors).to eq([vendor1, vendor2, vendor3])
      #=> [#<Vendor:0x00007fe1348a1160...>, #<Vendor:0x00007fe1349bed40...>, #<Vendor:0x00007fe134910650...>]
      expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
      #=> ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
    end
  end
end