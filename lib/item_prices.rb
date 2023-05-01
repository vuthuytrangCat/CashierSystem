# frozen_string_literal: true
#coding: utf-8
require "yaml"

class ItemPrices
products_list =  
YAML.load_file(File.join(File.dirname(__FILE__), '../assets/products.yml'))
rules_list = 
YAML.load_file(File.join(File.dirname(__FILE__), '../assets/rules.yml'))
puts "FreeRule (buy #{rules_list['FreeRule']['number_of_items']} get #{rules_list['FreeRule']['number_of_items']} free, pay #{rules_list['FreeRule']['sale_price']})"

puts "ReducedPriceRule (buy more than #{rules_list['ReducedPriceRule']['number_of_items']} , pay a different price　£#{rules_list['ReducedPriceRule']['different_price']})"  

puts "FractionPriceRule (buy more than #{rules_list['FractionPriceRule']['number_of_items']}, pay #{rules_list['FractionPriceRule']['sale_percent'].to_s+ "%"} of the original price)"

CURRENT_PRICES = {
    'gr1' => {
      'unit_price' => products_list['Green Tea']['unit_price'],
      'selling_price' => {
        'number_of_items' => rules_list['FreeRule']['number_of_items'],
        'sale_price' => rules_list['FreeRule']['sale_price'],
        'different_price' => {},
        'sale_percent' =>{}
      }
    },
    'sr1' => {
      'unit_price' => products_list['Strawberries']['unit_price'],
      'selling_price' => {
        'number_of_items' => rules_list['ReducedPriceRule']['number_of_items'],
        'sale_price' => {},
        'different_price' => rules_list['ReducedPriceRule']['different_price'],
        'sale_percent' =>{}
      }
    },
    'cf1' => {
      'unit_price' => products_list['Coffee']['unit_price'],
      'selling_price' => {
        'number_of_items' => rules_list['FractionPriceRule']['number_of_items'],
        'sale_price' =>{},
        'different_price'=>{},
        'sale_percent' => rules_list['FractionPriceRule']['sale_percent']
        
      }
    }
    
  }.freeze
end