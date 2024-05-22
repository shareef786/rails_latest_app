## Factorial
def factorial(n)
  return 1 if n == 1
  n * factorial(n-1)
end

# puts factorial(5)

## Fibonasci Series

def fibonasci(n)
  first_num, second_num = 0,1

  n.times do
    puts first_num

    first_num, second_num = second_num, first_num + second_num
  end
end

def nth_fibonasci(n)
  return n if n <= 1

  (nth_fibonasci(n-1) + nth_fibonasci(n-2))
end

# fibonasci(8)
# puts nth_fibonasci(8)

## Partition 0's and 1's in an array

arr = [0,1,0,1,1,0,1,0,0]
def partition(arr)
  loop do
  swapped = false

    (arr.length-1).times do |i|
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swapped = true
      end
    end
    break if not swapped
  end
  arr
end
puts partition(arr)
