---
layout: default
title:  'Matrices, data frames and lists'
---
# Matrices, data frames and lists
<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#orgheadline1">1. Introduction</a></li>
<li><a href="#orgheadline3">2. Matrices in R</a>
<ul>
<li><a href="#orgheadline2">2.1. Exercise: Working with matrices in R</a></li>
</ul>
</li>
<li><a href="#orgheadline5">3. Data frames</a>
<ul>
<li><a href="#orgheadline4">3.1. Exercise: Working with data frames</a></li>
</ul>
</li>
<li><a href="#orgheadline7">4. Lists</a>
<ul>
<li><a href="#orgheadline6">4.1. Exercise: Working with lists</a></li>
</ul>
</li>
</ul>
</div>
</div>


# Introduction<a id="orgheadline1"></a>

A data set that have more than one dimension is conceptually hard to
store as a vector. For two-dimensional data set the solution to this
is to instead use matrices or data frames. As with vectors all values
in a matrix has to be of the same type (eg. you can not mix for
example characters and numerics in the same matrix). For data frames
this is not a requirement and different columns can have different
modes, but all columns in a data frame have the same number of
entries. In addition to these R also have objects named lists that can
store any type of data set and are not restricted by types or dimensions.

In this exercise you will learn how to:
- Create and work with matrices, data frames and lists
- Perform basic math operator on matrices
- Use functions to summarize information from data frames
- Extract subsets of data from macrices, data frames and lists
- Create S3 object from a list


# Matrices in R<a id="orgheadline3"></a>

The command to create a matrix in R is `matrix()`. 
As input it takes a vector of values, the number of
rows and the number of columns.

    X <- matrix(1:12, nrow = 4, ncol = 3)
    X

        [,1] [,2] [,3]
    [1,]    1    5    9
    [2,]    2    6   10
    [3,]    3    7   11
    [4,]    4    8   12

Note that if one only specify the number of rows or columns the it
will infer the size of the matrix automatically using the size of
vector and the option given. The default way of filling the matrix is
column-wise, so the first values from the vector ends up in column 1
of the matrix. If you instead wants to fill the matrix row by row you
can set the byrow flag to TRUE.

    X <- matrix(1:12, nrow = 4, ncol = 3, byrow = TRUE)
    X

         [,1] [,2] [,3]
    [1,]    1    2    3
    [2,]    4    5    6
    [3,]    7    8    9
    [4,]   10   11   12

Subsetting a matrix is done the same way as for vectors, but you have
more than one dimension to work with. So you specify the rows and
column needed. 

    X[1,2]

    [1] 2

If one wants all values in a column or a row this can be specified by
leaving the other dimension empty, hence this code will print all
values in the second column.

    X[,2]

    [1]  2  5  8 11

Note that if the retrieved part of a matrix can be represented as a
vector (eg one of the dimension have the length 1) R will convert it
to a vector otherwise it will still be a matrix.

## Exercise: Working with matrices in R<a id="orgheadline2"></a>

Create a matrix containing 1:12 as shown for the matrix X above. 

1.  What is the length and the mode of the matrix?
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        mode(X)
        length(X)
    
        [1] "numeric"
        [1] 12
    </pre>
    </details>
<br>
2.  Use similar ideas as when you worked with vectors to extract all
    values in the matrix that is larger than 6
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        X[X>6]
    
        [1]  7 10  8 11  9 12
    
    </pre>
    </details>
<br>
3.  Shift places of column 1 and 3 in X
    <details>
    <summary>:key: Click to see how</summary>
    <pre>

        X[,c(3,2,1)]
    
             [,1] [,2] [,3]
        [1,]    3    2    1
        [2,]    6    5    4
        [3,]    9    8    7
        [4,]   12   11   10
    
    </pre>
    </details>
<br>
4.  Add a vector with three zeros as a fifth row to the matrix

    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        X.2 <- rbind(X, rep(0, 3))
        X.2
    
             [,1] [,2] [,3]
        [1,]    1    2    3
        [2,]    4    5    6
        [3,]    7    8    9
        [4,]   10   11   12
        [5,]    0    0    0
    </pre>
    </details>
