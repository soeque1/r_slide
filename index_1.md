---
title       : "R 강의"
subtitle    : "첫번째 시간"
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

## R

* R 언어는 통계 <U>계산</U>과 <U>그래픽</U>을 위한 프로그래밍 언어  
* S-PLUS -> R (1997, GUN PROJECT)  

* 한계 : R’s biggest challenge is that most R users are not programmers  
* 극복 : Solving the “Two-Language” Problem  

### 설치 
 
* Install [R](http://www.r-project.org/)  
* Install the lastest version of [RStudio](http://rstudio.org/download/)  

---

## 적절한 code editor 고르기
예) R Studio
![alt text](rstudio.png)

---

## Introduction
    
- The "Comprehensive R Archive Network" (CRAN)  
is a collection of sites which carry identical material, consisting of the R distribution(s), the contributed extensions, documentation for R, and binaries.

### 장점  
- Freeware
- 대화식 프로그램
- 방대한 라이브러리
- 다양한 OS 지원 / Java, C, Fortran 프로그래밍 인터페이스
- 다양한 그래픽 지원

### 단점
- Freeware --> 저자 마음대로 input 설정
- 국내자료가 부족

---

## 기초연산 & 변수 다루기

func | |func| |
---------|----------|---------|----------
+ - * / ^    |  단순계산 |  |
sqrt(x)    | 제곱근 | ceiling(x) | 올림
floor(x) | 내림 | abs(x) | 절댓값
trunc(x) | 버림 | log(x) | 자연로그
round(x) | 반올림 | round(x,n) | 소수점 n 까지 반올림
factorial(n) | n! | choose(n,k) | nCk
예)

```r
factorial(3)
```

[1] 6

```r
round(25.233,1)
```

[1] 25.2

---

## 패키지(라이브러리)

```r
head(installed.packages())
```

```
##         Package  
## abind   "abind"  
## acepack "acepack"
## ACTCD   "ACTCD"  
## affy    "affy"   
## affyio  "affyio" 
## amap    "amap"   
##         LibPath                                                         
## abind   "/Library/Frameworks/R.framework/Versions/3.1/Resources/library"
## acepack "/Library/Frameworks/R.framework/Versions/3.1/Resources/library"
## ACTCD   "/Library/Frameworks/R.framework/Versions/3.1/Resources/library"
## affy    "/Library/Frameworks/R.framework/Versions/3.1/Resources/library"
## affyio  "/Library/Frameworks/R.framework/Versions/3.1/Resources/library"
## amap    "/Library/Frameworks/R.framework/Versions/3.1/Resources/library"
##         Version   Priority
## abind   "1.4-0"   NA      
## acepack "1.3-3.3" NA      
## ACTCD   "1.0-0"   NA      
## affy    "1.44.0"  NA      
## affyio  "1.34.0"  NA      
## amap    "0.8-12"  NA      
##         Depends                                                     
## abind   "R (>= 1.5.0)"                                              
## acepack NA                                                          
## ACTCD   "R (>= 2.15.1), R.methodsS3"                                
## affy    "R (>= 2.8.0), BiocGenerics (>= 0.1.12), Biobase (>= 2.5.5)"
## affyio  "R (>= 2.6.0)"                                              
## amap    "R (>= 2.10.0)"                                             
##         Imports                                                                                                   
## abind   NA                                                                                                        
## acepack NA                                                                                                        
## ACTCD   NA                                                                                                        
## affy    "affyio (>= 1.13.3), BiocInstaller, graphics, grDevices,\nmethods, preprocessCore, stats, utils, zlibbioc"
## affyio  "zlibbioc"                                                                                                
## amap    NA                                                                                                        
##         LinkingTo        Suggests                                      
## abind   NA               NA                                            
## acepack NA               NA                                            
## ACTCD   NA               NA                                            
## affy    "preprocessCore" "tkWidgets (>= 1.19.0), affydata, widgetTools"
## affyio  NA               NA                                            
## amap    NA               "Biobase"                                     
##         Enhances License              License_is_FOSS
## abind   NA       "LGPL (>= 2)"        NA             
## acepack NA       "MIT + file LICENSE" NA             
## ACTCD   NA       "GPL (>= 2)"         NA             
## affy    NA       "LGPL (>= 2.0)"      NA             
## affyio  NA       "LGPL (>= 2)"        NA             
## amap    NA       "GPL"                NA             
##         License_restricts_use OS_type MD5sum NeedsCompilation Built  
## abind   NA                    NA      NA     NA               "3.1.1"
## acepack NA                    NA      NA     "yes"            "3.1.0"
## ACTCD   NA                    NA      NA     "yes"            "3.1.1"
## affy    NA                    NA      NA     NA               "3.1.1"
## affyio  NA                    NA      NA     NA               "3.1.1"
## amap    NA                    NA      NA     "yes"            "3.1.0"
```

---
### 패키지 설치

```r
install.packages("dplyr")
```

```
## Error: trying to use CRAN without setting a mirror
```


```r
install.packages("dplyr", repos="http://cran.rstudio.com/")
```

### 패키지 정보  

