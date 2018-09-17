---
layout: default
title:  'Vectors in R'
---
# Vectors in R
<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#orgheadline4">1. Introduction</a>
<ul>
<li><a href="#orgheadline1">1.1. Data types</a></li>
<li><a href="#orgheadline2">1.2. Vectors in R</a></li>
<li><a href="#orgheadline3">1.3. Basic R operators</a></li>
</ul>
</li>
<li><a href="#orgheadline7">2. Exercise: Creating and working with vectors</a>
<ul>
<li><a href="#orgheadline5">2.1. Create and modify vectors</a></li>
<li><a href="#orgheadline6">2.2. Exercise: Modify and subset vectors</a></li>
</ul>
</li>
</ul>
</div>
</div>


# Introduction<a id="orgheadline4"></a>

There are several different data structured that are commonly used in
R. The different data structures can be seen as different ways to
organise data. In this exercise we will focus on vectors that are the
base data structure in R and will also get on overview of the key data types
(modes) that are found in R. At the end of this exercise you should
know:

-   What are the data types commonly used in R.
-   What is a vector.
-   How to create vectors in an interactive R session.
-   How one can use R functions to determine the structure and mode of an vector.
-   What basic operators you can find in R
-   Howto subset vector using both indexes and operators.
-   Try some of the built-in functions in R.

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
you save the value 5.1 as a variable in R, the variable will by R
automatically be recognised as numeric. If you instead have a text
string like "hello world" it will have the mode character. Below you
will also see examples of how you can specify the mode and not rely on
R inferring the right mode based on content.

## Vectors in R<a id="orgheadline2"></a>

Depending on the type of data one needs to store in R different data
structures can be used. The four most commonly used data types in R is
vectors, lists, matrixes and data frames. We will in this exercise
work only with vectors.

The most basic data structure in R are vectors. Vectors are
1-dimensional data structures that contain only one type of data
(eg. all entries must have the same mode). To create a vector in R one
can use the function `c()` (concatenate or
combine) as seen below. This example will create a vector named
example.vector with 3 entries in it.

    example.vector <- c(10, 20, 30)

NB! If you need more information about the function `c()` you can always use
the built-in manual in R. Typing `?c` will bring up the
documentation for the function `c()`.

Once you have created this vector in R, you can access it by simply
typing its name in an interactive session.

    example.vector

    [1] 10 20 30

The output generate on screen shows the entries in your vector and the
1 in squared brackets indicates what position in the vector the entry
to the right of it have. In this case 10 is the first entry of the vector.

If we for some reason only wanted to extract the value 10 from this
vector we can use the fact that we know it is the first position to do
so. 

    example.vector[1]

    [1] 10

Since a vector can only contain one data type, all members need to be
of the same type. If you try to combine data of different types into
the same vector, R will not warn you, but instead coerce it to the
most flexible type (From least to most flexible: Logical, integer,
double, character). Hence, adding a number to a logical vector
will turn the whole vector to a numeric vector.

To check what data type an object is, run the R built-in function
class(), with the object as the only parameter.

    class(example.vector)

    [1] "numeric"

If you for any reason want to have more information about any object
you have stored in your R session the command `str()` is very helpful.

    str(example.vector)

    num [1:3] 10 20 30

## Basic R operators<a id="orgheadline3"></a>

As in other programming languages there are a set of basic operators in R. 

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Operation</th>
<th scope="col" class="org-left">Description</th>
<th scope="col" class="org-left">Example</th>
<th scope="col" class="org-left">Example Result</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">x + y</td>
<td class="org-left">Addition</td>
<td class="org-left">1 + 3</td>
<td class="org-left">4</td>
</tr>


<tr>
<td class="org-left">x - y</td>
<td class="org-left">Subtraction</td>
<td class="org-left">1 - 3</td>
<td class="org-left">-2</td>
</tr>