<br>
5.  Replace all values the first two columns in your matrix with "NA".
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        X[,1:2] <- NA
        X
    
             [,1] [,2] [,3]
        [1,]   NA   NA    3
        [2,]   NA   NA    6
        [3,]   NA   NA    9
        [4,]   NA   NA   12
    </pre>
    </details>
<br>
6.  Replace all values in the matrix with 0 and convert it to a vector
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        X[] <- 0
        as.vector(X)
    
        [1] 0 0 0 0 0 0 0 0 0 0 0 0
    </pre>
    </details>
<br>
7.  In the the exercies earlier you created a vector with the names of
    the type Geno\_a\_1, Geno\_a\_2, Geno\_a\_3, Geno\_b\_1, Geno\_b\_2&#x2026;,
    Geno\_s\_3 using vectors. In todays lecture a function named outer
    that generate matrixes was mentioned. Try to generate the same
    vector as yesterday using this function instead. The outer function
    is very powerful, but can be hard to wrap you head around, so try
    to follow the logics, perhaps by creating a simple example to start
    with.
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        letnum <- outer(paste("Geno",letters[1:19], sep = "_"), 1:3, paste, sep = "_")
        class(letnum)
        sort(as.vector(letnum))
        #sort(paste("Geno", as.vector(letnum), sep = "_"))
    
        [1] "matrix"
        
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
8.  Create two different 2 by 2 matrices named A and B. A should
    contain the values 1 - 4 and B the values 5-8. Try out the
    following commands and by looking at the results see if you can
    figure out what is going on.  
    A. A \* B  
    B. A / B  
    C. A %x% B  
    D. A + B  
    E. A - B  
    F. A == B  
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        A <- matrix(1:4, ncol = 2, nrow = 2)
        B <- matrix(5:8, ncol = 2, nrow = 2)
        A

            [,1] [,2]
        [1,]    1    3
        [2,]    2    4
		
		B

            [,1] [,2]
        [1,]    5    7
        [2,]    6    8

        A * B
		
            [,1] [,2]
        [1,]    5   21
        [2,]   12   32

		A / B
		
                 [,1]      [,2]
        [1,] 0.2000000 0.4285714
        [2,] 0.3333333 0.5000000
		
		
        A %x% B
		
            [,1] [,2] [,3] [,4]
        [1,]    5    7   15   21
        [2,]    6    8   18   24
        [3,]   10   14   20   28
        [4,]   12   16   24   32
		
        A + B
		
            [,1] [,2]
        [1,]    6   10
        [2,]    8   12
		
        A - B
		
            [,1] [,2]
        [1,]   -4   -4
        [2,]   -4   -4
		
        A == B
		
             [,1]  [,2]
        [1,] FALSE FALSE
        [2,] FALSE FALSE
    
    </pre>
    </details>
<br>
9.  Generate a 10 by 10 matrix with random numbers. Add row and
    columnnames and calculate mean and median over rows and save these
    in a new matrix.  
    <details> <summary>:key: Click to see how</summary> 
    <pre>
    
        e <- rnorm(n = 100)
        E <- matrix(e, nrow = 10, ncol = 10)
        colnames(E) <- LETTERS[1:10]
        rownames(E) <- colnames(E)
        E.means <- rowMeans(E)
        E.medians <- apply(E, MARGIN = 1, median)
        E.mm <- rbind(E.means, E.medians)
        E.mm
    
                           A          B          C          D         E         F
        E.means   -0.01902767 0.01075332 -0.4137270 -0.1304978 0.2099126 0.2965743
        E.medians  0.53337938 0.18481261 -0.2248858 -0.1139851 0.3269634 0.2601974
                           G           H          I          J
        E.means   -0.6670421 -0.27378920 -0.1533350 -0.0437610
        E.medians -0.5247300 -0.09460231 -0.3547495 -0.2493248
    
    </pre>
    </details>
<br>

# Data frames<a id="orgheadline5"></a>

