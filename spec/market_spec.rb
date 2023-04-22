require "spec_helper"

RSpec.describe Market do
  describe "#initialize" do
    it "exists and has attributes" do
      market = Market.new("South Pearl Street Farmers Market")

      expect(market).to be_a(Market)
      expect(market.name).to eq("South Pearl Street Farmers Market")
      expect(market.vendors).to eq([])
    end
  end

  describe "#add_vendor" do
    it "adds Vendors to list" do
      market = Market.new("South Pearl Street Farmers Market")
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

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
    it "creates a list of vendor names" do
      market = Market.new("South Pearl Street Farmers Market")
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

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

  describe "#vendors_that_sell" do
    it "checks vendors to see who sells a given item" do
      market = Market.new("South Pearl Street Farmers Market")
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

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

      expect(market.vendors_that_sell(item1)).to eq([vendor1, vendor3])
      expect(market.vendors_that_sell(item4)).to eq([vendor2])
      expect(vendor1.potential_revenue).to eq(29.75)
      expect(vendor2.potential_revenue).to eq(345.00)
      expect(vendor3.potential_revenue).to eq(48.75)
    end
  end

  describe "#sorted_item_list" do
    it "returns a lits of all items vendors have in stock alphabetized without duplicates" do
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

      expected = ["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"]

      expect(market.sorted_item_list).to eq(expected)
    end
  end

  describe "#total_inventory" do
    it "checks all vendors for total inventory" do
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

  describe "#overstocked_items" do
    it "creates a list of overstocked items" do
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

      expect(market.overstocked_items).to eq([item1])
    end

    it "creates a list of all overstocked items" do
      market = Market.new("South Pearl Street Farmers Market")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7)
      vendor1.stock(item3, 100)

      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor2.stock(item4, 50)
      vendor2.stock(item3, 25)

      vendor3 = Vendor.new("Palisade Peach Shack")
      vendor3.stock(item1, 65)

      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)

      expect(market.overstocked_items).to eq([item1, item3])
    end
  end

  describe "#date" do
    it "creates the date the market was created" do
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

      allow(market).to receive(:date).and_return("2020-04-20")
      expect(market.date).to eq("2020-04-20")
    end
  end

  describe "#sell" do
    it "sells items in the market" do
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

      expect(market.sell(item1, 30)).to eq(true)
      expect(vendor1.check_stock(item1)).to eq(5)
      expect(vendor3.check_stock(item1)).to eq(65)
    end

    it "sells items in the market and reduces per vendor that sells item" do
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

      expect(market.sell(item1, 40)).to eq(true)
      expect(vendor1.check_stock(item1)).to eq(0)
      expect(vendor3.check_stock(item1)).to eq(60)
    end
  end
end