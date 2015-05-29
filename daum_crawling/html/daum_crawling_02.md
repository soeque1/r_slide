---
title       : "텍스트에서 여론과 감정을 발견하기"
subtitle    : "Using R"
author      : "김형준"
job         : "Data Analyst : (주) 퀀트랩"
biglogo     : logo_01.png
logo        : logo_03.png
license     : by-nc-sa
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
widgets     : []            # {mathjax, bootstrap, quiz}
mode        : selfcontained
hitheme     : tomorrow      # {tomorrow, tomorrow_night, solarized_dark, solarized_light}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
knit        : slidify::knit2slides
---

<center><img src="assets/img/quantlab.png" height=600px width=800px></center>

--- .new-background

## 워크숍 관련 온라인 사이트

http://course.mindscale.kr/course/text-analysis

<left><img src="assets/img/intro2.png" height=450px width=600px></left>

--- .new-background


## 영화 자료를 이용한 다양한 분석

<h3>Topics</h3>
* 주제(topic) 분류 - Text & Self-Rating   
* 개인별 영화 추천 - Text & Self-Rating   
* <font color="red">감정 분석 - Text </font> & Self-Rating

<h3> Method </h3>
* <font color="red"> Visualization</font>  
* Prediction  

<h3> Model </h3>
* Lasso LM / LSA / LDA / Deep Learning  

--- &twocol w1:50% w2:50% .new-background

## 분석 예시 - Text

*** =left
<center><img src="assets/img/before_imitation.png" height="500" width="500"></center>

*** =right
<center><img src="assets/img/after_imitation.png" height="500" width="500"></center>

--- .new-background

## 분석 예시 - Self-Rating

<center><img src="assets/img/foulball.png" height="600" width="650"></center>

--- .new-background

## 분석 예시 - Self-Rating & Text

<center><img src="assets/img/sentiment.png" height="600" width="650"></center>

--- &twocol w1:40% w2:60% .new-background

## Think!!

*** =left
<h4><br></h4>

*** =right
<center><img src="assets/img/result_graph.png" height="500" width="600"></center>

--- &twocol w1:40% w2:60% .new-background

## 목차

*** =left
<h4><br></h4>
<h3 style="text-align:left">1. R 기초 세팅</h3>
<h3 style="text-align:left">2. 패키지 인스톨</h3>    
<h3 style="text-align:left">3. 어벤져스 웹크롤</h3>  
<h3 style="text-align:left">4. 키워드 파싱 및 추출</h3>  
<h3 style="text-align:left">5. Co-occurrence Matrix</h3>  
<h3 style="text-align:left">6. 감정사전 불러오기</h3>  
<h3 style="text-align:left">7. 시각화</h3>  

*** =right
<center><img src="assets/img/result_graph.png" height="500" width="600"></center>

--- .new-background

<center><img src="assets/img/system.png" height="600" width="700"></center>

--- .dark .segue .nobackground

## 1. R 기초 세팅

--- .new-background

## 1. R 기초 세팅

<h3b><font color="blue"><b> 학습 목표 </b></font></h3b>  
<h3b> - R에서 작업 디렉토리 설정하기</h3b>  
<h3b> - MAC의 경우 그래픽 설정하기</h3b>

--- .new-background

## 1. R 기초 세팅

### Session -> Set Working Directory -> Choose Directory

- MAC


```r
par(family="AppleGothic")  ##  그림 출력시 한글폰트
```

```

--- .dark .segue .nobackground
## 2. 패키지 인스톨

--- .new-background

## 2. 패키지 인스톨

<h3b><font color="blue"><b> 학습 목표 </b></font></h3b>  
<h3b> - 패키지 인스톨</h3b>  
<h3b> - 패키지 불러오기</h3b>

--- .new-background .modal

## 2. 패키지 인스톨

<h4></br></h4>
<h4></br></h4>

<h4>영화 웹크롤 및 파싱</h4>
* [rvest](http://cran.r-project.org/web/packages/rvest/index.html)  
* [stringr](http://cran.r-project.org/web/packages/stringr/index.html)  

<h4></br></h4>
<h4></br></h4>

<h4>감정 사전 </h4>
<!-- * [readxl](http://cran.r-project.org/web/packages/readxl/index.html)  -->
* [한국어 감정 사전 1](http://word.snu.ac.kr/kosac/)  
* [한국어 감정 사전 2](http://clab.snu.ac.kr/arssa/doku.php?id=app_dict_1.0)  
* [참고 논문 모음 1](http://word.snu.ac.kr/kosac/publications.php)  
* [참고 논문 모음 2](http://clab.snu.ac.kr/arssa/doku.php?id=my_works)  

--- .new-background

## 2. 패키지 인스톨

<h4></br></h4>
<h4></br></h4>

<h4>텍스트 분석</h4>
* [dplyr](http://cran.r-project.org/web/packages/dplyr/index.html)  
* [KoNLP](http://cran.r-project.org/web/packages/KoNLP/index.html)  
* [tm](http://cran.r-project.org/web/packages/tm/index.html)  

<h4></br></h4>
<h4></br></h4>

<h4>네트워크 그래프</h4>
* [qgraph](http://cran.r-project.org/web/packages/qgraph/index.html)  

--- .new-background

## 2. 패키지 인스톨


```r
install.packages(c("rvest","stringr","dplyr","tm","qgraph", "KoNLP"),
                 repos="http://cran.nexr.com")
