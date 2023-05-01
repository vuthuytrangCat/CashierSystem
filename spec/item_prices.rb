# frozen_string_literal: true
#coding: utf-8
#require "yaml"
# :nodoc:
class ItemPrices

  CURRENT_PRICES = {
    'gr1' => {
      'unit_price' => 3.11,
      'selling_price' => {
        'number_of_items' => 2,
        'sale_price' => 0,
        #'different_price' => {},
        #'sale_percent' =>{}
      }
    },
    'sr1' => {
      'unit_price' => 5,
      'selling_price' => {
        'number_of_items' => 5,
        #'sale_price' => {},
        #'different_price'=>{},
        'sale_percent' => 20
      }
    },
    'cf1' => {
      'unit_price' => 11.23,
      'selling_price' => {
        'number_of_items' => 3,
        #'sale_price' =>{},
        'different_price' => 4.67,
        #'sale_percent' =>{}
      }
    }
    
  }.freeze
end