# frozen_string_literal: true

def merge_leftover(array, half, array_index, half_index)
  while half_index < half.size
    array[array_index] = half[half_index]
    half_index += 1
    array_index += 1
  end
end

def merge(array, left, right)
  i = j = k = 0

  while i < left.size && j < right.size
    left_is_smallest = left[i] <= right[j]
    array[k] = left_is_smallest ? left[i] : right[j]
    left_is_smallest ? i += 1 : j += 1
    k += 1
  end

  merge_leftover(array, left, k, i)
  merge_leftover(array, right, k, j)
end

def merge_sort(array)
  return unless array.size > 1

  mid = array.size / 2
  left = array[..mid - 1]
  right = array[mid..]

  merge_sort(left)
  merge_sort(right)
  merge(array, left, right)
end

array = [3, 8, 4, 6, 2, 5, 7, 1]
puts 'Array One:'
puts "Before merge_sort(): #{array}" # [3, 8, 4, 6, 2, 5, 7, 1]
merge_sort(array)
puts "After merge_sort(): #{array}" # [1, 2, 3, 4, 5, 6, 7, 8]

puts "\nArray Two:"
array_two = [17, 87, 45, 12, 6, 25, 465, 45, 103]
puts "Before merge_sort(): #{array_two}" # [17, 87, 45, 12, 6, 25, 465, 45, 103]
merge_sort(array_two)
puts "After merge_sort(): #{array_two}" # [6, 12, 17, 25, 45, 45, 87, 103, 465]
