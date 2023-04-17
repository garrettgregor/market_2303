class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name       = name
    @inventory  = Hash.new(0)
  end

  def check_stock(item)
    if !@inventory.include?(item)
      0
    elsif @inventory.include?(item)
      @inventory[item]
    end
  end

  def stock(item, item_inventory)
    @inventory[item] += item_inventory
  end

  def potential_revenue
    sum = 0
    @inventory.each do |item, quantity|
      return_value = (item.price * quantity)
      sum += return_value
    end
    sum
  end
end