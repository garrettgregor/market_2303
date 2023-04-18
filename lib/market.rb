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
    # total_inventory = Hash.new(0)
    # @vendors.each do |vendor|
    #   vendor.inventory.each do |item, stock|
    #     total_inventory[item] = Hash.new(0)
    #     {
    #       quantity: total_inventory
    #       vendors: vendors_that_sell(item)
    #     }
    #   end
    # end
    # total_inventory
    total = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        if total[item]
          total[item][:quantity] += quantity
        else
          total[item] = {
            quantity: quantity,
            vendors: vendors_that_sell(item)
          }
        end
      end
    end
    total
  end

  def overstocked_items
    # overstocked = []
    # total_inventory.select do |item, info|
    #   if info[:quantity] > 50 && vendors_that_sell(item).length > 1
    #     overstocked << item
    #   end
    # end
    # overstocked
    overstocked = total_inventory.select do |item, info|
      info[:quantity] > 50 && vendors_that_sell(item).length > 1
    end
    overstocked.keys
  end

  def date

  end

  def sell(item, quantity)
    # guard clause
    return false if total_inventory[item][:quantity] < quantity
    @vendors.each do |vendor|
      if vendor.check_stock(item) > quantity
        vendor.inventory[item] -= quantity
        # the break gets out of the enumeration or iteration currently in if the above is true
        # the desired quantity has been satisfied, which takes you out of the .each, without it
        break
      else
        quantity -= vendor.inventory[item]
        vendor.inventory[item] = 0
      end
    end
    return true
  end
end