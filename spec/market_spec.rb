require "spec_helper"

RSpec.describe Market do
  describe "#initialize" do
    it "initializes with name" do
      market = Market.new("South Pearl Street Farmers Market")

      expect(market.name).to eq("South Pearl Street Farmers Market")
    end
  end
end