FILE='student.txt'#定义文件名，将信息保存在磁盘上
#导入os模块，用来判断磁盘上是否有无文件
import os
#定义主菜单的图形界面函数
def mainmenu():
    print('********************学生信息管理系统********************')
    print('                      *功能菜单*                       ')
    print('                    1.添加学生信息                      ')
    print('                    2.删除学生信息                      ')
    print('                    3.修改学生信息                      ')
    print('                    4.查询学生信息                      ')
    print('                    5.打印所有学生信息                   ')
    print('                    6.统计学生人数                      ')
    print('                    0.退出系统                         ')
    print('*****************************************************')

#添加学生信息函数
def addStudent():
    infolist=[]#存储增加的学生
    #循环增加学生信息
    while True:
        ID=input("请输入学生学号（例如2005020128）：")
        name=input("请输入学生姓名：")
        try:
            Python=float(input("请输入Python成绩："))
            C=float(input("请输入C语言成绩："))
            Java=float(input("请输入Java成绩："))
        except:
            print('您输入的数据有误，请输入正确的数据！')
            continue
        try:
            phoneNumber=int(input("请输入学生手机号码："))
        except:
            print("您输入的数据有误，请输入正确的数据！")
            continue
        #创建字典，将学生的信息存储到字典当中
        student={'ID':ID,'name':name,'python':Python,'c':C,'java':Java,'phonenumber':phoneNumber}
        infolist.append(student)
        temp=input('您是否继续添加生信息？是/否\n')
        if temp=='是':
            continue
        else:
            break
    #利用save()函数，将学生的信息保存到文件中
    save(infolist)
    print('学生信息增加成功！')
#定义save函数，保存学生信息
def save(lst):
    try:
        studenttxt=open(FILE,'a',encoding='utf-8')
    except:
        studenttxt=open(FILE,'w',encoding='utf-8')
    for i in lst:
        studenttxt.write(str(i)+'\n')
    studenttxt.close()



#删除学生信息函数
def delStudent():
    while True:
        studentID=input("请输入要删除学生的ID：")
        if studentID!="":
            #判断文件是否存在
            if os.path.exists(FILE):
                with open(FILE,'r',encoding='utf-8') as File:
                    studentlist=File.readlines()
            else:
                studentlist=[]
            fg=False#标记是否删除
            #文件存在
            if studentlist:
                with open(FILE,'w',encoding='utf-8') as wFILE:
                    t={}
                    for i in studentlist:
                        t=dict(eval(i))#将读出来的字符串转化成字典
                        if t['ID']!=studentID:
                            wFILE.write(str(t)+'\n')
                        else:
                            fg=True
                    if fg:
                        print(f'ID为{studentID}的学生信息已经被删除')
                    else:
                        print(f'未找到ID为{studentID}的学生')
            else:
                print('没有学生信息')
                break
            #删除功能操作完成后重新显示所有学生信息
            priStudent()
            temp=input("是否继续删除学生的信息？是/否\n")
            if temp=='是':
                continue
            else :
                break







#修改学生信息函数
def  modStudent():
    priStudent()
    if os.path.exists(FILE):
        with open(FILE,'r',encoding='utf-8') as rFILE:
            studentlist=rFILE.readlines()
    else:
        return
    studentID=input('请输入所要修改学生的ID：')
    with open(FILE,'w',encoding='utf-8') as wFILE:
        for i in studentlist:
            t=dict(eval(i))#将所读到的文件进行转换
            #找到已有学生的ID
            if t['ID']==studentID:
                print('找到该学号的学生，可以进行修改操作！')
                while True:
                    try:
                          t['name']=input('请输入姓名:')
                          t['python']=input('请输入Python成绩：')
                          t['c']=input('请输入C语言成绩：')
                          t['java']=input('请输入Java成绩：')
                          t['phonenumber']=input('请输入该学生手机号码：')
                    except:
                        print('您的输入有误，请重新输入正确的信息！')
                    else:
                        break
                wFILE.write(str(t)+'\n')
                print('修改成功！')
            else:
                wFILE.write(str(t) + '\n')
        temp=input('您是否要继续修改其他学生的信息？是/否\n')
        if temp=='是':
            modStudent()





