# frozen_string_literal: true

require 'spec_helper'

describe CashierSystem do 
before(:each) do
  puts "debug rspec"
    @calc = CashierSystem.new
  end
  context "Green Tea: FreeRule (buy 2 get 2 free)" do
    context "When I add 5 and 5" do
      it "should return 10" do
        @calc.calculate
      end
    end
    context "Strawberries: ReducedPriceRule (buy more than 3 pay a different price)" do
    end
    context "Coffee:FractionPriceRule (buy more than 5, pay 20 percents of the original price)" do
    end
  end

  def calculate
    puts "debug calculate"
    #puts '--------------------------Cashier System---------------------------'
    #puts 'Please enter all the items purchased separated by a comma'
    items = ["GR1","GR1", "GR1"]
    #puts items
    frequency_hash = frequency_of_items(items)
    puts frequency_hash
    total = net_total(frequency_hash)
    Tabulable.draw(total)
  rescue StandardError
    puts "\n error"
  end
end

