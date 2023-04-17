require "spec_helper"

RSpec.describe Item do
  describe "#initialize" do
    it "initializes with attributes" do
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      #=> #<Item:0x007f9c56740d48...>
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      #=> #<Item:0x007f9c565c0ce8...>
      expect(item2.name).to eq("Tomato")
      #=> "Tomato"
      expect(item2.price).to eq(0.5)
      #=> 0.5
    end
  end
end