```

<h4><br></h4>
<h9>패키지 불러오기</h9>


```r
library(httr)
library(rvest)
library(stringr)
library(plyr)
library(tm)
library(qgraph)
library(KoNLP)
```

--- .dark .segue .nobackground

## 3. 어벤져스 웹크롤

--- .new-background

## 3. 어벤져스 웹크롤

<h3b><font color="blue"><b> 학습 목표 </b></font></h3b>  
<!--<h3b> - 웹사이트 배경지식</h3b>  -->
<!-- <h3b> - Regualr Expression (REGEX)</h3b> -->
<h3b> - 단일 페이지 웹크롤</h3b>  
<h3b> - 복수 페이지 웹크롤</h3b>  

--- .new-background

## 다음 영화

http://movie.daum.net

<left><img src="assets/img/daum_movie.png" height="550" width="550"></left>

--- .new-background

## 소스코드

<left><img src="assets/img/source.png" height="650" width="750"></left>

--- .new-background

## 요소점검

<left><img src="assets/img/source2.png" height="650" width="750"></left>

--- .new-background .modal

## 어벤져스 (1 페이지 웹크롤)


```r
url <- "http://movie.daum.net/moviedetail/moviedetailNetizenPoint.do?movieId=73750&searchType=all&type=after&page=1"
htxt <- html(url)
```

--- .new-background .modal

## 어벤져스 (1 페이지 웹크롤)




```r
review <- html_nodes(htxt, "span.comment.article")
review
```

```
## [[1]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1818943&amp;type=after" title="댓글달기"> 나름 괜찬았는데 뭐.. 그나저나, 마지막에 인피니티 건틀렛 타노스.,, 3에서 저거 무슨 억지로 잡을라고... 은하계 쉽게 파괴하는 애한테 무슨,, 룬킹토르라도 나올거냐.. 마블 좀 알고 있는 사람들이라면 인건 타노스 잡는거는 불가능하다는거는 알텐데..                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## [[2]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1818928&amp;type=after" title="댓글달기">1편보다 나은2편은없다
## 천만이아깝다                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## [[3]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1818913&amp;type=after" title="댓글달기">1편에서 밑밥을 많이 깔길래 2편은 전개를 할 줄 알았는데 2편에서도 또 중얼중얼.. 감독 바뀔 때마다 캐릭터 설정에 상영시간 할애 할건가? 잡다하게 드라마 넣을 시간은 있어도 왜 울트론을 만들어야 하는지에 대한 개연성을 살려줄 로키분량은 왜 삭제했는지 모르겠다.                     <span class="em b">[1]</span>
##                     <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## [[4]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1818884&amp;type=after" title="댓글달기">어벤져스는 끝났다. 희망은 없다!......
## 
## 
## 라고 포스터 밑에 적혀있는 카피가 영화의 운명을 말해주는 듯...                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## [[5]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1818878&amp;type=after" title="댓글달기">사공이 많아서 배가 산으로 간 느낌??                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## [[6]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1818711&amp;type=after" title="댓글달기">흠...평점이 이해가 잘 안되네...액션 히어로물이라는 관점에서 보면 충분히 잘만들어진 액션오락영화가 맞음...난 평가라는건 상대적인 개념으로 봐야한다고 생각하는데...유일한 단점이라면 개별히어로 작품들을 안보면 이해가 어려운 부분이 많다는거...그거 감안해서 8점 드림                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## [[7]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1818556&amp;type=after" title="댓글달기">&lt;솔직 평점&gt; 역시 마블은 기대에 부흥하는 영화를 만듭니다. 그러나 1편에비해 박진감이전혀없는 전투씬들은 아쉬움으로 남았습니다.                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## [[8]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817876&amp;type=after" title="댓글달기">이런거 왜 만들었죠? 딱 봐도 10점 드릴께 뻔한데 ㅋㅋ 중간에 심심하지 않게 유머감도 있고 등장인물을 널리 알리기에도 좋은것 같아요 ㅎ 어벤져스 등장인물들 사랑해요♥♡                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## [[9]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817875&amp;type=after" title="댓글달기">ㅎㅎㅎㅎㅎㅎㅎ보고나서 "역시 마블은 다르구나."라고 생각 들었습니다 ㅎㅎ 너무 만족했습니다 ㅎㅎ 평점 10보다 더 드리고 싶은뎅...ㅎㅎ                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## [[10]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817874&amp;type=after" title="댓글달기">너무나 재밌었던 최고적인 영화입니다~~ㅎㅎ                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## [[11]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817872&amp;type=after" title="댓글달기">마블 시리즈는 항상 볼거리 하나로 대만족 ㅎㅎ                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## [[12]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817853&amp;type=after" title="댓글달기">이제 거품 다 빠졌다... 0점이나 드삼~                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## [[13]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817852&amp;type=after" title="댓글달기">1편보다는 훨 나았지만 역시 히어로물은 저하곤 맞질 않네요..뭐, 액션도, CG도 그리 인상 깊지 않았구요, 황진미 평론가 말처럼 그냥 잡탕밥 같아요.. 6.1                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## [[14]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817794&amp;type=after" title="댓글달기">아마 원작 마블처럼 얘기를 똑같이 따라 했다면 이미 다 아는 스토리 누가 큰 기대감을 가지고 봤을까 SF라 하면 어벤져스2를 위한 장르 아닌가 싶을정도로 재밌었어요 간간히 개그멘트도 좋았구요 아주 재밌고 좋았습니다.                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## [[15]]
## <span class="comment article">
## 					
## 										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817423&amp;type=after" title="댓글달기">마블 시네마틱 유니버스를 대강만이라도 알고 있다면 재밌겠지만&#13;
## 그렇지 않다면 너무도 불친절한 영화인듯..                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>
## 
## 					</span> 
## 
## attr(,"class")
## [1] "XMLNodeSet"
```

--- .new-background

## 어벤져스 (1 페이지 웹크롤)


```r
review <- html_nodes(review, "a")
review
```

[[1]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1818943&amp;type=after" title="댓글달기"> 나름 괜찬았는데 뭐.. 그나저나, 마지막에 인피니티 건틀렛 타노스.,, 3에서 저거 무슨 억지로 잡을라고... 은하계 쉽게 파괴하는 애한테 무슨,, 룬킹토르라도 나올거냐.. 마블 좀 알고 있는 사람들이라면 인건 타노스 잡는거는 불가능하다는거는 알텐데..                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[2]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1818928&amp;type=after" title="댓글달기">1편보다 나은2편은없다
천만이아깝다                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[3]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1818913&amp;type=after" title="댓글달기">1편에서 밑밥을 많이 깔길래 2편은 전개를 할 줄 알았는데 2편에서도 또 중얼중얼.. 감독 바뀔 때마다 캐릭터 설정에 상영시간 할애 할건가? 잡다하게 드라마 넣을 시간은 있어도 왜 울트론을 만들어야 하는지에 대한 개연성을 살려줄 로키분량은 왜 삭제했는지 모르겠다.                     <span class="em b">[1]</span>
                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[4]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1818884&amp;type=after" title="댓글달기">어벤져스는 끝났다. 희망은 없다!......


라고 포스터 밑에 적혀있는 카피가 영화의 운명을 말해주는 듯...                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[5]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1818878&amp;type=after" title="댓글달기">사공이 많아서 배가 산으로 간 느낌??                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[6]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1818711&amp;type=after" title="댓글달기">흠...평점이 이해가 잘 안되네...액션 히어로물이라는 관점에서 보면 충분히 잘만들어진 액션오락영화가 맞음...난 평가라는건 상대적인 개념으로 봐야한다고 생각하는데...유일한 단점이라면 개별히어로 작품들을 안보면 이해가 어려운 부분이 많다는거...그거 감안해서 8점 드림                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[7]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1818556&amp;type=after" title="댓글달기">&lt;솔직 평점&gt; 역시 마블은 기대에 부흥하는 영화를 만듭니다. 그러나 1편에비해 박진감이전혀없는 전투씬들은 아쉬움으로 남았습니다.                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[8]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817876&amp;type=after" title="댓글달기">이런거 왜 만들었죠? 딱 봐도 10점 드릴께 뻔한데 ㅋㅋ 중간에 심심하지 않게 유머감도 있고 등장인물을 널리 알리기에도 좋은것 같아요 ㅎ 어벤져스 등장인물들 사랑해요♥♡                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[9]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817875&amp;type=after" title="댓글달기">ㅎㅎㅎㅎㅎㅎㅎ보고나서 "역시 마블은 다르구나."라고 생각 들었습니다 ㅎㅎ 너무 만족했습니다 ㅎㅎ 평점 10보다 더 드리고 싶은뎅...ㅎㅎ                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[10]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817874&amp;type=after" title="댓글달기">너무나 재밌었던 최고적인 영화입니다~~ㅎㅎ                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[11]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817872&amp;type=after" title="댓글달기">마블 시리즈는 항상 볼거리 하나로 대만족 ㅎㅎ                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[12]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817853&amp;type=after" title="댓글달기">이제 거품 다 빠졌다... 0점이나 드삼~                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[13]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817852&amp;type=after" title="댓글달기">1편보다는 훨 나았지만 역시 히어로물은 저하곤 맞질 않네요..뭐, 액션도, CG도 그리 인상 깊지 않았구요, 황진미 평론가 말처럼 그냥 잡탕밥 같아요.. 6.1                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[14]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817794&amp;type=after" title="댓글달기">아마 원작 마블처럼 얘기를 똑같이 따라 했다면 이미 다 아는 스토리 누가 큰 기대감을 가지고 봤을까 SF라 하면 어벤져스2를 위한 장르 아닌가 싶을정도로 재밌었어요 간간히 개그멘트도 좋았구요 아주 재밌고 좋았습니다.                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[15]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1817423&amp;type=after" title="댓글달기">마블 시네마틱 유니버스를 대강만이라도 알고 있다면 재밌겠지만&#13;
그렇지 않다면 너무도 불친절한 영화인듯..                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

attr(,"class")
[1] "XMLNodeSet"

--- .new-background 

## 어벤져스 (1 페이지 웹크롤)


```r
review <- html_text(review)
review
```

 [1] " 나름 괜찬았는데 뭐.. 그나저나, 마지막에 인피니티 건틀렛 타노스.,, 3에서 저거 무슨 억지로 잡을라고... 은하계 쉽게 파괴하는 애한테 무슨,, 룬킹토르라도 나올거냐.. 마블 좀 알고 있는 사람들이라면 인건 타노스 잡는거는 불가능하다는거는 알텐데..                    "                                        
 [2] "1편보다 나은2편은없다\n천만이아깝다                    "                                                                                                                                                                                                                                                   
 [3] "1편에서 밑밥을 많이 깔길래 2편은 전개를 할 줄 알았는데 2편에서도 또 중얼중얼.. 감독 바뀔 때마다 캐릭터 설정에 상영시간 할애 할건가? 잡다하게 드라마 넣을 시간은 있어도 왜 울트론을 만들어야 하는지에 대한 개연성을 살려줄 로키분량은 왜 삭제했는지 모르겠다.                     [1]\n                    "
 [4] "어벤져스는 끝났다. 희망은 없다!......\n\n\n라고 포스터 밑에 적혀있는 카피가 영화의 운명을 말해주는 듯...                    "                                                                                                                                                                              
 [5] "사공이 많아서 배가 산으로 간 느낌??                    "                                                                                                                                                                                                                                                   
 [6] "흠...평점이 이해가 잘 안되네...액션 히어로물이라는 관점에서 보면 충분히 잘만들어진 액션오락영화가 맞음...난 평가라는건 상대적인 개념으로 봐야한다고 생각하는데...유일한 단점이라면 개별히어로 작품들을 안보면 이해가 어려운 부분이 많다는거...그거 감안해서 8점 드림                    "                  
 [7] "<솔직 평점> 역시 마블은 기대에 부흥하는 영화를 만듭니다. 그러나 1편에비해 박진감이전혀없는 전투씬들은 아쉬움으로 남았습니다.                    "                                                                                                                                                          
 [8] "이런거 왜 만들었죠? 딱 봐도 10점 드릴께 뻔한데 ㅋㅋ 중간에 심심하지 않게 유머감도 있고 등장인물을 널리 알리기에도 좋은것 같아요 ㅎ 어벤져스 등장인물들 사랑해요♥♡                    "                                                                                                                     
 [9] "ㅎㅎㅎㅎㅎㅎㅎ보고나서 \"역시 마블은 다르구나.\"라고 생각 들었습니다 ㅎㅎ 너무 만족했습니다 ㅎㅎ 평점 10보다 더 드리고 싶은뎅...ㅎㅎ                    "                                                                                                                                                  
[10] "너무나 재밌었던 최고적인 영화입니다~~ㅎㅎ                    "                                                                                                                                                                                                                                             
[11] "마블 시리즈는 항상 볼거리 하나로 대만족 ㅎㅎ                    "                                                                                                                                                                                                                                          
[12] "이제 거품 다 빠졌다... 0점이나 드삼~                    "                                                                                                                                                                                                                                                  
[13] "1편보다는 훨 나았지만 역시 히어로물은 저하곤 맞질 않네요..뭐, 액션도, CG도 그리 인상 깊지 않았구요, 황진미 평론가 말처럼 그냥 잡탕밥 같아요.. 6.1                    "                                                                                                                                     
[14] "아마 원작 마블처럼 얘기를 똑같이 따라 했다면 이미 다 아는 스토리 누가 큰 기대감을 가지고 봤을까 SF라 하면 어벤져스2를 위한 장르 아닌가 싶을정도로 재밌었어요 간간히 개그멘트도 좋았구요 아주 재밌고 좋았습니다.                    "                                                                       
[15] "마블 시네마틱 유니버스를 대강만이라도 알고 있다면 재밌겠지만\r\n그렇지 않다면 너무도 불친절한 영화인듯..                    "                                                                                                                                                                              

--- .new-background

## 어벤져스 (1 페이지 웹크롤)


```r
url <- "http://movie.daum.net/moviedetail/moviedetailNetizenPoint.do?movieId=73750&searchType=all&type=after&page=1"
htxt <- html(url)
review <- html_nodes(htxt, "span.comment.article")
review <- html_nodes(review, "a")
review <- html_text(review)
length(review)
```

```
## [1] 15
```

--- .new-background .modal

## 어벤져스 전체 페이지 웹크롤


```r
all.reviews <- c()

