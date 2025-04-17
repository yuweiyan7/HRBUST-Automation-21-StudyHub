# 04_numpy随机数模块.py
# 符合标准正态分布的数据，3行3列
import numpy as np
np.random.seed(100)
# data1 = np.random.randn(300000,30)
# print(data1)
# print(data1.mean())
# print(data1.std())
# 1-100之间 5行5列 随机整数
data2 = np.random.randint(1,100,(5,5))
print(data2)
# 0-1之间10个随机数
data3 = np.random.random(10)
data3 = np.round(data3,2)
print(data3)