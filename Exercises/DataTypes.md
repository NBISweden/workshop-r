---
title: "Data types in R"
layout: default
---

# Pre-course Material
<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#orgheadline2">1. Introduction</a>
<ul>
<li><a href="#orgheadline1">1.1. Data types</a></li>
</ul>
</li>
<li><a href="#orgheadline4">2. Exercise: Basic operations and data types in R</a>
<ul>
<li><a href="#orgheadline3">2.1. Create and retrieve information about variables in R</a></li>
</ul>
</li>
</ul>
</div>
</div>


# Introduction<a id="orgheadline2"></a>

There are different data modes used in R. The mode of a variable will
for example determine what kind of operators that can be done on it. At the end of
this exercise you should know:

-   What are the data types commonly used in R and how to create them
-   Use some basic operators in R
-   Understand how R coerce data if needed
-   Basic text manipulations

## Data types<a id="orgheadline1"></a>

From the lecture you might remember that all elements in any data
stuctures found in R will be of a certain type (or have a certain
mode). The four most commonly used data types in R are: logical,
integer, double (often called numeric), and character. The names hints
at what they are.

-   Logical = TRUE or FALSE (or NA)
-   Integer = Numbers that can be represented without fractional component
-   Numeric = Any number that is not a complex number.
-   Character = Text

In many cases the mode of on entry is determined by the content so if
you save the value 5.1 as a variable in R, the variable will
automatically be recognised as numeric. If you instead have a text
string like "hello world" it will have the mode character. Below you
will also see examples of how you can specify the mode and not rely on
R inferring the right mode based on content.

# Exercise: Basic operations and data types in R<a id="orgheadline4"></a>

In all exercises on this course it is important that you prior to
running the commands in R, try to figure out what you expect the
result to be. You should then verify that this will indeed be the
qresult by running the command in an R session. In case there is a
discrepency between your expectations and the actual output make sure
you understand why before you move forward. If you can not figure out
how to, or which command to run you can click the key to reveal
example code including expected output. If you after peaking at the
code and trying out things on your own have a hard time understanding
what is going on, ask the TAs or or your someone sitting next to you
who might have wrapped their head around the issue.

Also note that in many cases there multiple solutions that solve the
problem equally well.

We do recommend to write all code in a R markdown document in R-studio
as that will at the end of the course be your own R tutorial with
comments and code solutions. 

## Create and retrieve information about variables in R<a id="orgheadline3"></a>

Open R-studio and make sure to set your working directory. Double
check that you do not have stored objects in your current session with
the following command. This will list all objects that you have in
your current R session.
```
ls()
```
In case you have objects that you want to remove from the current
session you can do so with the rm function. NB! This command will
remove all objects available in your current session.
```
rm(list = ls())
```
This command uses commands that we have not talked about yet. If you
do not understand how it works now, you will do so after tomorrows
lectures and exercises.

1.  Create variables *var1* and *var2* and initialize them with two integers of choice.
	<details>
	<summary>:key: Click to see how</summary>
	<pre>
	var1 <- 11  
	var2 <- 34  
	</pre>
	</details>
<br>
2.  Add the two variables and save them as a new variable named *var3*
    and print the result.
	
	<details> 
	<summary>:key: Click to see how</summary> 
	<pre>
	var3 <- var1 + var2  
	var3  

	[1] 45  
	</pre>
	</details>
	<br>
3.  Check the class, mode, and type for var1, var2, var3 and &pi; (is
	found under the variable name pi in R)
	<details>
	<summary>:key: Click to see how for var1</summary>
	<pre>
	mode(var1)  
	class(var1)  
	typeof(var1)  
	
	[1] "numeric"  
	[1] "numeric"  
	[1] "double"  
	</pre>
	</details>
	
	<details>
	<summary>:key: Click to see how for &pi;</summary>
	<pre>
	mode(pi)  
	class(pi)  
	typeof(pi)  
    
	[1] "numeric"  
	[1] "numeric"  
	[1] "double"  
	</pre>
	</details>
<br>
4.  Create two character variables containing a text of choice. 
	-   check mode, class, and type of the first one
		<details>
		<summary>:key: Click to see how create character variables</summary>
		<pre>
		text1 <- "test1"  
		text2 <- "test2"  
		</pre>
		</details>
	
	-   add var1 to it and report the result
		<details>
		<summary>:key: Click to see how to add variables</summary>
		<pre>
		text1 + var1  
	
		Error in text1 + var1 : non-numeric argument to binary operator  
		</pre>
		</details>
