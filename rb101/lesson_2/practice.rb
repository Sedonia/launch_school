array1 = [1, 2, 3]
array2 = [4, 5, 6]
# => [1, 4, 2, 5, 3, 6] 

def merge(arr1, arr2)
  new_array = arr1.zip(arr2)
  new_array.flatten
end

p merge(array1, array2)