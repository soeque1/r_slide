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

1. R 소개  
2. 기초 함수 및 변수 다루기  
3. 데이터 핸들링  

--- .class #id

### filter: Keep rows Matching Criteria


```r
suppressMessages(library(dplyr))
library(hflights)
flights <- tbl_df(hflights)
flights %>% filter(Month==1, DayofMonth==1)
```

```
## Source: local data frame [552 x 21]
## 
##    Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier FlightNum
## 1  2011     1          1         6    1400    1500            AA       428
## 2  2011     1          1         6     728     840            AA       460
## 3  2011     1          1         6    1631    1736            AA      1121
## 4  2011     1          1         6    1756    2112            AA      1294
## 5  2011     1          1         6    1012    1347            AA      1700
## 6  2011     1          1         6    1211    1325            AA      1820
## 7  2011     1          1         6     557     906            AA      1994
## 8  2011     1          1         6    1824    2106            AS       731
## 9  2011     1          1         6     654    1124            B6       620
## 10 2011     1          1         6    1639    2110            B6       622
## ..  ...   ...        ...       ...     ...     ...           ...       ...
## Variables not shown: TailNum (chr), ActualElapsedTime (int), AirTime
##   (int), ArrDelay (int), DepDelay (int), Origin (chr), Dest (chr),
##   Distance (int), TaxiIn (int), TaxiOut (int), Cancelled (int),
##   CancellationCode (chr), Diverted (int)
```

---

### select: Pick columns by name


```r
flights %>% select(DepTime, ArrTime, FlightNum)
```

### arrange: Reorder Rows


```r
flights %>% 
    select(UniqueCarrier, DepDelay) %>%
        arrange(DepDelay)
```

```
## Source: local data frame [227,496 x 2]
## 
##    UniqueCarrier DepDelay
## 1             OO      -33
## 2             MQ      -23
## 3             XE      -19
## 4             XE      -19
## 5             CO      -18
## 6             EV      -18
## 7             XE      -17
## 8             CO      -17
## 9             XE      -17
## 10            MQ      -17
## ..           ...      ...
```

---

### mutate: Add New Variables

```r
flights %>%
    group_by(Dest) %>%
    summarise(avg_delay = mean(ArrDelay, na.rm=TRUE))%>%slice(1:2)
```

```
## Source: local data frame [2 x 2]
## 
##   Dest avg_delay
## 1  ABQ     7.226
## 2  AEX     5.839
```

---
    

```r
a = flights %>%
    group_by(UniqueCarrier) %>%
    summarise(mean_Cancelled = mean(Cancelled),mean_Diverted = mean(Diverted))
a%>%slice(1:3)
```

```
## Source: local data frame [3 x 3]
## 
##   UniqueCarrier mean_Cancelled mean_Diverted
## 1            AA         0.0185      0.001850
## 2            AS         0.0000      0.002740
## 3            B6         0.0259      0.005755
```


```r
b = flights %>%
    group_by(UniqueCarrier) %>%
    summarise_each(funs(mean), Cancelled, Diverted)
colnames(a) = colnames(b)
all.equal(a,b)
```

```
## [1] TRUE
```
---
