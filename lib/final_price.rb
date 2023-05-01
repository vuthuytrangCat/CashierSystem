# frozen_string_literal: true

require_relative 'item'
#require_relative '../spec/item'

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
      Item.sale_price_total(name,quantity)

      #Item.different_price_total(name,quantity)
      #Item.sale_percent_total(name,quantity)
    end

    def _sale_price_total(name, quantity)
      unit_price = Item.find_unit_price(name)
      sale_price = Item.find_sale_price(name)
      
      number_of_items = Item.count_offer_items(name)
      value_to_be_deducted = quantity % number_of_items

      items_with_offer = (quantity - value_to_be_deducted) / number_of_items
      (items_with_offer * sale_price) + (value_to_be_deducted * unit_price)
    end

      def sale_price_total(name, quantity)
      unit_price = Item.find_unit_price(name)
      sale_price = Item.find_sale_price(name)
      
      number_of_items = Item.count_offer_items(name)
      value_to_be_deducted = quantity % number_of_items

      value_to_be_deducted * unit_price
    end

    def different_price_total(name, quantity)
      unit_price = Item.find_unit_price(name)
      sale_price = Item.find_different_price(name)
      sale_price*unit_price*quantity
    end

    def sale_percent_total(name, quantity)
      unit_price = Item.find_unit_price(name)
      sale_price = Item.find_percent_price(name)*unit_price/100
      sale_price*unit_price*quantity
    end

  end
end
