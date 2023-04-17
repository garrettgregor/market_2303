class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name       = name
    @inventory  = Hash.new(0)
  end

  def check_stock(item)
    if @inventory == {}
      0
    else
      @inventory.each do |item, stock|
        if item == item
          @inventory.each do |item, stock|
            if stock >= 1
              return stock
            end
          end
        end
      end
    end
  end

  def stock(item, item_inventory)
    @inventory[item] += item_inventory
  end

  def potential_revenue
    # require 'pry'; binding.pry
  end
end