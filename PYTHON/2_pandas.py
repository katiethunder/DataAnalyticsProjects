from typing import Optional

import pandas as pd
import numpy as np
from pandas._typing import NDFrameT

# Example 1 DataFrame() function creates a DataFrame object
data = {
  "age": [22, 45, 34],
  "weight": [87, 102, 78]
}

df = pd.DataFrame(data)
print("DataFrame object created: \n", df)

# Example 2 read() / write() functions create a dataFrame, write it to a CSV file, and read it back from CSV
data = {
  "age": [22, 45, 34],
  "weight": [87, 102, 78]
}

df = pd.DataFrame(data)
df.to_csv('data.csv', sep=',', index=False)
df2 = pd.read_csv('data.csv')
print("Print of csv file we have written to: \n", df2.to_string())

# Example 3 get a subset of a DataFrame
data = {
  "age": [22, 45, 34],
  "weight": [87, 102, 78]
}

df = pd.DataFrame(data)
print("Selecting only age column: \n", df.age)

# Example 4 sort() function sorts a DataFrame by a column
data = {
  "age": [22, 45, 34],
  "weight": [87, 102, 78]
}

df = pd.DataFrame(data)
print("Sorting by age ascending: \n", df.sort_values(by='age'))

# Example 5 min() function returns the smallest element in a column
data = {
  "age": [22, 45, 34],
  "weight": [87, 102, 78]
}

df = pd.DataFrame(data)
print("Minimum value: \n", df.min())

# Example 6 max() function returns the largest element in a column
data = {
  "age": [22, 45, 34],
  "weight": [87, 102, 78]
}

df = pd.DataFrame(data)
print("Maximum value: \n", df.max())

# Example 7 describe() function returns a DataFrame with descriptive statistics
data = {
  "age": [22, 45, 34],
  "weight": [87, 102, 78]
}

df = pd.DataFrame(data)
print("Describe function provides descriptive statistics: ")
print(df.describe())

# Example 8 info() function returns a DataFrame with descriptive statistics
data = {
  "age": [22, 45, 34],
  "weight": [87, 102, 78]
}

print("Info function provides range info and number of columns: ")
df = pd.DataFrame(data)
print(df.info())

# Example 9 the dropna() function will drop NA values from the dataset:
df = pd.read_csv("Homeless.csv")
print("Original dataset: \n", df.to_string())
new_df = df.dropna()
print("Dataset with NA value removed: \n", new_df.to_string())

# Example 10 the fillna() function will replace missing values with specified values:
print("Original dataset: \n", df.to_string())
df.fillna(25, inplace=True)
print("Dataset with replaced missing value: \n", df.to_string())

# Example 11 replacing incorrect values
print("Original dataset: \n", df.to_string())
df.loc[8, 'Female Adults'] = 142
print("Dataset with incorrect value corrected: \n", df.to_string())


