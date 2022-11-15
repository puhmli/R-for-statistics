##################################################################################
####R 语言基础
#################################################################################
myString <- "Hello, World!"

print ( myString )
###以上实例将字符串 "Hello, World!" 赋值给 myString 变量，然后使用 print() 函数输出。
###注意：R 语言赋值使用的是左箭头 <- 符号，不过一些新版本也支持等号 =




####变量
###R 语言的有效的变量名称由字母，数字以及点号 . 或下划线 _ 组成变量名称以字母或点开头。


# 使用等号 = 号赋值
var.1 = c(0,1,2,3)          
print(var.1)
#[1] 0 1 2 3

# 使用左箭头 <-赋值
var.2 <- c("learn","R")  
print(var.2)
#[1] "learn" "R"

# 使用右箭头 -> 赋值
c(TRUE,1) -> var.3
print(var.3)
#[1] 1 1   

#查看已定义的变量可以使用 ls() 函数：
print(ls())
#[1] "var.1" "var.2" "var.3"

#删除变量可以使用 rm() 函数：
rm(var.3)
print(ls())
#[1] "var.1" "var.2"

#交互式命令可以通过输入 q() 来退出：
q()
#Save workspace image? [y/n/c]: y
#######




#输入输出
#print() 输出
#print() 是 R 语言的输出函数。
#和其他编程语言一样，R 语言支持数字、字符等输出。
#输出的语句十分简单：
print("Rstatistics")
print(123)
print(3e2)
#[1] "Rstatistics"
#[1] 123
#[1] 300


#R 语言与 node.js 和 Python 一样，是解释型的语言，所以我们往往可以像使用命令行一样使用 R 语言。
#如果我们在一行上进输入一个值，那么 R 也会把它直接标准化输出：
5e-2
#[1] 0.05


#cat() 函数
#如果需要输出结果的拼接，我们可以使用 cat() 函数：
cat(1, "加", 1, "等于", 2, '\n')
#1 加 1 等于 2


#工作目录
#对于文件操作，我们需要设置文件的路径，R 语言可以通过以下两个行数来获取和设置当前的工作目录：
#getwd() : 获取当前工作目录
#setwd() : 设置当前工作目录
# 当前工作目录
print(getwd())

# 设置当前工作目录
setwd("C:/Users/puhml/Desktop/test ")

# 查看当前工作目录
print(getwd())
###########################################################################################






##################################################################################
####R 基础运算
#################################################################################

#赋值
#一般语言的赋值是 = 号，但是 R 语言是数学语言，所以赋值符号与我们数学书上的伪代码很相似，是一个左箭头 <- ：
a <- 123
b <- 456
print(a + b)
#[1] 579

#这个赋值符号是 R 语言的一个形式上的优点和操作上的缺点：形式上更适合数学工作者，毕竟不是所有的数学工作者都习惯于使用 = 作为赋值符号。
#操作上来讲，< 符号和 - 符号都不是很好打的字符，这会让很多程序员不适应。因此，R 语言的比较新的版本也支持 = 作为赋值符：
a = 123
b = 456
print(a + b)
#这也是合法的 R 程序。

#例子
1 + 2 * 3
#[1] 7
(1 + 2) * 3
#[1] 9
3 / 4
#[1] 0.75
3.4 - 1.2
#[1] 2.2
 1 - 4 * 0.5^3
#[1] 0.5
8 / 3 %% 2
#[1] 8
8 / 4 %% 2
#[1] Inf
3 %% 2^2
#[1] 3
10 / 3 %/% 2
#[1] 10


#关系运算符
v <- c(2,4,6,9)
t <- c(1,4,7,9)
print(v>t)
print(v < t)
print(v == t)
print(v!=t)
print(v>=t)
print(v<=t)
#[1]  TRUE FALSE FALSE FALSE
#[1] FALSE FALSE  TRUE FALSE
#[1] FALSE  TRUE FALSE  TRUE
#[1]  TRUE FALSE  TRUE FALSE
#[1]  TRUE  TRUE FALSE  TRUE
#[1] FALSE  TRUE  TRUE  TRUE

#逻辑运算符
#逻辑运算符比较两个向量，将第一向量与第二向量的每个元素进行比较，结果返回一个布尔值。
v <- c(3,1,TRUE,2+3i)
t <- c(4,1,FALSE,2+3i)
print(v&t)
print(v|t)
print(!v)
# &&、||只对第一个元素进行比较
v <- c(3,0,TRUE,2+2i)
t <- c(1,3,TRUE,2+3i)
print(v&&t)

v <- c(0,0,TRUE,2+2i)
t <- c(0,3,TRUE,2+3i)
print(v||t)
#[1]  TRUE  TRUE FALSE  TRUE
#[1] TRUE TRUE TRUE TRUE
#[1] FALSE FALSE FALSE FALSE
#[1] TRUE
#[1] FALSE

#其他运算符
#R 语言还包含了一些特别的运算符。