Even though vectors are at the very base of R usage, data frames are
central to R as the most common ways to import data into R
(read.table) will create a data frame. Even though a data frame can
itself contain another data frame, the by far, most common data frames
consists of a set of equally long vectors. As data frames can contain
several different data types the command `str()`
is very useful to run on data frames

    vector1 <- 1:10
    vector2 <- letters[1:10]
    vector3 <- rnorm(10, sd = 10)
    df <- data.frame(vector1, vector2, vector3)
    str(df)

    'data.frame':   10 obs. of  3 variables:
     $ vector1: int  1 2 3 4 5 6 7 8 9 10
     $ vector2: Factor w/ 10 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10
     $ vector3: num  8.463 0.905 -0.255 -6.59 3.369 ...

In the above example we can see that the data frame df contains 10
observations for three variables that all have different modes, column
1 is an integer vector, column 2 a vector with factors! and column
3 a numeric vector. It is noteworthy that the second column is a
factor even though we just gave it a character vector.

## Exercise: Working with data frames<a id="orgheadline4"></a>

1.  Use the built-in help in R to figure out what is going on with the
    second column in df data frame described above and modify the
    creation of the data frame so that the second column is stored as a
    character vector.  
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        df <- data.frame(vector1, vector2, vector3, stringsAsFactors = FALSE)
			str(df)
    
        'data.frame':   10 obs. of  3 variables:
         $ vector1: int  1 2 3 4 5 6 7 8 9 10
         $ vector2: chr  "a" "b" "c" "d" ...
         $ vector3: num  8.463 0.905 -0.255 -6.59 3.369 ...
    
    </pre>
    </details>
<br>
2.  One can select columns from a data frame using either the name or
    the position. Use both methods to print the last two columns from
    the df data frame.
    <details>
    <summary>:key: Click to see how</summary>
    <pre>   
    
        df[,2:3]
        df[,c("vector2", "vector3")]
    
           vector2     vector3
        1        a   8.4628687
        2        b   0.9046253
        3        c  -0.2549117
        4        d  -6.5902581
        5        e   3.3685362
        6        f  16.7773472
        7        g   9.3203649
        8        h -10.4333097
        9        i   2.9716131
        10       j   8.1402695
           vector2     vector3
        1        a   8.4628687
        2        b   0.9046253
        3        c  -0.2549117
        4        d  -6.5902581
        5        e   3.3685362
        6        f  16.7773472
        7        g   9.3203649
        8        h -10.4333097
        9        i   2.9716131
        10       j   8.1402695
    
    </pre>
    </details>
<br>
3.  Print all letters in the vector2 column of the data frame where the
    vector3 column has a positive value.
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        df[df$vector3>0,2]
        df$vector2[df$vector3>0]
    
        [1] "a" "b" "e" "f" "g" "i" "j"
        [1] "a" "b" "e" "f" "g" "i" "j"
    
    </pre>
    </details>
<br>
4.  Create a new vector combining the all columns of df seperated by a underscore.
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        paste(df$vector1, df$vector2, df$vector3, sep = "_")
    
         [1] "1_a_8.46286871843976"  "2_b_0.904625308313597" "3_c_-0.25491171338376"
         [4] "4_d_-6.59025808447186" "5_e_3.36853617579661"  "6_f_16.7773472039123" 
         [7] "7_g_9.32036493453533"  "8_h_-10.4333097064694" "9_i_2.97161306345798" 
        [10] "10_j_8.14026953369552"
    
    </pre>
    </details>
<br>
5.  There is a data frame of car information that comes with the base
    installation of R. Have a look at this data by typing `mtcars`.
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        mtcars
    
                             mpg cyl  disp  hp drat    wt  qsec vs am gear carb
        Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
        Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
        Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
        Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
        Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
        Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
        Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
        Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
        Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
        Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
        Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
        Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
        Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
        Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
        Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
        Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
        Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
        Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
        Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
        Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
        Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
        Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
        AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
        Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
        Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
        Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
        Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
        Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
        Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
        Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
        Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
        Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
    
    </pre>
    </details>
<br>
6.  Re-arrange the row names of this data frame and save as a vector.
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        car.names <- sample(row.names(mtcars))
    
    </pre>
    </details>
