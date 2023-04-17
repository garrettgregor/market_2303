require "spec_helper"

RSpec.describe Market do
  describe "#initialize" do
    it "initializes with name and empty collection of vendors" do
      market = Market.new("South Pearl Street Farmers Market")

      expect(market.name).to eq("South Pearl Street Farmers Market")
      expect(market.vendors).to eq([])
    end
  end
end