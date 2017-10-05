def sum_to(n)
  return nil if n < 1
  return 1 if n == 1
  n + sum_to(n - 1)
end

def add_numbers(nums_array)
  return nums_array.first if nums_array.length <= 1
  nums_array.pop + add_numbers(nums_array)
end

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1
  (n - 1) * gamma_fnc(n - 1)
end

def ice_cream_shop(flavors, favorite)
  return flavors.first == favorite if flavors.length <= 1
  return true if flavors.pop == favorite
  ice_cream_shop(flavors, favorite)
end

def reverse(string)
  return string if string.length <= 1
  reverse(string[1..-1]) + string[0]
end
