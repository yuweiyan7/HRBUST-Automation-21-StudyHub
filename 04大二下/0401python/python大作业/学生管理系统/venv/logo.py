import tkinter as tk
from tkinter import messagebox

root =tk.Tk()
root.geometry('400x200')
root.title('登录页面')
username=tk.StringVar()
password=tk.StringVar()


page=tk.Frame(root)
page.pack()
tk.Label(page).grid(row=0,column=0)

tk.Label(page,text='账户：').grid(row=1,column=1)
tk.Entry(page,textvariable=username).grid(row=1,column=2)

tk.Label(page,text='密码：').grid(row=2,column=1,pady=10)
tk.Entry(page,textvariable=password).grid(row=2,column=2)

def login():
    name=username.get()
    pwd=password.get()
    print(name,pwd)
    if name=='python'and pwd=='100':
        print('登录成功')
    else :
        messagebox.showwarning(title='警告',message='登陆失败，请检查账号密码是否正确')


tk.Label(page,text='登录',command=login).grid(row=3,column=1,pady=10)
tk.Label(page,text='退出',command=page.quit).grid(row=3,column=2)

root.mainloop()