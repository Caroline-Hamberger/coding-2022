## importing csv file into stata
import delimited caschool.csv

## aggregating data - number of districts by county
egen n_district = count(district), by(county)
sum n_district

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
  n_district |        420    14.93333    8.375458          1         29


## dropping empty observations
drop if calw_pct == .

 
## turning string into integer

describe county

Variable      Storage   Display    Value
    name         type    format    label      Variable label
--------------------------------------------------------------------------------------------------
county          str15   %15s                  


encode county, generate(county_int)


describe county_int

Variable      Storage   Display    Value
    name         type    format    label      Variable label
--------------------------------------------------------------------------------------------------
county_int      long    %15.0g     county_int


## OLS regression

reg math_scr teachers

      Source |       SS           df       MS      Number of obs   =       420
-------------+----------------------------------   F(1, 418)       =      4.42
       Model |  1542.16848         1  1542.16848   Prob > F        =    0.0361
    Residual |  145828.553       418  348.872137   R-squared       =    0.0105
-------------+----------------------------------   Adj R-squared   =    0.0081
       Total |  147370.722       419  351.720099   Root MSE        =    18.678

------------------------------------------------------------------------------
    math_scr | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
    teachers |  -.0102095   .0048559    -2.10   0.036    -.0197545   -.0006644
       _cons |   654.6603   1.106096   591.87   0.000     652.4861    656.8345
------------------------------------------------------------------------------


## making a graph (boxplot)
graph box math_scr


## installing stata package
ssc install outreg2
ssc install estout

## creating loops
. forvalues i = 1(1)10 {
  2. display `i'
  3. }
1
2
3
4
5
6
7
8
9
10


forvalues x = 1(1)4 {
  2. if mod(`x',2) {
  3. display "`x' is odd"
  4. continue
  5. }
  6. display "`x' is even"
  7. }
1 is odd
2 is even
3 is odd
4 is even


## analysing data (filtering observations & variables, and creating transformations)

. generate small = (enrl_tot<1000)

. sum small

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
       small |        420    .5142857    .5003919          0          1


. drop if enrl_tot < 1000
(216 observations deleted)

