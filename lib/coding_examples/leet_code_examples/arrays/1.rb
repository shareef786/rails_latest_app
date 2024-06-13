# # Two Sum
# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# You can return the answer in any order.

 

# Example 1:

# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
# Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
# Example 2:

# Input: nums = [3,2,4], target = 6
# Output: [1,2]
# Example 3:

# Input: nums = [3,3], target = 6
# Output: [0,1]
 require 'debug'
def two_sum(nums, target)
  # prev_index = 0
  # (nums.size - 1).times do
  #   (1..nums.size - 1).each do |i|
  #     if nums[prev_index] + nums[i] == target
  #       return [prev_index, i]
  #     end
  #   end
  #   prev_index += 1
  # end
  # return 0
  prev_map = {}
  nums.each_with_index do |num, index|
    diff = target - num
    # binding.break
    return [prev_map[diff], index] if prev_map.keys.include? diff
    prev_map[num] = index
  end
  return 'No Indices'
end

nums = [3,4,1,2,1]
puts two_sum(nums, 6)