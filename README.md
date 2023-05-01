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
    GR1,GR1, GR1
    
     
    
           Item     Quantity      Price
            --------------------------------------
            GR1      3            £6.22
        
        Total price : £6.22
        You saved £3.11 today.

    £ ruby price_calculator.rb
    Please enter all the items purchased separated by a comma
    SR1,SR1,SR1,SR1,SR1
    
     
    
           Item     Quantity      Price
            --------------------------------------
            SR1      5            £23.35
        Total price : £24.00
        You saved £1.65 today.

    £ ruby price_calculator.rb
    Please enter all the items purchased separated by a comma
    CF1,CF1,CF1,CF1,CF1,CF1
    
     
    
           Item     Quantity      Price
            --------------------------------------
            CF1      6            £13.48
        
        Total price : £13.48
        You saved £53. today.        
