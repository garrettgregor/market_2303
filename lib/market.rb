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

  def potential_revenue
    
  end
end