for (page_num in 1:1000)
{
urls_view <- 
paste("http://movie.daum.net/moviedetail/moviedetailNetizenPoint.do?movieId=73750&searchType=all&type=after&page=",
page_num,sep="")
htxt <- html(urls_view)

review <-  html_nodes(htxt, "span.comment.article")
review <-  html_nodes(review, "a")
review <-  html_text(review)

if(length(review)==0) break;

all.reviews <- c(all.reviews, review)
print(paste(page_num, "-th page", sep=""))    
}
```

--- .dark .segue .nobackground

## 4. 키워드 파싱 및 추출

--- .new-background

## 4. 키워드 파싱 및 추출

<h3b><font color="blue"><b> 학습 목표 </b></font></h3b>  

<h3b> - R에서 자연어 처리 문제</h3b>  

<h3b> - 키워드 추출 방법 I (KoNLP - ExtracNoun)</h3b>

<h3b> - 키워드 추출 방법 II (KoNLP - POStagging)</h3b>  

<!-- <h3b> - 키워드 추출 방법 III (앞 두 글자 자르기) - APPENDIX III </h3b> -->

--- .new-background

## R에서 자연어 처리 (KoNLP)

<font color="red">기대</font>했던 것보다 좀 <font color="red">지루</font>했음... 와이프는 
<font color="red">재미있다</font>고...


```r
library("KoNLP")
extractNoun("기대했던 것보다 좀 지루했음... 와이프는 재미있다고...")
```

```
## [1] "것"     "지루"   "와이프"
```




```r
split_12("기대했던 것보다 좀 지루했음... 와이프는 재미있다고...")
```

```
## [1] "기대" "것보" "좀"   "지루" "와이" "재미"
```




```r
extractNounVerbAdj("기대했던 것보다 좀 지루했음... 와이프는 재미있다고...")
```

```
## [[1]]
## [1] ""       "기대"   "하"     "것"     "지루"   "와이프" "재미있" ""
```

--- .dark .segue .nobackground

## 5. Co-occurrence Matrix

--- .new-background

## 5. Co-occurrence Matrix

<h3b><font color="blue"><b> 학습 목표 </b></font></h3b>  
<h3b> - Term x Document Matrix</h3b>  
<h3b> - Co-occurrence Matrix</h3b>

--- .new-background

## Term x Document Matrix

* 행(row)은 Term(단어들), 열(col)은 Document(개인들)로 이루어진 Matrix
* 단어에 대하여 Weight
* 문서 내 단어에 대하여 Weight 
* 모형에 따라 다양한 방식으로 처리


```r
library(tm)
library(KoNLP)
library(plyr)
```

--- .new-background


```r
ko.words <- function(doc){
  d <- as.character(doc)
  keyword <- extractNoun(d)
  keyword <- revalue(keyword, c("재밌" = "재미",
                                "재밋" = "재미",
                                "잼있" = "재미",
                                "영화" = "어벤져스"),
                     warn_missing = F)
  keyword
}
```

--- .new-background

## Term x Document Matrix






```r
cps <- Corpus(VectorSource(all.reviews))
```

--- .new-background

## Term x Document Matrix




```r
options(mc.cores=1)
tdm <- TermDocumentMatrix(cps,
                          control=list(
                          tokenize=ko.words,
                          weighting=weightBin))
