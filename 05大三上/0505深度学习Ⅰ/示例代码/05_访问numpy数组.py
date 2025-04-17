# 05_访问numpy数组.py
# 一维数组的访问
import numpy as np
# arr = np.arange(10)
# print(arr)
# print(arr[5])
# print(arr[3:6])
# # [1 3 5 7 9]
# print(arr[1::2])
# #[9 8 7 6 5]
# print(arr[-1:4:-1])
# arr[3:5] = 10,11
# print(arr)
# 二维数组的索引访问
arr = np.arange(12).reshape(3,4)
print(arr)
# 只对行有要求
# 前2行
# print(arr[0:2])
# # 第一行和第三行
# print(arr[[0,2]])
#
# # 只对列有要求
# print(arr[:,0:2])
# # 159 3711
# print(arr[:,[1,3]])

# 对行和列都有要求
# [[1 2]
#  [5 6]]
print(arr[0:2,1:3])
# [[1 3]
#  [5 7]]
print(arr[0:2,[1,3]])
# [[1 3]
#  [9 11]]
print(arr[[0,2],[1,3]]) # 这种形式跟数据形式一样，取的是对应的值
print(arr[[0,2]][:,[1,3]])