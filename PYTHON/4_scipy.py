import numpy as np
from scipy import linalg

# Example 1 transpose() function returns a modified array

array = np.array([[1, 2, 3], [4, 5, 6]])

# transpose the arrays
print("The transpose function returns a modified array: \n", np.transpose(array))

# Example 2 matrix() function creates a matrix from an array

array = np.array([[1, 2, 3], [4, 5, 6]])

# create a matrix
print("Matrix function creates a matrix: \n", np.matrix(array))

# Example 3 add() matrix function

array1 = np.array([[1, 2, 3], [4, 5, 6]])
array2 = np.array([[1, 2, 3], [4, 5, 6]])

mtx1 = np.matrix(array1)
mtx2 = np.matrix(array2)

# add the two matrices
print("The add matrix function returns the sum of the martices: \n", np.add(mtx1, mtx2))

# Example 4 multiply() matrix function

array1 = np.array([[1, 2, 3], [4, 5, 6]])
array2 = np.array([[1, 2, 3], [4, 5, 6]])

mtx1 = np.matrix(array1)
mtx2 = np.matrix(array2)

# multiply the two matrices
print("The multipy function multiplies the matrices: \n", np.multiply(mtx1, mtx2))

# Example 5 subtract() matrix function

array1 = np.array([[1, 2, 3], [4, 5, 6]])
array2 = np.array([[1, 2, 3], [4, 5, 6]])

mtx1 = np.matrix(array1)
mtx2 = np.matrix(array2)

# subtract the two matrices
print("The subtract function subtracts one matrix from another: \n", np.subtract(mtx1, mtx2))

# Example 6 divide() matrix function

array1 = np.array([[1, 2, 3], [4, 5, 6]])
array2 = np.array([[1, 2, 3], [4, 5, 6]])

mtx1 = np.matrix(array1)
mtx2 = np.matrix(array2)

# divide the two matrices
print("The divide function divides the matrices: \n", np.divide(mtx1, mtx2))

# Example 7 linalg.sqrtm() matrix function returns the square root of a matrix

array = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

mtx = np.matrix(array)

# square root of the matrix
print("This function returns the square root of the matrix: \n", linalg.sqrtm(mtx))

# Example 8 transpose matrix function transposes the matrix

array = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

mtx = np.matrix(array)

# transpose the matrix
print("This function transposes the matrix: \n", mtx.T)

# Example 9 flatten() function

array = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

# flatten the array
print("This function flattens the array: \n", array.flatten())