```

--- .new-background .modal

## Term x Document Matrix


```r
rownames(tdm)[rownames(tdm)=="어벤져스"]
```

```
## [1] "어벤져스"
```

```r
rownames(tdm)[rownames(tdm)=="헐크"]
```

```
## character(0)
```

```r
rownames(tdm)[rownames(tdm)=="등등"]
```

```
## character(0)
```

```r
rownames(tdm)[rownames(tdm)=="ㅡ.ㅡ"]
```

```
## [1] "ㅡ.ㅡ"
```

--- .new-background

## Term x Document Matrix


```r
?TermDocumentMatrix
?TermFreq
```

--- .new-background

## Term x Document Matrix





```r
options(mc.cores=1)
tdm <- TermDocumentMatrix(cps,
                          control=list(
                          tokenize=ko.words,    
                          wordLengths=c(2,Inf),
                          weighting=weightBin))
```

--- .new-background .modal

## Term x Document Matrix


```r
rownames(tdm)[rownames(tdm)=="어벤져스"]
```

```
## [1] "어벤져스"
```

```r
rownames(tdm)[rownames(tdm)=="헐크"]
```

```
## [1] "헐크"
```

```r
rownames(tdm)[rownames(tdm)=="등등"]
```

```
## [1] "등등"
```

```r
rownames(tdm)[rownames(tdm)=="ㅡ.ㅡ"]
```

```
## [1] "ㅡ.ㅡ"
```

--- .new-background

## Term x Document Matrix


```r
options(mc.cores=1)
tdm <- TermDocumentMatrix(cps,
                          control=list(
                          tokenize=ko.words,    
                          wordLengths=c(2,Inf),
                          weighting=weightBin,
                          removePunctuation=T))
