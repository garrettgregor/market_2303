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
      expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end
  
  describe "#vendors_that_sell" do
    it "creates a list of vendors that sell given item" do
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
      expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
      expect(market.vendors_that_sell(item1)).to eq([vendor1, vendor3])
      expect(market.vendors_that_sell(item4)).to eq([vendor2])
    end
  end
  
  describe "#potential_revenue" do
    it "calculates potential revenue for all items stocked" do
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

      expect(vendor1.potential_revenue).to eq(29.75)
      expect(vendor2.potential_revenue).to eq(345)
      expect(vendor3.potential_revenue).to eq(48.75)
    end
  
    describe "#sorted_item_list" do
      it "creates a list of the names of all items the Vendors have in stock, sorted alphabetically" do
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

        expect(market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
      end
    end
    
    describe "#total_inventory" do
      it "creates a list of the names of all items the Vendors have in stock, sorted alphabetically" do
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

        expected = {
          item1 => {
            quantity: 100,
            vendors: [vendor1, vendor3]
          },
          item2 => {
            quantity: 7,
            vendors: [vendor1]
          },
          item3 => {
            quantity: 25,
            vendors: [vendor2]
          },
          item4 => {
            quantity: 50,
            vendors: [vendor2]
          }
        }

        expect(market.total_inventory).to eq(expected)
      end
    end
  end
    
  describe "#overstocked_items" do
    it "creates a list of the names of all items the Vendors have in stock, sorted alphabetically" do
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

      expected = [item1]

      expect(market.overstocked_items).to eq(expected)
    end
  end
  
  describe "#sell" do
    it "sells items if vendor has enough, otherwise, it doesn't" do
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

      expected = [item1]

      expect(market.sell(item1, 200)).to be false
      expect(vendor1.check_stock(item1)).to eq(35)
      expect(market.sell(item1, 40)).to be true
      expect(vendor1.check_stock(item1)).to eq(0)
      expect(vendor3.check_stock(item1)).to eq(60)
    end
  end
end