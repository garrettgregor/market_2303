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
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      
      expect(vendor.check_stock(item1)).to eq(0)
    end
  end
  
  describe "stock" do
    it "add stock of item to inventory" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      
      expect(vendor.check_stock(item1)).to eq(0)
      
      vendor.stock(item1, 30)
      
      expected = {
        item1 => 30
      }
      
      expect(vendor.inventory).to eq(expected)
      expect(vendor.check_stock(item1)).to eq(30)
    end

    it "add stock of item to inventory" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      
      expect(vendor.check_stock(item1)).to eq(0)
      
      vendor.stock(item1, 30)
      
      expected = {
        item1 => 30
      }
      
      expect(vendor.inventory).to eq(expected)
      expect(vendor.check_stock(item1)).to eq(30)
    end
    
    it "add stock of item to inventory" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      
      expect(vendor.check_stock(item1)).to eq(0)

      vendor.stock(item1, 30)
      vendor.stock(item1, 25)
      
      expect(vendor.check_stock(item1)).to eq(55)
      
      expected1 = {
        item1 => 55
      }
      
      expect(vendor.inventory).to eq(expected1)
      
      vendor.stock(item2, 12)
      
      expected2 = {
        item1 => 55,
        item2 => 12
      }
      
      expect(vendor.inventory).to eq(expected2)
      expect(vendor.check_stock(item2)).to eq(12)
    end
  end
  
  describe "potential_revenue" do
    it "calculates the sum of all their items' price * quantity." do
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      vendor.stock(item1, 30)
      
      expected = {
        item1 => 30
      }
      
      expect(vendor.inventory).to eq(expected)
      expect(vendor.potential_revenue).to eq(22.5)
    end
    
    it "add stock of item to inventory" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      
      expect(vendor.check_stock(item1)).to eq(0)
      expect(vendor.potential_revenue).to eq(0)

      vendor.stock(item1, 30)
      vendor.stock(item1, 25)
      
      expect(vendor.check_stock(item1)).to eq(55)
      
      expected1 = {
        item1 => 55
      }
      
      expect(vendor.inventory).to eq(expected1)
      expect(vendor.potential_revenue).to eq(41.25)
      
      vendor.stock(item2, 12)
      
      expected2 = {
        item1 => 55,
        item2 => 12
      }
      
      expect(vendor.potential_revenue).to eq(47.25)
    end
  end
end