<br>
7.  Create a data frame containg the vector from the previous question
    and two vectors with random numbers named random1 and random2.
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        random1 <- rnorm(length(car.names))
        random2 <- rnorm(length(car.names))
        mtcars2 <- data.frame(car.names, random1, random2)
        mtcars2
    
                    car.names    random1      random2
        1        Toyota Corona  0.2672093  0.748625274
        2           Duster 360 -0.4127061 -0.289656962
        3    Hornet Sportabout -0.6291955  1.154517511
        4           Volvo 142E  1.4695465  1.822855299
        5         Lotus Europa -0.1088715 -0.688590021
        6       Hornet 4 Drive -0.4359612 -0.274399856
        7              Valiant -0.9114306 -0.552239587
        8          Merc 450SLC  0.1083370  0.212631221
        9            Fiat X1-9 -0.3422226 -1.991076826
        10  Cadillac Fleetwood  0.4657490  0.779438149
        11      Toyota Corolla  1.1136944 -0.949605064
        12       Mazda RX4 Wag -0.6442193 -0.353000665
        13        Ferrari Dino  0.7393240 -0.157842460
        14           Mazda RX4 -0.0431834  1.428955430
        15          Datsun 710  1.1788716 -0.056881290
        16            Merc 280  0.8434795 -1.676932154
        17            Fiat 128  0.5203762 -1.540330757
        18          Merc 450SE -0.6783654 -1.088913643
        19         Honda Civic  0.9413628 -0.689011222
        20       Porsche 914-2 -1.7112856 -0.279261819
        21    Pontiac Firebird  0.7238131  0.980874293
        22            Merc 230  0.4692142  0.417665142
        23       Maserati Bora -0.6522722  0.394803085
        24 Lincoln Continental  1.3341690 -0.008482409
        25   Chrysler Imperial -1.7568138  0.231171108
        26         AMC Javelin -0.3436457 -0.801661343
        27    Dodge Challenger  0.9847896  0.240541233
        28      Ford Pantera L  0.1812936 -2.391389388
        29          Camaro Z28  0.2731022 -0.562270119
        30           Merc 240D -1.3300011  0.941390495
        31           Merc 280C -0.1134380 -1.051899224
        32          Merc 450SL  1.0369179 -0.256698993
    </pre>
    </details>
<br>
8.  Now you have two data frames that both contains information on a
    set of cars. A collaborator asks you to create a new data frame
    with all this information combined. Create this
    merged data frame and make sure that it corresponds that is combined 
	in the correct way.
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        mt.merged <- merge(mtcars, mtcars2, by.x = "row.names", by.y = "car.names")
        mt.merged
    
                     Row.names  mpg cyl  disp  hp drat    wt  qsec vs am gear carb
        1          AMC Javelin 15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
        2   Cadillac Fleetwood 10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
        3           Camaro Z28 13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
        4    Chrysler Imperial 14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
        5           Datsun 710 22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
        6     Dodge Challenger 15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
        7           Duster 360 14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
        8         Ferrari Dino 19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
        9             Fiat 128 32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
        10           Fiat X1-9 27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
        11      Ford Pantera L 15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
        12         Honda Civic 30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
        13      Hornet 4 Drive 21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
        14   Hornet Sportabout 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
        15 Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
        16        Lotus Europa 30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
        17       Maserati Bora 15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
        18           Mazda RX4 21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
        19       Mazda RX4 Wag 21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
        20            Merc 230 22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
        21           Merc 240D 24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
        22            Merc 280 19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
        23           Merc 280C 17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
        24          Merc 450SE 16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
        25          Merc 450SL 17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
        26         Merc 450SLC 15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
        27    Pontiac Firebird 19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
        28       Porsche 914-2 26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
        29      Toyota Corolla 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
        30       Toyota Corona 21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
        31             Valiant 18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
        32          Volvo 142E 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2
              random1      random2
        1  -0.3436457 -0.801661343
        2   0.4657490  0.779438149
        3   0.2731022 -0.562270119
        4  -1.7568138  0.231171108
        5   1.1788716 -0.056881290
        6   0.9847896  0.240541233
        7  -0.4127061 -0.289656962
        8   0.7393240 -0.157842460
        9   0.5203762 -1.540330757
        10 -0.3422226 -1.991076826
        11  0.1812936 -2.391389388
        12  0.9413628 -0.689011222
        13 -0.4359612 -0.274399856
        14 -0.6291955  1.154517511
        15  1.3341690 -0.008482409
        16 -0.1088715 -0.688590021
        17 -0.6522722  0.394803085
        18 -0.0431834  1.428955430
        19 -0.6442193 -0.353000665
        20  0.4692142  0.417665142
        21 -1.3300011  0.941390495
        22  0.8434795 -1.676932154
        23 -0.1134380 -1.051899224
        24 -0.6783654 -1.088913643
        25  1.0369179 -0.256698993
        26  0.1083370  0.212631221
        27  0.7238131  0.980874293
        28 -1.7112856 -0.279261819
        29  1.1136944 -0.949605064
        30  0.2672093  0.748625274
        31 -0.9114306 -0.552239587
        32  1.4695465  1.822855299
    </pre>
    </details>
