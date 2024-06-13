# # 1550. Three Consecutive Odds

# Given an integer array arr, return true if there are three consecutive odd numbers in the array. Otherwise, return false.
 

# Example 1:

# Input: arr = [2,6,4,1]
# Output: false
# Explanation: There are no three consecutive odds.
# Example 2:

# Input: arr = [1,2,34,3,4,5,7,23,12]
# Output: true
# Explanation: [5,7,23] are three consecutive odds.

require 'debug'
def three_consecutive_nums(arr)
  count = 0
  (arr.length - 1).times do |i|
    count = odd_num?(arr[i]) ? count + 1 : 0
    # binding.break
    return true if count == 3
  end
  return false
end

def odd_num?(n)
  (n%2) == 1
end

puts three_consecutive_nums([1,2,34,3,4,5,6,23,12])