```

--- .new-background .modal

## Term x Document Matrix


```r
rownames(tdm)[rownames(tdm)=="어벤져스"]
```

```
## [1] "어벤져스"
```

```r
rownames(tdm)[rownames(tdm)=="헐크"]
```

```
## [1] "헐크"
```

```r
rownames(tdm)[rownames(tdm)=="등등"]
```

```
## [1] "등등"
```

```r
rownames(tdm)[rownames(tdm)=="ㅡ.ㅡ"]
```

```
## character(0)
```

--- .new-background

## 불필요 단어제거


```r
stopwords()
```

```
##   [1] "i"          "me"         "my"         "myself"     "we"        
##   [6] "our"        "ours"       "ourselves"  "you"        "your"      
##  [11] "yours"      "yourself"   "yourselves" "he"         "him"       
##  [16] "his"        "himself"    "she"        "her"        "hers"      
##  [21] "herself"    "it"         "its"        "itself"     "they"      
##  [26] "them"       "their"      "theirs"     "themselves" "what"      
##  [31] "which"      "who"        "whom"       "this"       "that"      
##  [36] "these"      "those"      "am"         "is"         "are"       
##  [41] "was"        "were"       "be"         "been"       "being"     
##  [46] "have"       "has"        "had"        "having"     "do"        
##  [51] "does"       "did"        "doing"      "would"      "should"    
##  [56] "could"      "ought"      "i'm"        "you're"     "he's"      
##  [61] "she's"      "it's"       "we're"      "they're"    "i've"      
##  [66] "you've"     "we've"      "they've"    "i'd"        "you'd"     
##  [71] "he'd"       "she'd"      "we'd"       "they'd"     "i'll"      
##  [76] "you'll"     "he'll"      "she'll"     "we'll"      "they'll"   
##  [81] "isn't"      "aren't"     "wasn't"     "weren't"    "hasn't"    
##  [86] "haven't"    "hadn't"     "doesn't"    "don't"      "didn't"    
##  [91] "won't"      "wouldn't"   "shan't"     "shouldn't"  "can't"     
##  [96] "cannot"     "couldn't"   "mustn't"    "let's"      "that's"    
## [101] "who's"      "what's"     "here's"     "there's"    "when's"    
## [106] "where's"    "why's"      "how's"      "a"          "an"        
## [111] "the"        "and"        "but"        "if"         "or"        
## [116] "because"    "as"         "until"      "while"      "of"        
## [121] "at"         "by"         "for"        "with"       "about"     
## [126] "against"    "between"    "into"       "through"    "during"    
## [131] "before"     "after"      "above"      "below"      "to"        
## [136] "from"       "up"         "down"       "in"         "out"       
## [141] "on"         "off"        "over"       "under"      "again"     
## [146] "further"    "then"       "once"       "here"       "there"     
## [151] "when"       "where"      "why"        "how"        "all"       
## [156] "any"        "both"       "each"       "few"        "more"      
## [161] "most"       "other"      "some"       "such"       "no"        
## [166] "nor"        "not"        "only"       "own"        "same"      
## [171] "so"         "than"       "too"        "very"
```

--- .new-background

## Term x Document Matrix

* 해석이 힘든 단어들을 Term x Document Matrix 생성 시 제거


```r
delete.dict <- c("그냥", "등등", "중간")
```

--- .new-background

## Term x Document Matrix


```r
options(mc.cores=1)
tdm <- TermDocumentMatrix(cps,
                          control=list(
                          tokenize=ko.words, 
                          wordLengths=c(2,Inf),
                          weighting=weightBin,
                          removePunctuation=T,
                          stopwords=delete.dict))
