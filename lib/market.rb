class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name     = name
    @vendors  = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.check_stock(item) > 0
    end
  end

  def sorted_item_list
    sorted_item_list = []
    total_inventory.each do |item, _|
      sorted_item_list << item.name
    end
    sorted_item_list.uniq.sort
  end

  def total_inventory
    total_inventory = {}

    @vendors.each do |vendor, name|
      vendor.inventory.each do |item, quantity|
        if !total_inventory[item]
          total_inventory[item] = {
            quantity: 0,
            vendors: vendors_that_sell(item)
          }
          total_inventory[item][:quantity] += quantity
        elsif total_inventory[item]
          total_inventory[item][:quantity] += quantity
        end
      end
    end

    total_inventory
  end

  def overstocked_items
    overstocked_items = []
    total_inventory.each do |item, hash|
      if hash[:quantity] > 50 && hash[:vendors].length > 1
        overstocked_items << item
      end
    end
    overstocked_items
  end

end