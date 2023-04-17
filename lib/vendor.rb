class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name       = name
    @inventory  = Hash.new(0)
  end

  def check_stock(item)
    if !@inventory.has_key?(item.name)
      0
    else
      @inventory[item.name]
    end
  end

  def stock(item, item_inventory)
    @inventory[item.name] += item_inventory
  end
end