```

--- .new-background .modal

## Term x Document Matrix


```r
rownames(tdm)[rownames(tdm)=="어벤져스"]
```

```
## [1] "어벤져스"
```

```r
rownames(tdm)[rownames(tdm)=="헐크"]
```

```
## [1] "헐크"
```

```r
rownames(tdm)[rownames(tdm)=="등등"]
```

```
## character(0)
```

```r
rownames(tdm)[rownames(tdm)=="ㅡ.ㅡ"]
```

```
## character(0)
```

--- .new-background

## Term x Document Matrix

* 행(row)은 Term(단어들), 열(col)은 Document(개인들)로 이루어진 Matrix




```r
ex
```

```
##        사람1 사람2 사람3
## 아이폰     1     1     0
## 갤럭시     1     0     1
## 좋다       1     1     0
## 나쁘다     0     0     1
```

--- .new-background

## Co-occurrence Matrix

* 특정 단어와 다른 단어가 동시에 영화평 내에서 발생한 것을 Counts
* 예시)


```r
ex %*% t(ex)
```

```
##        아이폰 갤럭시 좋다 나쁘다
## 아이폰      2      1    2      0
## 갤럭시      1      2    1      1
## 좋다        2      1    2      0
## 나쁘다      0      1    0      1
```

--- .new-background .modal

## Co-occurrence Matrix





```r
tdm.m <- as.matrix(tdm)
order(rowSums(tdm.m), decreasing = T)[1:5]
```

```
## [1] 3001 3820 4254 2489  679
```

```r
tdm.m <- tdm.m[order(rowSums(tdm.m), decreasing = T),]
```

--- .new-background

## Co-occurrence Matrix


```r
tdm.m <- tdm.m[1:20, ]
co.mat <- tdm.m %*% t(tdm.m)
co.mat[1:5,1:5]
```

```
##           Terms
## Terms      어벤져스 재미 지루 스토리 기대
##   어벤져스      466   66   54     60   43
##   재미           66  206   27     20   24
##   지루           54   27  185     24   26
##   스토리         60   20   24    160    8
##   기대           43   24   26      8  154
```

--- .dark .segue .nobackground

## 6. 감정사전 불러오기

--- .new-background

## 6. 감정사전 불러오기

<h3b><font color="blue"><b> 학습 목표 </b></font></h3b>  
<h3b> - 파일 불러오기(read.csv)</h3b>  
<h3b> - 긍정 사전과 부정 사전으로 분할(subset)</h3b>

--- .new-background

## 6. 감정사전 불러오기




```r
emotion.dict <- read.csv("emotion_dict_mac.csv", 
                         header = T, 
                         stringsAsFactors = F)
