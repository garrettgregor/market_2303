require "spec_helper"

RSpec.describe Vendor do
  describe "#initialize" do
    it "exists and has attributes" do
      vendor = Vendor.new("Rocky Mountain Fresh")

      expect(vendor).to be_a Vendor
      expect(vendor.name).to eq("Rocky Mountain Fresh")
      expect(vendor.inventory).to eq({})
    end
  end

  describe "#check_stock" do
    it "can check the stock of an item" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})

      expect(vendor).to be_a Vendor
      expect(vendor.name).to eq("Rocky Mountain Fresh")
      expect(vendor.check_stock(item1)).to eq(0)
    end
  end

  describe "#stock" do
    it "can add stock of an item" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      vendor.stock(item1, 30)

      expected = {
        item1 => 30
      }

      expect(vendor.check_stock(item1)).to eq(30)
      expect(vendor.inventory).to eq(expected)
    end

    it "can add stock of multiple items" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      vendor.stock(item1, 30)
      vendor.stock(item1, 25)
      vendor.stock(item2, 12)

      expected = {
        item1 => 55,
        item2 => 12
      }

      expect(vendor.check_stock(item1)).to eq(55)
      expect(vendor.check_stock(item2)).to eq(12)
      expect(vendor.inventory).to eq(expected)
    end
  end

  describe "#potential_revenue" do
    it "can check potential revenue from inventory" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})

      expect(vendor.potential_revenue).to eq(0)

      vendor.stock(item1, 30)

      expect(vendor.potential_revenue).to eq(22.5)

      vendor.stock(item1, 25)

      expect(vendor.potential_revenue).to eq(41.25)

      vendor.stock(item2, 12)

      expect(vendor.potential_revenue).to eq(47.25)
    end
  end
end