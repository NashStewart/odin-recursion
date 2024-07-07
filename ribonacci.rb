# frozen_string_literal: true

def fibs(size)
  return nil unless size.positive?
  return [0] if size == 1

  nums = [0, 1]
  (size - 2).times do |_n|
    nums << nums[-1] + nums[-2]
  end
  nums
end

def fibs_rec(size, nums = [0, 1])
  return nil unless size.positive?
  return [0] if size == 1
  return nums unless nums.size < size

  nums << nums[-1] + nums[-2]
  fibs_rec(size, nums)
end

p fibs(-1) # nil
p fibs_rec(-1) # nil

p fibs 0 # nil
p fibs_rec 0 # nil

p fibs 1 # [0]
p fibs_rec 1 # [0]

p fibs 8 # [0, 1, 1, 2, 3, 5, 8, 13]
p fibs_rec 8 # [0, 1, 1, 2, 3, 5, 8, 13]