```


```r
pos.word <- subset(emotion.dict, pos_neg=="pos")[,"words"]
neg.word <- subset(emotion.dict, pos_neg=="neg")[,"words"]
#emotion.dict[11:15,]; emotion.dict[1301:1305,];
```

<h4><br></h4>
[감정사전](https://www.dropbox.com/s/okv4mjiq0wlhgbl/emotion_dict_mac.csv?dl=0)

--- .new-background .modal

## Term x Document Matrix와 감정 사전




```r
rownames(co.mat)[rownames(co.mat) %in% neg.word]
```

```
## [1] "지루" "실망" "산만"
```

```r
rownames(co.mat)[rownames(co.mat) %in% pos.word]
```

```
## [1] "재미" "기대"
```

```r
groups.list = list()
groups.list$비호감단어 <- which(rownames(co.mat) %in% neg.word)
groups.list$호감단어 <- which(rownames(co.mat) %in% pos.word)
groups.list
```

```
## $비호감단어
## [1]  3 15 19
## 
## $호감단어
## [1] 2 5
```

--- .dark .segue .nobackground

## 7. 시각화

--- .new-background

## 7. 시각화

<h3b><font color="blue"><b> 학습 목표 </b></font></h3b>  
<h3b> - Graph 그리기(qgraph)</h3b>  

--- .new-background

## Graph


```r
library("qgraph")
```


```r
qgraph(co.mat, labels = rownames(co.mat), diag=F)
```

--- .new-background

<center><img src="assets/img/result_graph_00.png" height="600" width="700"></center>

--- .new-background


```r
qgraph(co.mat, labels = rownames(co.mat), diag=F,
       layout="spring")