<tr>
<td class="org-left">x * y</td>
<td class="org-left">Multiplication</td>
<td class="org-left">2 * 3</td>
<td class="org-left">6</td>
</tr>


<tr>
<td class="org-left">x / y</td>
<td class="org-left">Division</td>
<td class="org-left">1 / 2</td>
<td class="org-left">0.5</td>
</tr>


<tr>
<td class="org-left">x ^ y</td>
<td class="org-left">Exponent</td>
<td class="org-left">2 ^ 2</td>
<td class="org-left">4</td>
</tr>


<tr>
<td class="org-left">x %% y</td>
<td class="org-left">Modular arethmetic</td>
<td class="org-left">1 %% 2</td>
<td class="org-left">1</td>
</tr>


<tr>
<td class="org-left">x %/% y</td>
<td class="org-left">Integer division</td>
<td class="org-left">1 %/% 2</td>
<td class="org-left">0</td>
</tr>


<tr>
<td class="org-left">x == y</td>
<td class="org-left">Test for equality</td>
<td class="org-left">1 == 1</td>
<td class="org-left">TRUE</td>
</tr>


<tr>
<td class="org-left">x <= y</td>
<td class="org-left">Test less or equal</td>
<td class="org-left">1 <= 1</td>
<td class="org-left">TRUE</td>
</tr>


<tr>
<td class="org-left">x >= y</td>
<td class="org-left">Test for greater or equal</td>
<td class="org-left">1 >= 2</td>
<td class="org-left">FALSE</td>
</tr>


<tr>
<td class="org-left">x && y</td>
<td class="org-left">Non-vectorized boolean AND</td>
<td class="org-left">3 >= 2 &&  3 < 10</td>
<td class="org-left">TRUE</td>
</tr>


<tr>
<td class="org-left">x & y</td>
<td class="org-left">Vectorized boolean AND</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">x || y</td>
<td class="org-left">Non-vectorized boolean OR</td>
<td class="org-left">1 >= 2 || 3 < 10</td>
<td class="org-left">TRUE</td>
</tr>


<tr>
<td class="org-left">x |  y</td>
<td class="org-left">Vectorized boolean OR</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">!x</td>
<td class="org-left">Boolean not</td>
<td class="org-left">1 != 2</td>
<td class="org-left">TRUE</td>
</tr>
</tbody>
</table>

Besides these, there of course numerous more or less simple functions
available in any R session. For example, if we want to add all values
in our example.vector that we discussed earlier, we can do that using
addition:

    example.vector[1] + example.vector[2] + example.vector[3]

    [1] 60

But we can also use the function `sum()` that adds all numeric values
present as arguments.

    sum(example.vector)

    [1] 60

To learn more about a function use the built in R manual as described
earlier. If you do not know the name of a function that you believe
should be found in R, use the function `help.search()` or use google
to try and identify the name of the command.

# Exercise: Creating and working with vectors<a id="orgheadline7"></a>

In all exercises on this course it is important that you prior to
running the commands in R, try to figure out what you expect the
result to be. You should then verify that this will indeed be the
result by running the command in an R session. In case there is a
discrepency between your expectations and the actual output make sure
you understand why before you move forward. If you can not figure out
howto, or which command to run you can click the key to reveal example code
including expected output. Also note that in many cases there multiple
solutions that solve the problem equally well.

## Create and modify vectors<a id="orgheadline5"></a>

Open R-studio and create two numeric vectors named x and y that are of
equal length. Use these vectors to answer the questions below. 

:computer: **Create vectors**
<details>
<summary>:key: Click to see example R code to generate vectors</summary>
<pre>
x <- c(2, 4 ,7)  
y <- c(1, 5, 11)  
</pre>
</details>
<br>

1.  How many numbers are there in the vector x?
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
    length(x)  
    
	[1] 3  
	</pre>
	</details>
<br>
2.  How many numbers will x + y generate?
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
	length(x + y)  
    
	[1] 3  
	</pre>
	</details>
