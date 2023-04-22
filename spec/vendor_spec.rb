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
  end
end