```

--- .new-background

<center><img src="assets/img/result_graph_01.png" height="600" width="700"></center>

--- .new-background



```r
qgraph(co.mat, labels = rownames(co.mat), diag=F,
       layout="spring", 
       edge.color = "darkblue")
```

--- .new-background

<center><img src="assets/img/result_graph_02.png" height="600" width="700"></center>

--- .new-background


```r
qgraph(co.mat, labels = rownames(co.mat), diag=F,
       layout="spring", 
       edge.color = "darkblue",
       groups = groups.list)
```

--- .new-background

<center><img src="assets/img/result_graph_03.png" height="600" width="700"></center>

--- .new-background


```r
qgraph(co.mat, labels = rownames(co.mat), diag=F,
       layout = "spring", 
       edge.color = "darkblue",
       groups = groups.list,
       vsize = 5,
       legend.cex = .7)
      
title(movie_name, line = 3)
```

--- .new-background

<center><img src="assets/img/result_graph.png" height="600" width="700"></center>

--- .new-background


```r
qgraph(co.mat, labels = rownames(co.mat), diag=F,
       layout = "spring", 
       edge.color = "darkblue",
       groups = groups.list,
       vsize = log(diag(co.mat)),
       legend.cex = .7)

title(movie_name, line = 3)
```

--- .new-background

<center><img src="assets/img/result_graph_2.png" height="600" width="700"></center>

--- .new-background


```r
qgraph(co.mat, labels = rownames(co.mat), diag=F,
       layout = "spring", 
       edge.color = "darkblue",
       groups = groups.list,
       vsize = log(diag(co.mat)),
       legend.cex = .7,
       color=c("gold", "lightblue"))
```

--- .new-background

[Tips](https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/colorPaletteCheatsheet.pdf)

<center><img src="assets/img/result_graph_04.png" height="600" width="700"></center>

--- .new-background

## 의문 단어 찾아보기(상관관계)


```r
head(findAssocs(tdm, "서울", 0))
```

```
##                서울
## 배경           0.30
## 후진국         0.27
## 모습           0.21
## 이미지가       0.19
## 히어로액션물을 0.19
## 누구           0.16
```

--- .new-background

## 의문 단어 찾아보기(상관관계)


```r
head(findAssocs(tdm, "다음", 0))
```

```
##            다음
## 검색       0.35
## 개봉많이   0.34
## 네이버보다 0.34
## 물타기알바 0.34
## 본사람들   0.34
## 빵점       0.34
```

--- .new-background

<div align="center">
<iframe width="100%" height="315"
src="http://soeque1.github.io/r_slide/daum_crawling/html/graph.html" allowfullscreen>
    </iframe></div>

--- .dark .segue .nobackground

## 감사합니다