[CRAN](https://www.google.co.kr/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=cran)  

[CRAN Pac. by names](http://cran.r-project.org/web/packages/available_packages_by_name.html)  
  
[CRAN Pac. by Tasks](http://cran.r-project.org/web/views/)  

---


## Help, RSiteSearch

RSiteSearch("sna")  
??sna  

---

## Data Handling

- 논리

```r
c(T,F,T)
```

[1]  TRUE FALSE  TRUE

- 숫자

```r
is.numeric(3);is.integer(3)
```

[1] TRUE
[1] FALSE

- 문자

```r
is.character("Kim");  is.character(c("Kim",3,5));  is.numeric(c("Kim",3,5))
```

[1] TRUE
[1] TRUE
[1] FALSE

---

## Data Handling
$$latex
\sqrt{2} \times \sqrt{2} \ne 2
$$


```r
sqrt(2) * sqrt(2) == 2
```

[1] FALSE


```r
3.55555666662314214
```

[1] 3.556

```r
3.55555666662314214 == 3.556; 3.55555666662314214 == 3.55555666662314214
```

[1] FALSE
[1] TRUE

---

## Data Handling


```r
options(digits=5);3.55555666662314214
```

[1] 3.5556

```r
options(digits=10);3.55555666662314214
```

[1] 3.555556667

- 구조
 * Matrix
 * Data.Frame
 * Data.Table
 * List

---



## Matrix

```r
x = matrix(NA, nrow=10, ncol=3)
x
```

```
##       [,1] [,2] [,3]
##  [1,]   NA   NA   NA
##  [2,]   NA   NA   NA
##  [3,]   NA   NA   NA
##  [4,]   NA   NA   NA
##  [5,]   NA   NA   NA
##  [6,]   NA   NA   NA
##  [7,]   NA   NA   NA
##  [8,]   NA   NA   NA
##  [9,]   NA   NA   NA
## [10,]   NA   NA   NA
```

---
x[1,3]=3; x[2,]=c(1,5,7); x[3,]=seq(1,3); x[4,]=1:3; x[5,]=rep(1,3)  
x[6,]=sep(5,1,by=-2);

### Missing-Handling
x[is.na(x)] = 0




```r
x
```

```
##       [,1] [,2] [,3]
##  [1,]    0    0    3
##  [2,]    1    5    7
##  [3,]    1    2    3
##  [4,]    1    2    3
##  [5,]    1    1    1
##  [6,]    5    3    1
##  [7,]    0    0    0
##  [8,]    0    0    0
##  [9,]    0    0    0
## [10,]    0    0    0
```

---

## Data.Frame


```r
data_ex = data.frame(height=c(168,182,175),weight=c(50,60,70),sex=c("여","남","남"))
data_ex
```

```
##   height weight sex
## 1    168     50  여
## 2    182     60  남
## 3    175     70  남
```

```r
data_ex$married = c(T,F,T)
data_ex[,"bmi"] = data_ex[,"height"]/data_ex[,"weight"]
data_ex
```

```
##   height weight sex married   bmi
## 1    168     50  여    TRUE 3.360
## 2    182     60  남   FALSE 3.033
## 3    175     70  남    TRUE 2.500
```

---
### 사용(X)

```r
attach (data_ex);height
```

```
## [1] 168 182 175
```

```r
detach(data_ex);height
```

```
## Error: object 'height' not found
```

### 사용(O)

```r
with(data_ex, height);subset(data_ex, height>180)
```

```
## [1] 168 182 175
```

```
##   height weight sex married   bmi
## 2    182     60  남   FALSE 3.033
```

---

### 사용 추천
library("dplyr")



```r
data_ex%>%filter(height>180)
```

```
##   height weight sex married   bmi
## 1    182     60  남   FALSE 3.033
```

### Big - Data

e.x) 미국 휴스턴에서 출발하는 모든 비행기의 2011년 이착륙기록  

library("hflights")  

```r
library("hflights")
dim(hflights)  
```

```
## [1] 227496     21
```

---


```r
library("hflights")
#hflights
#head(hflights)
hflights[1:3,1:5]
```

```
##      Year Month DayofMonth DayOfWeek DepTime
## 5424 2011     1          1         6    1400
## 5425 2011     1          2         7    1401
## 5426 2011     1          3         1    1352
```

```r
hflights_df = tbl_df(hflights)
hflights_df
```

```
## Source: local data frame [227,496 x 21]
## 
##    Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier FlightNum
## 1  2011     1          1         6    1400    1500            AA       428
## 2  2011     1          2         7    1401    1501            AA       428
## 3  2011     1          3         1    1352    1502            AA       428
## 4  2011     1          4         2    1403    1513            AA       428
## 5  2011     1          5         3    1405    1507            AA       428
## 6  2011     1          6         4    1359    1503            AA       428
## 7  2011     1          7         5    1359    1509            AA       428
## 8  2011     1          8         6    1355    1454            AA       428
## 9  2011     1          9         7    1443    1554            AA       428
## 10 2011     1         10         1    1443    1553            AA       428
## ..  ...   ...        ...       ...     ...     ...           ...       ...
## Variables not shown: TailNum (chr), ActualElapsedTime (int), AirTime
##   (int), ArrDelay (int), DepDelay (int), Origin (chr), Dest (chr),
##   Distance (int), TaxiIn (int), TaxiOut (int), Cancelled (int),
##   CancellationCode (chr), Diverted (int)
```

---
### Mean Func

```r
mean(hflights[,"DepTime"]);mean(hflights[,"DepTime"],na.rm=T)
```
---
### R Base VS dplyr

```r
hflights_df_rep<-rbind(hflights_df,hflights_df,hflights_df)
system.time(mean(as.data.frame(hflights_df_rep)[,"DepTime"],na.rm=T))
```

```
##    user  system elapsed 
##   0.030   0.004   0.034
```

```r
system.time(hflights_df_rep%>%select(DepTime)%>%dplyr::summarise(mean(DepTime,na.rm=T)))
```

```
##    user  system elapsed 
##   0.017   0.001   0.020
```

---

### rbind vs rbindlist


```r
system.time(rbind(hflights_df,hflights_df,hflights_df))
```

```
##    user  system elapsed 
##   0.520   0.151   0.734
```

```r
library("data.table")
system.time(rbindlist(list(hflights_df,hflights_df,hflights_df)))
```

```
##    user  system elapsed 
##   0.034   0.017   0.051
```