#运算符	描述
#:	冒号运算符，用于创建一系列数字的向量。
#%in%	用于判断元素是否在向量里，返回布尔值，有的话返回 TRUE，没有返回 FALSE。
#%*%	用于矩阵与它转置的矩阵相乘。
# 1 到 10 的向量
v <- 1:10
print(v)

# 判断数字是否在向量 v 中
v1 <- 3
v2 <- 15
print(v1 %in% v)
print(v2 %in% v)

# 矩阵与它转置的矩阵相乘
M = matrix( c(2,6,5,1,10,4), nrow = 2,ncol = 3,byrow = TRUE)
t = M %*% t(M)
print(t)

#[1]  1  2  3  4  5  6  7  8  9 10
#[1] TRUE
#[1] FALSE
#      [,1] [,2]
#[1,]   65   82
#[2,]   82  117

#数学函数
#sqrt(n)	n的平方根
#exp(n)	自然常数e的n次方，
#log(m,n)	m的对数函数，返回n的几次方等于m
#log10(m)	相当于log(m,10)
 sqrt(4)
#[1] 2
 exp(1)
#[1] 2.718282
 exp(2)
#[1] 7.389056
 log(2,4)
#[1] 0.5
 log10(10000)
#[1] 4
 
 
#取整函数：
#round	(n)	对 n 四舍五入取整
#(n, m)	对 n 保留 m 位小数四舍五入
# ceiling	(n)	对 n 向上取整
# floor	(n)	对 n 向下取整
#R 中的 round 函数有些情况下可能会"舍掉五"。
#当取整位是偶数的时候，五也会被舍去，这一点与 C 语言有所不同。 
 
 
 
#概率函数
 dnorm(0)
 #[1] 0.3989423
pnorm(0)
 #[1] 0.5
 qnorm(0.95)
 #[1] 1.644854
 rnorm(3, 5, 2) # 产生 3 个平均值为 5，标准差为 2 的正态随机数
# [1] 4.177589 6.413927 4.206032 
 
 #只有一位小数
 round(4.5)
# [1] 4
 #多于一位小数
 round(4.55)
#[1] 5
 round(4.5556666)
# [1] 5
dnorm(0) # dnorm 指示标准正态(高斯)分布(期望为0，方差为1)的概率密度函数
pnorm(0) # pnorm 指示标准正态分布的概率分布函数(即对概率密度函数求积分)
qnorm(0.96) # qnorm 计算Alpha下分位点
rnome(3,5,2) #免误导理解：由正态分布(期望为5，方差为2)产生三个随机数



##################################################################################
####R 判断语句
#################################################################################
#判断结构要求程序员指定一个或多个要评估或测试的条件，以及条件为真时要执行的语句（必需的）和条件为假时要执行的语句（可选的）。
#R 语言提供了以下类型的判断语句：
#if 语句
#if...else 语句
#switch 语句

#if 语句
#一个 if 语句 由一个布尔表达式后跟一个或多个语句组成。

#语法格式如下：
#if(boolean_expression) {
# // 布尔表达式为真将执行的语句
#}
#如果布尔表达式 boolean_expression 为 ture 执行这里面的代码，如果 为 false 则不执行。
x <- 50L
if(is.integer(x)) {
 print("X 是一个整数")
}
#[1] "X 是一个整数"

#if...else 语句
#一个 if 语句 后可跟一个可选的 else 语句，else 语句在布尔表达式为假时执行。
#语法格式如下：
#if(boolean_expression) {
# // 如果布尔表达式为真将执行的语句
#} else {
# // 如果布尔表达式为假将执行的语句
#}
x <- c("google","rstatistics","taobao")

if("rstatistics" %in% x) {
 print("包含 rstatistics")
} else {
 print("不包含 rstatistics")
}
#[1] "包含 rstatistics"

#如果有多个条件判断，可以使用 if...else if...else：
x <- c("google","rstatistics","taobao")

if("weibo" %in% x) {
 print("第一个 if 包含 weibo")
} else if ("rstatistics" %in% x) {
 print("第二个 if 包含 rstatistics")
} else {
 print("没有找到")
}
#[1] "第二个 if 包含 rstatistics"

#switch 语句
#switch 语句必须遵循下面的规则：

#switch 语句中的 expression 是一个常量表达式，可以是整数或字符串，如果是整数则返回对应的 case 位置值，如果整数不在位置的范围内则返回 NULL。
#如果匹配到多个值则返回第一个。
#expression如果是字符串，则对应的是 case 中的变量名对应的值，没有匹配则没有返回值。
#switch 没有默认参数可用。
x <- switch(
 3,
 "google",
 "runoob",
 "taobao",
 "weibo"
)
print(x)
#[1] "taobao"

#如果是字符串返回字符串变量对应的值：
you.like<-"runoob"
switch(you.like, google="www.google.com", runoob = "www.runoob.com", taobao = "www.taobao.com")

#[1] "www.runoob.com"

#如果整数不在范围内的则返回 NULL
x <- switch(4,"google","runoob","taobao")
x
#NULL