<br>
3.  What is the sum of all values in x?
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
	sum(x)  
    
	[1] 13  
	</pre>
	</details>
<br>
4.  What is the sum of y times y?
     <details>
	<summary>:key: Click to see how</summary>
	<pre>
    sum(y*y)  
    
	[1] 147  
	</pre>
	</details>
<br>
5.  What do you get if you add x and y?
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
    x + y  
    
	[1]  3  9 18  
	</pre>
	</details>
<br>
6.  Assign x times 2 to a new vector named z
     <details>
	<summary>:key: Click to see how</summary>
	<pre>
    z <- x * 2  
	</pre>
	</details>
<br>
7.  How many numbers will z have, why?
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
    length(z)  
    
	[1] 3  
	</pre>
	</details>
<br>
8.  Assign the mean of z to a new vector named z.mean and determine the length of z.mean
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
    z.mean <- mean(z)  
    length(z.mean)  
	
	[1] 1  
	</pre>
	</details>
<br>
9.  Create a numeric vector with all integers from 5 to 107
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
	vec.tmp <- 5:107  
	vec.tmp  
	
	[1]   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  
    [19]  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40  
    [37]  41  42  43  44  45  46  47  48  49  50  51  52  53  54  55  56  57  58  
    [55]  59  60  61  62  63  64  65  66  67  68  69  70  71  72  73  74  75  76  
    [73]  77  78  79  80  81  82  83  84  85  86  87  88  89  90  91  92  93  94  
    [91]  95  96  97  98  99 100 101 102 103 104 105 106 107  
	</pre>
	</details>
<br>
10. Create a numeric vector with the same length as the previos one, but only containg the number 3
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
    vec.tmp2 <- rep(3, length(vec.tmp))  
	vec.tmp2  
    
	[1] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  
    [38] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  
    [75] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3  
	</pre>
	</details>
<br>

11. Create a vector that contain all numbers from 1 to 17, where each number
    occurs the the same number of times as the number itself eg. 1, 2, 2, 3, 3, 3...
	<details>
	<summary>:key: Click to see how</summary>
	<pre>
	rep(1:17, 1:17)  
	
	[1]  1  2  2  3  3  3  4  4  4  4  5  5  5  5  5  6  6  6  6  6  6  7  7  7  7  
	[26]  7  7  7  8  8  8  8  8  8  8  8  9  9  9  9  9  9  9  9  9 10 10 10 10 10  
	[51] 10 10 10 10 10 11 11 11 11 11 11 11 11 11 11 11 12 12 12 12 12 12 12 12 12  
	[76] 12 12 12 13 13 13 13 13 13 13 13 13 13 13 13 13 14 14 14 14 14 14 14 14 14  
	[101] 14 14 14 14 14 15 15 15 15 15 15 15 15 15 15 15 15 15 15 15 16 16 16 16 16  
	[126] 16 16 16 16 16 16 16 16 16 16 16 17 17 17 17 17 17 17 17 17 17 17 17 17 17  
	[151] 17 17 17  
	</pre>
	</details>
	
12. What will be the result of the following calculations?
	- `c(1, 3, 5) + c(2, 4, 6)`
	- `c(1, 3, 5) + c(2, 4, 6, 8)`
	- `c(1, 3) - c(2, 4, 6 ,8)`

13. Create two numeric vectors of length 4 and test run all the basic
	operators (as seen in the table earlier) with these two as
	arguments. Make sure you understand the output generated by R.
	
## Modify and subset vectors<a id="orgheadline6"></a>

Create a new character vector that contains the following words and save it using a suitable name:
apple, banana, orange, kiwi, potato
<details>
<summary>:key: Click to see how</summary>
<pre>
veggies <- c("apple", "banana", "orange", "kiwi", "potato")
</pre>
</details>
<br>

Do the following on your newly created vector.
	
