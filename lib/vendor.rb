class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name       = name
    @inventory  = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    potential_revenue = 0
    if inventory == {}
      potential_revenue
    else
      potential_revenue = @inventory.sum do |item, amount|
        item.price * amount
      end
    end
    potential_revenue
  end
end