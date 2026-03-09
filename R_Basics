"Hello World!" #doesn't need print statement; also works with print(" ")
5
2+2
2*4*6
4+(45-(2*3)+(5*4)-(120/5))
pi #returns value of pi

name <- "John"
age <- 40
age
name
print(name)
print(age)
# all provide the same output

2*5*(6+9-3)
120-(8/5+(28*4))+(5+7)
# use of paranthesis is suggested
pi*5*5
#power function has same priority as multiplication
#power function can be written as ** or ^
#square root can be written as sqrt()
pi*5**2

x=5; 5*(x**2) + 2*x + 3
x=5; y=2; x^2 + 5*x*y -2*(y**3); 2*(x**2.3) - sqrt(x*y) + y;

text1 <- "R is"
text2 <- "awesome"
paste(text1, text2) # automatically provides space between text1 and text2 

num1 <- 5
num2 <- 10
num1 + num2

num <- 5
text <- "Some text"
num + text # Error (different datatypes)

var1 <- var2 <- var3 <- "Orange"
var1
var2
var3

# Legal variable names:
myvar <- "John"
my_var <- "John"
myVar <- "John"
MYVAR <- "John"
myvar2 <- "John"
.myvar <- "John"

# Illegal variable names:
2myvar <- "John"
my-var <- "John"
my var <- "John"
_my_var <- "John"
my_v@ar <- "John"
TRUE <- "John"

# A variable name must start with a letter and can be a combination of letters, digits, period(.)
and underscore(_). If it starts with period(.), it cannot be followed by a digit.
# A variable name cannot start with a number or underscore (_)
# Variable names are case-sensitive (age, Age and AGE are three different variables)
# Reserved words cannot be used as variables (TRUE, FALSE, NULL, if...)

# Data Types
# numeric - (10.5, 55, 787) numbers with/ without decimals
# integer - (1L, 55L, 100L, where the letter "L" declares this as an integer) without decimals
# complex - (9 + 3i, where "i" is the imaginary part)
# character (a.k.a. string) - ("k", "R is exciting", "FALSE", "11.5")
# logical (a.k.a. boolean) - (TRUE or FALSE)

# Built-in Math Module:
max (5, 10, 15)
min (5, 10, 15)
sqrt(25)
abs(-4.7) #4.7
ceiling(1.4)
floor(1.4)

str <- "hello 
hello"
str # hello /nhello
cat(str) # hello 
#hello

# Escape Sequences: \' \" \\ \r \t \n \b

# Boolean Values: TRUE, FALSE, T, F

# Arithmetic Operators:
+ - * / ^ %% (remainder) %/% (quotient)

# Comparison Operator:
== != < > <= >=

# Logical Operators:
| (element-wise OR) || (expression-wise OR) & (element-wise AND) && (expression-wise AND) ! (NOT)

# Miscellaneous Operator:
: (sequence creation) %in% (check if an element belongs to a vector) %*% (matrix multiplication)

# c refers to a vector and can taken any values like numeric, string/ character (in single/ double quotes)
Weight=c(60,72,10); Weight; z= Weight*Weight; z; # self operation on elements

Fruit=c("apple","banana","orange"); Fruit;

truth=c(T,F); truth; # caps T and F only without quotes

x = c(5, 3, 7, 11, 4, 6, 10, 9, 8, 12);
y1 = 2*x^2 - 11*x + 25; y1;
y2 = cos(x); y2;
#log(x, base = value)
#value for 'e' is exp(1) because e can be taken as variable
y3 = log(x, base = exp(1)); y3;
y4 = log(x, base = 10); y4;
y5 = 0.2*(0.5**x); y5;
y6 = exp(x+5); y6;
#default radians is taken for angles but can be converted into degrees by x* pi/180
y7 = cos(x*pi/180);

5:15; #list all values from 5 to 15 (both inclusive)
15:5; #list all values from 15 to 5 in descending order (both inclusive)
seq(5,22,3); # 3rd value shows step-count until values <= 2nd value
rep(c(2,3,4),4);	#repeats whole array k number of times after every iteration of complete array			
rep(c(2,3,4),each=2); #repeats each element k number of times then moves to the next element
rep(c(2,3,4),c(4,3,2)); #repeats each element k number of times then moves to the next element based on the 2nd array

x = c(11,12,13,14,15)
length(x);
x[c(2,4)]; #slicing array 
x[(-c(2,4)]; #slicing from end
x[x>2]; 
x[1:3]; 
x[5:2];	
sort(x); 
sort(x,TRUE); 
Fruit=c("apple","banana","orange"); sort(Fruit);
y=c(20,21,22); z=c(x,y); 
which(x>22,TRUE);


x = c(39, 96, 15, 54, 96, 67, 95, 13, 62, 26,  6,  2, 51, 31, 10,  8);
sum(x);
sum(x>40);
mean(x);
var(x);
sd(x);
quantile(x,c(0.25,0.5,0.75));
quantile(x,c(0.75)) - quantile(x,c(0.25));
IQR(x);
min(x);
max(x);
summary(x);



ht = c(1.32, 1.41, 1.16, 1.22, 0.95);
wt = c(45, 56, 77, 62, 85);
gn = c('M', 'F', 'F', 'M', 'M');
aa = data.frame(ht,wt,gn); #parameters become columns
aa; #creates a matrix of (n samples X m parameters)
summary(aa);


aa[,2]; #colum selection
aa[3,2]; #position selection
aa[3,]; #row selection
aa[,1];
aa[aa$wt>65,];
aa[aa$gn=='M',];
aa[aa$wt>65&ht>1.22,];
aa[aa$wt>65|ht>1.22,];
aa[aa&wt,] #this isn't a selection

# operations: + - / * ** ^ sqrt() exp() log( , base = ) < > == <= >= != & | !

A=matrix(1:12, nrow=3);A;
B=matrix(1:12, ncol=4);B;
C=matrix(1:12, nrow=3, byrow=T);C;
D=matrix(c(2,3,1,5,6,8,7,1,3,10,8,7), nrow=3,byrow=T); D;
E=cbind(A,C); E;
G=rbind(A, C); G;

A=matrix(1:12,nrow=3);
rownames(A)=LETTERS[1:3];
colnames(A)=LETTERS[1:4];
A;

letters;
month.name;
month.abb;


u = c(1,2,3,4,5); v = c(11,12,13);
list1=list(u,v);
list1;
list1[[2]][2];
list1[[2]][3] = 25; list1;


x = c(12, 13, 5, 7, 16, 6, 9, 7, 11, 4, 14);
plot(x);
plot(x, type="l");
matplot(x,type="b");
matplot(x,type="c");
matplot(x,type="o");
matplot(x,type="h");
matplot(x,type="s");
matplot(x,type="S");

barplot(x);
barplot(x, names.arg=c("a","b","c","d","e","f","g","h","i", "j", "k"));
barplot(x, names.arg=c("a","b","c","d","e","f","g","h","i", "j", "k"), horiz = TRUE);

D = matrix(c(2,3,1,5,6,8,7,1,3,10,8,7), nrow=3,byrow=T);
matplot(D,type="l");

barplot(D,beside=TRUE);

names(x) = letters[1:11];
pie(x,labels=names(x));

title(main="Main Title", sub="Sub-title");
barplot(x, xlab="X-Label", ylab="Y-Label", main="Main Heading", sub="Sub-Heading", ylim=c(0,10), xlim=c(0,17));

legend(13,10,names(x));

// pch, Ity, las, font, cex, col





