1.  Select orange from the vector
	<details>
	<summary>:key: Click to see how</summary>
	<pre>
	veggies[3]  
	
	[1] "orange"  
	</pre>
	</details>
<br>
2.  Select all fruits from the vector
	<details>
	<summary>:key: Click to see how</summary>
	<pre>
	veggies[-5]  

	[1] "apple"  "banana" "orange" "kiwi"  

	veggies[1:4]  
	
	[1] "apple"  "banana" "orange" "kiwi"  
	</pre>
	</details>
<br>
3.  Do the same selection as in question 2 without using index positions
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
	veggies[veggies=="apple" | veggies == "banana" | veggies == "orange" | veggies == "kiwi"]  

	[1] "apple"  "banana" "orange" "kiwi"  

	veggies[veggies!="potato"]  
	
	[1] "apple"  "banana" "orange" "kiwi"  
	</pre>
	</details>
<br>
4.  Convert the character string to a numeric vector
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
    as.numeric(veggies)  
	
	[1] NA NA NA NA NA  
    Warning message:  
    NAs introduced by coercion  
	</pre>
	</details>
<br>
5.  Create a vector of logic values that can be used to extract every second value from your character vector
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
    selection <- c(FALSE, TRUE, FALSE, TRUE, FALSE)  
	veggies[selection]  
   	
	[1] "banana" "kiwi"  
	</pre>
	</details>
	<br>

	<details>
	<summary>:key: Alternative solution, why do this work?</summary>
	<pre>
    selection2 <- c(FALSE, TRUE)  
	veggies[selection2]  
	
	[1] "banana" "kiwi"  
	</pre>
	</details>
<br>

6.  Add the names a, b, o, k and p to the vector
	<details>
	<summary>:key: Click to see how</summary>
	<pre>
	names(veggies) <- c("a", "b", "o", "k", "p")  
	</pre>
	</details>
