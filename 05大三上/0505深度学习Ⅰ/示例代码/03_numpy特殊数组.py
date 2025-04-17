# 03_numpy特殊数组.py
# 生成一个等差数组
import numpy as np
# for i in range(1,10,0.1):
#     print(i)
#            前闭后开 步长
# a = np.arange(0,1,0.1).reshape(2,5)
# print(a)
# b = np.arange(0,1,0.1).reshape(2,5).T
# print(b)

# 全是0
zero = np.zeros(10,dtype='int32')
print(zero)
zero1 = np.zeros((2,3),dtype='int32')
print(zero1)

# 全是1
one = np.ones(10)
print(one)
one1 = np.ones((3,4))
print(one1)