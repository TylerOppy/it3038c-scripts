import numpy as np

# Usage 1: Creating an array
array1 = np.array([1, 2, 3, 4, 5])
print("Array 1:", array1)

# Usage 2: Performing mathematical operations
array2 = np.array([6, 7, 8, 9, 10])
result = array1 + array2  # Element-wise addition
print("Array 2:", array2)
print("Element-wise addition:", result)

# Usage 3: Array manipulation
array3 = np.array([[11, 12, 13], [14, 15, 16]])
print("Array 3:")
print(array3)

# Transpose the array
transposed_array = np.transpose(array3)
print("Transposed Array:")
print(transposed_array)
