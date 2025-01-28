import numpy as np

# Example 1 array() function. Use type to return data type. Use ndim to get number of array dimensions
ex1 = np.array([2, 4, 6, 8, 10])
print("Array function creates an array: ", ex1)
print("This is the type of array: ", type(ex1))
print("Ndim returns the number of dimensions: ", ex1.ndim)

# Example 2 sort() function sorts an array in ascending order sort can also sort strings alphabetically
print()
sortEx = np.array([4, 3, 5, 2, 10])
print(sortEx)
print("Sort function will sort the array in ascending order: ", np.sort(sortEx))

sortEx = np.array(['cat', 'dog', 'mouse', 'bird'])
print(sortEx)
print("Sort can also be used to sort strings alphabetically: ", np.sort(sortEx))

# Example 3 append() function adds an element or array to the end of an array
print()
a = np.array([1, 2, 3, 4, 5])
appEx = np.append(a, [6, 7, 8, 9, 10]) # append array to array
print("Append function will append an array to the end of another array: ", appEx)

appEl = np.append(appEx, 11) # append element to array
print("Also possible append a single element to on array: ", appEl)

# Example 4 concatenate() function joins two or more arrays
print()
concatEx = np.array([1, 2, 3, 4, 5])
print(concatEx)
concatEx2 = np.array([6, 7, 8, 9, 10])
print(concatEx2)
concatEx3 = np.concatenate((concatEx, concatEx2))
print("Concantenate function can join 2 or more arrays: ", concatEx3)

# Example 5 sum() function adds all elements in an array
print()
sumEx = np.array([1, 2, 3, 4, 5])
print(sumEx)
print("Sum function will add all elements in an array: ", np.sum(sumEx))

# Example 6 min() function returns the smallest element in an array
print()
minEx = np.array([1, 2, 3, 4, 5])
print(minEx)
print("Min function returns the smallest element in an array: ", np.min(minEx))

# Example 7 max() function returns the largest element in an array
print()
maxEx = np.array([1, 2, 3, 4, 5])
print(maxEx)
print("Max function will return the largest element in an array: ", np.max(maxEx))

# Example 8 mean() function returns the average of all elements in an array
print()
meanEx = np.array([1, 2, 3, 4, 5])
print(meanEx)
print("Mean function will return the average value of elements in an array: ", np.mean(meanEx))

# Example 9 median() function returns the median of all elements in an array
print()
medEx = np.array([1, 2, 3, 4, 5])
print(medEx)
print("Median function will return the median value of elements in an array: ", np.median(medEx))

# Example 10 std() function returns the standard deviation of all elements in an array
print()
stdEx = np.array([1, 2, 3, 4, 5])
print(stdEx)
print("std function will return standard deviation: ", np.std(stdEx))

