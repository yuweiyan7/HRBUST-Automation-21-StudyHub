# 02_numpy数组操作.py
# 练习创建数组及查看数组属性
import numpy as np
# 创建一维数组  维度：ndmin=2
arr1 = np.array([1,2,3,4])
print(arr1)
print("数组维度：",arr1.ndim)
print("数组的形状：",arr1.shape[0])
print("数组的元素个数：",arr1.size)
print("数组的类型：",arr1.dtype)
# 创建二维数组
arr2 = np.array([[1,2,3,4],
                 [5,6,7,8],
                 [9,10,11,12]])
print(arr2)
print("数组维度：",arr2.ndim)
print("数组的形状：",arr2.shape)
print("数组的元素个数：",arr2.size)
print("数组的类型：",arr2.dtype)