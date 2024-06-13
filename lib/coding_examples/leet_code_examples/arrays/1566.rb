# # 1566. Detect Pattern of Length M Repeated K or More Times
# Given an array of positive integers arr, find a pattern of length m that is repeated k or more times.

# A pattern is a subarray (consecutive sub-sequence) that consists of one or more values, repeated multiple times consecutively without overlapping. A pattern is defined by its length and the number of repetitions.

# Return true if there exists a pattern of length m that is repeated k or more times, otherwise return false.

 

# Example 1:

# Input: arr = [1,2,4,4,4,4], m = 1, k = 3
# Output: true
# Explanation: The pattern (4) of length 1 is repeated 4 consecutive times. Notice that pattern can be repeated k or more times but not less.
# Example 2:

# Input: arr = [1,2,1,2,1,1,1,3], m = 2, k = 2
# Output: true
# Explanation: The pattern (1,2) of length 2 is repeated 2 consecutive times. Another valid pattern (2,1) is also repeated 2 times.

require 'debug'
def contains_pattern(arr, m, k)
  count = 0
  (arr.length - m).times do |i|
    count = arr[i] == arr[i+m] ? count + 1 : 0
    # binding.break
    return true if count == ((k-1) * m)
  end
  return false
end
# arr = , m = 1, k = 3
puts contains_pattern([1,2,1,2,1,3], 2, 2)