require "spec_helper"

RSpec.describe Vendor do
  describe "#initialize" do
    it "initializes with name and inventory" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      #=> #<Vendor:0x00007f85683152f0...>
      expect(vendor.name).to eq("Rocky Mountain Fresh")
      #=> "Rocky Mountain Fresh"
      expect(vendor.inventory).to eq({})
      #=> {}
    end
  end
end