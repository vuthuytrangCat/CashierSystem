# frozen_string_literal: true

require_relative 'item'
require_relative 'final_price'
require_relative 'tabulable'
require_relative 'savings'
#require_relative '../spec/item'
#require_relative '../lib/final_price'
#require_relative '../lib/tabulable'
#require_relative '../lib/savings'
#require_relative 'assets/products'
# :nodoc:
class CashierSystem_spec
  attr_accessor :total_price

  def initialize
    @total_price = {}
  end

  def calculate
    puts 'Testing CashierSystem. Please enter all the items purchased separated by a comma'
    items = gets.chomp.downcase
    items = items.delete(' ').split(',')
    frequency_hash = frequency_of_items(items)
    total = net_total(frequency_hash)
    Tabulable.draw(total)
  rescue StandardError
    puts "\nSeems like there is no such item in the store!"
  end

  private

  def frequency_of_items(items)
    frequency_hash = Hash.new(0)
    items.each { |key| frequency_hash[key] += 1 }
    frequency_hash
      #puts frequency_hash
  end

  def net_total(frequency_hash)
    frequency_hash.each do |name, quantity|
      final_price = calculate_final_price(name, quantity)
      #puts final_price
      savings = Savings.amount(name, quantity, final_price)
      #puts savings
      calculate_total_price(name, quantity, final_price, savings)
      

    end
    total_price
  end

  def items_are_within_offer?(name, quantity)
    number_of_items = Item.count_offer_items(name)
    (quantity % number_of_items).zero?
  end

  def items_less_than_offer_count?(name, quantity)
    number_of_items = Item.count_offer_items(name)
    quantity < number_of_items
  end

  def calculate_total_price(name, quantity, final_price, savings)
    total_price[name] = {
      'quantity' => quantity,
      'price' => final_price,
      'savings' => savings
    }
  end

  def calculate_final_price(name, quantity)
    if Item.sale_price_present?(name)
      
      return FinalPrice.offer_only(name, quantity) if items_are_within_offer?(name, quantity)
      return FinalPrice.no_offer(name, quantity) if items_less_than_offer_count?(name, quantity)

      return FinalPrice.offer_added(name, quantity)
    end

    FinalPrice.no_offer(name, quantity)
  end
end

calculations = CashierSystem_spec.new
calculations.calculate
