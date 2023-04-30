# Annex A: Cashier System
Simple cashier function that adds products to a cart and displays the total price. 
  
Special Rules
● Buy one get one free
● Buy > N products, pay X price per product
● Buy > N products, pay X% of the original price  

    Name                    Unit price          Sale price
    -------------------------------------------------------
    Green Tea (GR1)         £3.11               2 for £3.11
    Strawberries(SR1)       £5.00               3 for £14.00
    Coffee(CF1)             £11.23              4 for £35.94

Currently there are only 3 types of configurable discount rules:
● FreeRule (buy 2 get 2 free)
● ReducedPriceRule (buy more than 3 pay a different price)
● FractionPriceRule (buy more than 5, pay 20% of the original price)
  
## How this works..

  
    £ ruby price_calculator.rb
    Please enter all the items purchased separated by a comma
    GR1,GR1, GR1,SR1,SR1,SR1,SR1,SR1,CF1,CF1,CF1,CF1,CF1,CF1
    
     
    
           Item     Quantity      Price
            --------------------------------------
            GR1      3            £6.22
            SR1      5            £24.00
            CF1      6            £58.40
        
        Total price : £88.62
        You saved £3.45 today.
