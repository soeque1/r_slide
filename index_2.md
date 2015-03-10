---
title       : "R 강의"
subtitle    : "두번째 시간"
author      : "김형준"
job         : "Data Analyst"
fframework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets    : [mathjax]
#ext_widgets: {rCharts: [libraries/nvd3]}           # {mathjax, quiz,bootstra}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Contents

3. 데이터 핸들링
4. 기술 통계

--- .class #id

### 주의 사항

```r
a = 1:2; b = 3:5; c = 2:5
cbind(a,b)
```

```
## Warning: number of rows of result is not a multiple of vector length (arg
## 1)
```

```
##      a b
## [1,] 1 3
## [2,] 2 4
## [3,] 1 5
```

```r
rbind(a,c)
```

```
##   [,1] [,2] [,3] [,4]
## a    1    2    1    2
## c    2    3    4    5
```

---


```r
library("hflights")
dim(hflights)
```

```
## [1] 227496     21
```

```r
nrow(hflights)
```

```
## [1] 227496
```

```r
ncol(hflights)
```

```
## [1] 21
```

```r
colnames(hflights)
```

```
##  [1] "Year"              "Month"             "DayofMonth"       
##  [4] "DayOfWeek"         "DepTime"           "ArrTime"          
##  [7] "UniqueCarrier"     "FlightNum"         "TailNum"          
## [10] "ActualElapsedTime" "AirTime"           "ArrDelay"         
## [13] "DepDelay"          "Origin"            "Dest"             
## [16] "Distance"          "TaxiIn"            "TaxiOut"          
## [19] "Cancelled"         "CancellationCode"  "Diverted"
```

```r
head(rownames(hflights))
```

```
## [1] "5424" "5425" "5426" "5427" "5428" "5429"
```

```r
range(rownames(hflights))
```

```
## [1] "1000274" "999899"
```

---
    

