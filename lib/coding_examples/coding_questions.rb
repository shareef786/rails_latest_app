
## Given a string s containing just the characters '(', ')', '{', '}', '[', and ']', determine if the input string is valid. An input string is valid if:
# 	Open brackets must be closed by the same type of brackets.
# 	Open brackets must be closed in the correct order.
# 	Example 1:
#  		Input: s = "()"
# 		Output: true
# 	Example 2:
# 		Input: s = "()[]{}"
# 		Output: true
# 	Example 3:
# 		Input: s = "(]"
# 		Output: false



def string_validator?(string)
  array = []
  matched_chars = {
    '(' => ')',
    '{' => '}',
    '[' => ']'
  }

  string.each_char do |c|
    if matched_chars.keys.include? c
      array << c
    else
      return false if array.empty? || array.pop != matched_chars.key(c)
    end
  end
  true

  # puts matched_chars.key(')')
end
# string = "(]"
# puts string_validator?(string)

## Given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
# Given A = [1, 2, 3], the function should return 4.
# Given A = [−1, −3], the function should return 1.

A = [1, 2, 3]
def return_missing_int(array)
  array.sort.each do |n|
    return 1 if n < 0
    return n+1 unless A.include? n+1
  end
end

puts return_missing_int(A)
puts (1..A.length+1).find{|n| A.include?(n).!}