<br>
9.  Calculate the mean value for the two columns that you added to the
    mtcars data frame. 
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
  
        colMeans(mtcars2[, c("random1", "random2")])

            random1     random2 
         0.07930118 -0.19708361

    </pre>
    </details>

	Try to modify so you get the mean by cylinder
    number instead.
    <details>
    <summary>:key: Click to see how</summary>
    <pre>

		aggregate(mtcars2$random1,  by = list(mtcars$cyl), FUN = mean)
    
          Group.1          x
        1       4 0.02470902
        2       6 0.16250439
        3       8 0.08059342
    
          mtcars$cyl mtcars2$ex1
        1          4 -0.31758135
        2          6 -0.31712091
        3          8  0.01378375
    
    </pre>
    </details>
<br>

# Lists<a id="orgheadline7"></a>

The last data structure that we will explore are lists, which is a
very flexible structure. Lists can i R combine different data
structures and they do not have to be of equal dimensions or have
other restrictions. The drawback with a flexible structure is that it
requires a bit more work to interact with.

The syntax to create a list is similar to creation of the other data
structures in R. 

    l <- list(1, 2, 3)

As with the data frames the str() command is very useful for the
sometimes fairly complex lists instances.

    str(l)

    List of 3
     $ : num 1
     $ : num 2
     $ : num 3

This example containing only numeric vector is not very exciting
example given the flebility a list structure offers so lets create a
more complex example

    vec1 <- letters
    vec2 <- 1:4
    mat1 <- matrix(1:100, nrow = 5)
    df1 <- as.data.frame(cbind(10:1, 91:100))
    u.2 <- list(vec1, vec2, mat1, df1, l)

As you can see a list can not only contain other data structures, but
can also contain other lists.

Looking at the str command reveals much of the details of a list

    str(u.2)

    List of 5
     $ : chr [1:26] "a" "b" "c" "d" ...
     $ : int [1:4] 1 2 3 4
     $ : int [1:5, 1:20] 1 2 3 4 5 6 7 8 9 10 ...
     $ :'data.frame':       10 obs. of  2 variables:
      ..$ V1: int [1:10] 10 9 8 7 6 5 4 3 2 1
      ..$ V2: int [1:10] 91 92 93 94 95 96 97 98 99 100
     $ :List of 3
      ..$ : num 1
      ..$ : num 2
      ..$ : num 3

With this more complex object subsetting are slighty trickier than
with more the more homogenous objects we have looked at so far.