<br>
7.  Create a vector containing all the letters in the alphabet (NB! this
    can be done without having to type all letters). Google is your friend
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
    letters  
    
	[1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s"  
    [20] "t" "u" "v" "w" "x" "y" "z"  
	</pre>
	</details>
<br>
8.  Sample 30 values randomly with replacement from your letter vector and convert the character vector to factors. Which of the levels have most entries in the vector? 
	<details>
	<summary>:key: Click to see how</summary>
	<pre>
	letter.sample <- sample(letters, size = 30, replace = TRUE)  
	letter.sample <- factor(letter.sample)  
	summary(letter.sample)  
	
	a b c e g k l m n o q r t v w x z  
	3 1 2 1 3 1 1 1 3 1 2 2 1 3 2 1 2  
	</pre>
	</details>
<br>	
9.  Extract the letter 14 to 19 from the created vector
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
	letters[14:19]  
    
	[1] "n" "o" "p" "q" "r" "s"  
	</pre>
	</details>
<br>
10. Extract all but the last letter
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
	letters[1:length(letters)-1]  

	[1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s"  
	[20] "t" "u" "v" "w" "x" "y"  

	letters[-length(letters)]  
         
    [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s"  
	[20] "t" "u" "v" "w" "x" "y"  
	</pre>
	</details>
<br>
11. Which is the index position of the letter u in the vector?
	<details>
	<summary>:key: Click to see how</summary>
	<pre>
    which(letters=="u")  
   
    [1] 21  
	</pre>
	</details>
<br>
12. Create a new vector of length one that holds all the alphabet a single entry
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
    paste(letters, sep = "", collapse = "")  
	
	[1] "abcdefghijklmnopqrstuvwxyz"  
	</pre>
	</details>
<br>
13. Create a numeric vector by sampling 100 numbers from a normal
    distribution with mean 2 and standard deviation 4. Hint! Check the
    function rnorm() 
	<details> 
	<summary>:key: Click to see how</summary> 
	<pre>
    norm.rand <- rnorm(100, mean = 2, sd = 4)  
	</pre>
	</details>
<br>
14. How many of the generated values are negative? 
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
    length(norm.rand[norm.rand<0])  
    [1] 23  
	</pre>
	</details>
<br>
15. Calculate the standard deviation, mean, median of your random numbers
	<details>
	<summary>:key: Click to see how</summary>
	<pre>
    sd(norm.rand)  
    mean(norm.rand)  
	median(norm.rand)  
	
	[1] 3.541989  
	[1] 1.910667  
	[1] 1.631083  
	</pre>
	</details>
<br>

16. Replace the 11th value in your random number vector with NA and calculate the same summary statistics again
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
    norm.rand[11] <- NA  
    sd(norm.rand, na.rm = TRUE)  
    mean(norm.rand, na.rm = TRUE)  
	median(norm.rand, na.rm = TRUE)  
	
	[1] 3.553763  
	[1] 1.889685  
	[1] 1.62893  
	</pre>
	</details>
<br>
17. Replace the last position in the vector with the letter L and calculate the same summary statistics.
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
    norm.rand[100] <- "L"  
    sd(norm.rand, na.rm = TRUE)  
    mean(norm.rand, na.rm = TRUE)  
	median(norm.rand, na.rm = TRUE)  

	Warning message:  
	In var(if (is.vector(x) || is.factor(x)) x else as.double(x), na.rm = na.rm) :  
	NAs introduced by coercion  
	[1] NA  
	Warning message:  
	In mean.default(norm.rand, na.rm = TRUE) :  
	argument is not numeric or logical: returning NA  
    [1] NA  
	Warning message:  
	In mean.default(sort(x, partial = half + 0L:1L)[half + 0L:1L]) :  
	argument is not numeric or logical: returning NA  
	</pre>
	</details>
<br>

18. In many cases one has data from multiple replicates and different
    treatments in such cases it can be useful to have names of the type:
    Geno\_a\_1, Geno\_a\_2, Geno\_a\_3, Geno\_b\_1, Geno\_b\_2&#x2026;, Geno\_s\_3
    Try to create this such a vector without manually typing it all in.
    <details>
	<summary>:key: Click to see how</summary>
	<pre>
    geno <- rep("Geno", 57)  
    needed.letters <- rep(letters[1:19], 3)  
    needed.numbers <- rep(1:3, 19)  
    temp <- paste(geno, needed.letters, needed.numbers, sep = "_")  
    sort(temp)  
    [1] "Geno_a_1" "Geno_a_2" "Geno_a_3" "Geno_b_1" "Geno_b_2" "Geno_b_3"  
    [7] "Geno_c_1" "Geno_c_2" "Geno_c_3" "Geno_d_1" "Geno_d_2" "Geno_d_3"  
    [13] "Geno_e_1" "Geno_e_2" "Geno_e_3" "Geno_f_1" "Geno_f_2" "Geno_f_3"  
    [19] "Geno_g_1" "Geno_g_2" "Geno_g_3" "Geno_h_1" "Geno_h_2" "Geno_h_3"  
    [25] "Geno_i_1" "Geno_i_2" "Geno_i_3" "Geno_j_1" "Geno_j_2" "Geno_j_3"  
    [31] "Geno_k_1" "Geno_k_2" "Geno_k_3" "Geno_l_1" "Geno_l_2" "Geno_l_3"  
    [37] "Geno_m_1" "Geno_m_2" "Geno_m_3" "Geno_n_1" "Geno_n_2" "Geno_n_3"  
    [43] "Geno_o_1" "Geno_o_2" "Geno_o_3" "Geno_p_1" "Geno_p_2" "Geno_p_3"  
    [49] "Geno_q_1" "Geno_q_2" "Geno_q_3" "Geno_r_1" "Geno_r_2" "Geno_r_3"  
    [55] "Geno_s_1" "Geno_s_2" "Geno_s_3"  
	</pre>
	</details>
<br>