<br>
5.  Cast var3 to integer, cast an integer variable to double, cast a
	string to a double.
	<details>
	<summary>:key: Click to see how</summary>
	<pre>
	as.integer(var3)  
	i <- 175  
	as.double(i)  
	as.double(text1)  
    
	[1] 45  
	[1] 175  
	[1] NA  
	Warning message:  
	NAs introduced by coercion  
	</pre>
	</details>
<br>
6.  Report floor and ceiling of &pi; and round &pi; to 3 decimal places.
	<details>
	<summary>:key: Click to see how</summary>
	<pre>
	floor(pi)  
	ceiling(pi)  
	round(pi, digits = 3)  
    
	[1] 3  
	[1] 4  
	[1] 3.142  
	</pre>
	</details>
<br>
7.  Is floor of &pi; an integer?
	<details>
	<summary>:key: Click to see how</summary>
	<pre>	
	is.integer(floor(pi))  

	[1] FALSE  
	</pre>
	</details>
<br>
8.  Treat '3.56437' string as number.
	<details>
	<summary>:key: Click to see how</summary>
	<pre>	
	as.numeric('3.56437')  
	</pre>
	</details>
<br>
9.  Divide &infin; by - &infin;
	<details>
	<summary>:key: Click to see how</summary>
	<pre>	
	-Inf/Inf  
    
	[1] NaN  
	</pre>
	</details>
<br>
10. Create two freely chosen complex numbers. 
	-   Check that they are complex indeed.
	-   Add, multiply and divide one by another.
	-   Add an integer to their sum.
	<details>
	<summary>:key: Click to see how</summary>
	<pre>
	c1 <- 23 + 4i  
	c2 <- -15 - 7i  
	is.complex(c1)  
	is.complex(c2)  
	c1 + c2  
	c1 / c2  
	c1 + c2 + 7  
	[1] TRUE  
	[1] TRUE  
	[1] 8-3i  
	[1] -1.361314+0.368613i  
	[1] 15-3i  
	</pre>
	</details>
<br>
11. Print a truth table for OR (for three distinct logical
    values). Read about truth tables here
    https://en.wikipedia.org/wiki/Truth_table
	<details>
	<summary>:key: Click to see how</summary>
	<pre>	
	x <- c(NA, FALSE, TRUE)  
	names(x) <- as.character(x)  
	outer(x, x, "|")  
	
	NA FALSE TRUE  
	NA      NA    NA TRUE  
	FALSE   NA FALSE TRUE  
	TRUE  TRUE  TRUE TRUE  
	</pre>
	</details>
<br>
12. Multiply a logical TRUE by a logical FALSE.
	Rise the logical true to the 7-th power.
	<details>
	<summary>:key: Click to see how</summary>
	<pre>
	TRUE * FALSE  
	T^7  
	[1] 0  
	[1] 1  
	</pre>
	</details>
<br>
13. Create two character variables containing two verses of your favorite song.  
	-  concatenate the two variables,  
	-  paste the variables with '\*' as separator.  
	-  find if 'and' occurs in the second line,  
	-  substitute a word for another,  
	-  extract substring starting at the 5th character and 5 characters long.  
	<details>
	<summary>:key: Click to see how</summary>
	<pre>	
	line1 <- "Hello darkness my old friend"  
	line2 <- "I've come to talk to you again"  
	paste(line1, line2, sep = "")  
	paste(line1, line2, sep = "*")  
	grep('and', line2)  
	sub('Hello', 'Goodbye', line1)  
	substr(line1, 5, 5 + 5)  
    
	[1] "Hello darkness my old friendI've come to talk to you again"  
	[1] "Hello darkness my old friend*I've come to talk to you again"  
	integer(0)  
	[1] "Goodbye darkness my old friend"  
	[1] "o dark"  
	</pre>
	</details>
<br>

## R Environment
- get help for the *t.test*, *table*, *locator* and *identify* functions,
- check for all occurences of *fisher.test* in the docs,
- which package contains the *plot.ecdf* function. What does it do?
- find package 'reshaape'-related questions on StackOverflow,
- *google* how to load an XML file into R,
- install the 'cgmisc' package from GitHub,
- look up the 'cgmisc' vignette,
- see all the demos available for you and run one you like,
- run examples for the *fisher.test*,
- check out CRANs view for genetics,
- install a CRAN package of choice,
- install the R-Forge pckage 'bigRR'
