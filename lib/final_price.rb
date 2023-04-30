# frozen_string_literal: true

require_relative 'item'

# :nodoc:
class FinalPrice
  class << self

    def offer_only(name, quantity)
      number_of_items = Item.count_offer_items(name)
      sale_price = Item.find_sale_price(name)
      item_quantity = quantity / number_of_items
      item_quantity * sale_price
    end

    def no_offer(name, quantity)
      unit_price = Item.find_unit_price(name)
      unit_price * quantity
    end

    def offer_added(name, quantity)

      unit_price = Item.find_unit_price(name)
      
      if Item.different_price_present(name)
        sale_price = Item.find_different_price(name)
      end

      if Item.find_percent_price(name)
        sale_price = Item.find_percent_price(name)
      end

      if Item.sale_price_present(name)
      sale_price = Item.find_sale_price(name)
      end 
      
      number_of_items = Item.count_offer_items(name)
      puts number_of_items
      value_to_be_deducted = quantity % number_of_items
      puts value_to_be_deducted

      items_with_offer = (quantity - value_to_be_deducted) / number_of_items
      puts items_with_offer
      (items_with_offer * sale_price) + (value_to_be_deducted * unit_price)
    end
  end
end