#查询学生信息函数
def inqStudent():
    studentinquire=[]#定义列表存储学生信息
    while True:
        ID=''
        nmae=''
        #判断文件是否存在
        if os.path.exists(FILE):
            way=input('根据学号ID查找请按1，根据姓名查找请按2：')
            if way=='1':
                ID=input('请输入该学生的学号ID：')
            elif way=='2':
                name=input('请输入该学生的姓名')
            else :
                print('您的输入有误，请重新输入正确的数字！')
                continue
            with open(FILE,'r',encoding='utf-8') as rFILE:
                student=rFILE.readlines()
                for i in student:
                    t=dict(eval(i))
                    if ID!='':
                        if t['ID']==ID:
                            studentinquire.append(t)
                    elif name!='':
                        if t['name']==name:
                            studentinquire.append(t)
             #显示查询结果
            showStudent(studentinquire)
            #如果列表当中有数据，则需要清空列表
            studentinquire.clear()
            temp=input('您是否要继续查询学生信息？是/否\n')
            if temp=='是':
                continue
            else:
                break
        else :
            print('文件当中并没有学生信息')
            return

# 显示学生信息结果函数
def showStudent (lst):
    if len(lst)==0:
        print('未查询到相关学生的信息！')
        return
    # 显示的格式
    formatshowtitle='{:^12}\t{:^12}\t{:^12}\t{:^12}\t{:^12}\t{:^16}\t'
    print(formatshowtitle.format('学号','姓名','python成绩','C语言成绩','Java成绩','手机号码'))
    formatshowdata = '{:^12}\t{:^12}\t{:^12}\t{:^12}\t{:^12}\t{:^20}\t'
    for i in lst:
        print(formatshowdata.format(i.get('ID'),
                                    i.get('name'),
                                    i.get('python'),
                                    i.get('c'),
                                    i.get('java'),
                                    i.get('phonenumber')))


#打印所有学生信息函数
def priStudent():
    studentslst=[]#定义存储学生信息
    #判断文件是否存在
    if os.path.exists(FILE):
        with open(FILE,'r',encoding='utf-8') as rFILE:
            students=rFILE.readlines()#将读取到的文件信息放入到列表中
            for i in students:
                studentslst.append(eval(i))
            if studentslst:
                showStudent(studentslst)
    else:
        print('还未保存文件！')

#统计学生人数函数
def  totStudent():
#先判断文件是否存在
   if os.path.exists(FILE):
       with open(FILE,'r',encoding='utf-8') as rFILE:
           students=rFILE.readlines()
           if students:
               print(f'一共有{len(students)}名学生')#列表不为空直接得出多少名学生
           else:
               print('还未增加学生信息')
   else:
       print("还未有学生信息")

#用主程序的方式来调用函数实现相应的功能
if __name__ == '__main__':
    while True:
        mainmenu()
        select = eval(input('请您输入所要实现功能所对应的数字：'))
        if select in [0, 1, 2, 3, 4, 5, 6]:
            if select == 0:
                temp = input("您是否要退出系统？是/否")
                if temp == '是':
                    print("谢谢您使用该系统")
                    break  #####退出该系统
                else:
                    continue  ####不退出系统，继续选择相应的功能
            elif select == 1:
                addStudent()  # 添加学生信息
            elif select == 2:
                delStudent()  # 删除学生信息
            elif select == 3:
                modStudent()  # 修改学生信息
            elif select == 4:
                inqStudent()  # 查询学生信息
            elif select == 5:
                priStudent()  # 打印所有学生信息
            elif select == 6:
                totStudent()  # 统计学生人数

