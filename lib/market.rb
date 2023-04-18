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
    vendors_that_sell_items = []
    @vendors.each do |vendor|
      # refactor this to a map later?
      if vendor.check_stock(item) >= 1
        vendors_that_sell_items << vendor
      end
    end
    vendors_that_sell_items
  end

  def sorted_item_list
    sorted_item_list = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, stock|
        sorted_item_list << item.name
      end
    end
    sorted_item_list.sort.uniq
  end

  def total_inventory
    total_inventory = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |item, stock|
        total_inventory[item] = {
          :quantity => stock,
          :vendors  => vendors_that_sell(item)
        }
      end
    end
    total_inventory
  end
end