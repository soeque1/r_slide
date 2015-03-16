---
title       : "R 강의"
subtitle    : "세번째 시간"
author      : "김형준"
job         : "Data Analyst"
framework   : io2012     # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets    : [mathjax]
#ext_widgets: {rCharts: [libraries/nvd3]}           # {mathjax, quiz,bootstra}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Contents

6. 분석예시
- WordCloud

---



```r
pre_processing<-function(data, start_line, end_line)
{
bodydata<-data[start_line:end_line]
bodydata<-gsub("<P align=justify></P>","",bodydata)
bodydata<-str_replace_all(bodydata, "[[:punct:]]|[a-zA-Z]|[\t+]", " ")
bodydata<-str_replace_all(bodydata, "[[:space:]][[:space:]]+", "")
bodydata<-bodydata[bodydata!=""&bodydata!=" "]
return(bodydata)
}
```

---


```r
wordcloud_proc<-function(bodydata)
{
nouns<-sapply(bodydata,extractNoun)
wordcount <- table(unlist(nouns))
wordcount <- wordcount[nchar(names(wordcount))!=1]
return(wordcount)
}
```

---



### 박근혜 대통령 취임사 전문 (한겨레)  
[source][http://www.hani.co.kr/arti/politics/politics_general/575390.htm]

![plot of chunk wordcloud2_1](assets/fig/wordcloud2_1.pdf) 

---

### 이명박 대통령 취임사 전문 (머니투데이)  
[source][http://stock.mt.co.kr/view/mtview.php?type=1&no=2008022510425323553]

![plot of chunk wordcloud2_2](assets/fig/wordcloud2_2.pdf) 

---

### 노무현 대통령 취임사 전문 (한겨레)  
[source][http://legacy.www.hani.co.kr/section-003000000/2003/02/003000000200302251026287.html]

![plot of chunk wordcloud2_3](assets/fig/wordcloud2_3.pdf) 

