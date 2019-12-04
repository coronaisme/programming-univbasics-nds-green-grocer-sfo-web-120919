def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
   i = 0 
  while i < collection.length do
    if name === collection[i][:item]
      return collection[i]
    end
    i += 1
  end
  nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
  result = []
   i = 0 

  while i < cart.count do
    item_name = cart[i][:item]
    sought_item = find_item_by_name_in_collection(item_name, result)
    
    if sought_item
      sought_item[:count] += 1
    else
      cart[i][:count] = 1
      result.push(cart[i])
    end
    i += 1
  end
  result
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  i = 0 
  while i < coupons.length do
  
  cart_item = find_item_by_name_in_collection(coupons[i][:item], cart)
  coupon_item = "#{coupons[i][:item]} W/COUPON"
  cart_item_with_coupon = find_item_by_name_in_collection(coupon_item, cart)
  
  if cart_item && cart_item[:count] >= coupons[i][:num]
    if cart_item_with_coupon
      cart_item_with_coupon[:count] += coupons[i][:num]
      cart_item[i] -= coupons[i][:num]
    else
      cart_item_with_coupon = {
        :item => coupon_item,
        :price => coupons[i][:cost] / coupons[i][:num],
        :count => coupons[i][:num],
        :clearance => cart_item[:clearance]
      }
      cart << cart_item_with_coupon
      cart_item[:count] -= coupons[i][:num]
    end
  end
  i += 1 
end 
cart
   
   
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
