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
end