To look at the first entry of a list one can use the same syntax as
for the simplier structures, but note that this will give you a list
of length 1 irrespective of the actual type of data structure found.

    u.2[1]
    str(u.2[1])

    [[1]]
     [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s"
    [20] "t" "u" "v" "w" "x" "y" "z"
    List of 1
     $ : chr [1:26] "a" "b" "c" "d" ...

If one instead wants to extract the list entry as the structure that
is stored, one needs to "dig" deeper in the object.

    u.2[[1]]
    str(u.2[[1]])

     [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s"
    [20] "t" "u" "v" "w" "x" "y" "z"
     
    chr [1:26] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" ...

This means that the syntax to extract to exact specific value from a
data structure stored in a list can be daunting, examplified by
extracting the second column of the data fram stored at position 4 in
the list u.2.  

    u.2[[4]][,2]

    [1]  91  92  93  94  95  96  97  98  99 100

## Exercise: Working with lists<a id="orgheadline6"></a>

1.  Create a list containing 1 character vector, a numeric vector, a
    character matrix.
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        list.2 <- list(vec1 = c("hi", "ho", "merry", "christmas"), vec2 = 4:19, mat1 = matrix(as.character(100:81), nrow = 4))
        list.2
    
        $vec1
        [1] "hi"        "ho"        "merry"     "christmas"
        
        $vec2
         [1]  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19
        
        $mat1
             [,1] [,2] [,3] [,4] [,5]
        [1,]  100   96   92   88   84
        [2,]   99   95   91   87   83
        [3,]   98   94   90   86   82
        [4,]   97   93   89   85   81
    </pre>
    </details>
<br>
2.  Create a data fram and add this to the list.
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        df <- data.frame(letters, LETTERS, letters == LETTERS)
        list.2[[4]] <- df
    
    </pre>
    </details>
<br>
3.  Remove the the second entry of your list
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
		
        list.2[-2]
	
	$vec1
    [1] "hi"        "ho"        "merry"     "christmas"
    
    $mat1
         [,1] [,2] [,3] [,4] [,5]
    [1,]  100   96   92   88   84
    [2,]   99   95   91   87   83
    [3,]   98   94   90   86   82
    [4,]   97   93   89   85   81
    
    [[3]]
       letters LETTERS letters....LETTERS
    1        a       A              FALSE
    2        b       B              FALSE
    3        c       C              FALSE
    4        d       D              FALSE
    5        e       E              FALSE
    6        f       F              FALSE
    7        g       G              FALSE
    8        h       H              FALSE
    9        i       I              FALSE
    10       j       J              FALSE
    11       k       K              FALSE
    12       l       L              FALSE
    13       m       M              FALSE
    14       n       N              FALSE
    15       o       O              FALSE
    16       p       P              FALSE
    17       q       Q              FALSE
    18       r       R              FALSE
    19       s       S              FALSE
    20       t       T              FALSE
    21       u       U              FALSE
    22       v       V              FALSE
    23       w       W              FALSE
    24       x       X              FALSE
    25       y       Y              FALSE
    26       z       Z              FALSE
    </pre>
    </details>
<br>
4.  Create a new list that contain 20 entries, with each entry holding
    a numeric vector.
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        vec1 <- rnorm(1000)
        list.a <- split(vec1, 1:20)
    
    </pre>
    </details>
<br>
5.  How long is your list, and how long are each of the vectors
    that are part of the list?
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        length(list.a)
        lapply(list.a, FUN = "length")
    
        [1] 20
        $`1`
        [1] 50
        
        $`2`
        [1] 50
        
        $`3`
        [1] 50
        
        $`4`
        [1] 50
        
        $`5`
        [1] 50
        
        $`6`
        [1] 50
        
        $`7`
        [1] 50
        
        $`8`
        [1] 50
        
        $`9`
        [1] 50
        
        $`10`
        [1] 50
        
        $`11`
        [1] 50
        
        $`12`
        [1] 50
        
        $`13`
        [1] 50
        
        $`14`
        [1] 50
        
        $`15`
        [1] 50
        
        $`16`
        [1] 50
        
        $`17`
        [1] 50
        
        $`18`
        [1] 50
        
        $`19`
        [1] 50
        
        $`20`
        [1] 50
    </pre>
    </details>
<br>
6.  Figure out what the main differences are between the function
    lapply and sapply are and use both of them with the function
    summary on your newly created list.
    What are the pros and cons of the two approaches to calculate the
    same summary statistics?
    
    <details>
    <summary>:key: Click to see how</summary>
    <pre>
    
        lapply(X = list.a, FUN = "summary")
        sapply(X = list.a, FUN = "summary")
    
        $`1`
            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        -1.91700 -0.98430 -0.10330 -0.09407  0.64310  2.57300 
        
        $`2`
            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        -2.55600 -0.59190  0.06890  0.09146  0.98040  2.40500 
        
        $`3`
           Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        -1.7200 -0.2922  0.3422  0.4497  1.0440  3.4580 
        
        $`4`
            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        -1.65400 -0.77660 -0.06379  0.05182  0.68320  2.72800 
        
        $`5`
            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        -2.11200 -0.67370  0.09657  0.08760  0.78310  2.42000 
        
        $`6`
           Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        -2.3730 -1.1960 -0.1069 -0.1600  0.7839  2.5650 
        
        $`7`
            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        -2.08900 -0.84710 -0.31490 -0.25480  0.03034  1.86400 
        
        $`8`
            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        -3.13100 -0.74770  0.25510 -0.03403  0.75410  1.98000 
        
        $`9`
            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        -2.58600 -0.36920  0.02267  0.10700  0.48530  2.19900 
        
        $`10`
           Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        -2.0500 -1.0210 -0.4427 -0.2017  0.5982  2.4700 
        
        $`11`
            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        -2.00300 -0.65670 -0.02114  0.04536  0.54900  2.47800 
        
        $`12`
            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        -2.08200 -0.76080 -0.17120 -0.09029  0.36670  2.58100 
        
        $`13`
            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        -2.42300 -0.66920  0.02297 -0.01248  0.63560  2.35000 
        
        $`14`
            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        -2.18400 -0.99050 -0.06705 -0.18770  0.43920  2.40500 
        
        $`15`
             Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
        -2.194000 -0.638600  0.090650 -0.006298  0.599600  2.537000 
        
        $`16`
           Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        -1.9650 -0.8252 -0.1867 -0.1255  0.4426  2.4360 
        
        $`17`
           Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        -2.5890 -0.8900 -0.3218 -0.3507  0.3900  1.8250 
        
        $`18`
            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        -2.17500 -0.52770  0.05985 -0.07110  0.41190  1.66200 
        
        $`19`
            Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
        -2.42600 -0.65740  0.06455  0.02680  0.48520  2.75000 
        
        $`20`
           Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
        -2.5350 -0.4091  0.2411  0.1381  0.6583  2.7100
                       1        2       3        4        5       6        7        8
        Min.    -1.91700 -2.55600 -1.7200 -1.65400 -2.11200 -2.3730 -2.08900 -3.13100
        1st Qu. -0.98430 -0.59190 -0.2922 -0.77660 -0.67370 -1.1960 -0.84710 -0.74770
        Median  -0.10330  0.06890  0.3422 -0.06379  0.09657 -0.1069 -0.31490  0.25510
        Mean    -0.09407  0.09146  0.4497  0.05182  0.08760 -0.1600 -0.25480 -0.03403
        3rd Qu.  0.64310  0.98040  1.0440  0.68320  0.78310  0.7839  0.03034  0.75410
        Max.     2.57300  2.40500  3.4580  2.72800  2.42000  2.5650  1.86400  1.98000
                       9      10       11       12       13       14        15      16
        Min.    -2.58600 -2.0500 -2.00300 -2.08200 -2.42300 -2.18400 -2.194000 -1.9650
        1st Qu. -0.36920 -1.0210 -0.65670 -0.76080 -0.66920 -0.99050 -0.638600 -0.8252
        Median   0.02267 -0.4427 -0.02114 -0.17120  0.02297 -0.06705  0.090650 -0.1867
        Mean     0.10700 -0.2017  0.04536 -0.09029 -0.01248 -0.18770 -0.006298 -0.1255
        3rd Qu.  0.48530  0.5982  0.54900  0.36670  0.63560  0.43920  0.599600  0.4426
        Max.     2.19900  2.4700  2.47800  2.58100  2.35000  2.40500  2.537000  2.4360
                     17       18       19      20
        Min.    -2.5890 -2.17500 -2.42600 -2.5350
        1st Qu. -0.8900 -0.52770 -0.65740 -0.4091
        Median  -0.3218  0.05985  0.06455  0.2411
        Mean    -0.3507 -0.07110  0.02680  0.1381
        3rd Qu.  0.3900  0.41190  0.48520  0.6583
        Max.     1.8250  1.66200  2.75000  2.7100
    </pre>
    </details>
<br>

## Extra exercises
1. Design a S3 class that should hold information on human
   proteins. The data needed for each protein is:
   - The gene that encodes it
   - The molecular weight of the protein
   - The length of the protein sequence
   - Information on who and when it was discovered
   - Protein assay data
   
   Create this hypethetical S3 object in R.
   
2. Among the test data sets that are part of base R, there is one
   called iris. It contains measurements on set of plants. You can
   access the data using by typing iris in R. Explore this data set
   and calculate some useful summary statistics, like SD, mean and
   median for the parts of the data where this makes sense. Calculate
   the same statistics for any grouping that you can find in the data.
