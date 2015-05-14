---
title       : "텍스트에서 여론과 감정을 발견하기"
subtitle    : "Using R"
author      : "김형준"
job         : "Data Analyst : (주) 퀀트랩"
biglogo     : logo_01.png
logo        : logo_03.png
license     : by
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
widgets     : []            # {mathjax, bootstrap, quiz}
mode        : selfcontained
hitheme     : tomorrow      # {tomorrow, tomorrow_night, solarized_dark, solarized_light}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
knit        : slidify::knit2slides
---

<center><img src="assets/img/quantlab.png" height=600px width=800px></center>

--- .new-background

## 빅데이터 경진 대회 금상

<center><img src="assets/img/intro.png" height=550px width=700px></center>

--- .new-background

## 워크숍 관련 온라인 사이트

http://course.mindscale.kr/course/text-analysis

<left><img src="assets/img/intro2.png" height=300px width=600px></left>

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

--- .new-background

## 목차

<h4><br></h4>
<h3 style="text-align:left">1. R 기초 세팅</h3>
<h3 style="text-align:left">2. 패키지 인스톨</h3>    
<h3 style="text-align:left">3. 어벤져스 웹크롤</h3>  
<h3 style="text-align:left">4. 감정사전 불러오기</h3>  
<h3 style="text-align:left">5. 키워드 파싱 및 추출</h3>
<h3 style="text-align:left">6. Co-occurrence Matrix</h3>  
<h3 style="text-align:left">7. 시각화</h3>  

--- &twocol w1:40% w2:60% .new-background

## 목차

*** =left
<h4><br></h4>
<h3 style="text-align:left">1. R 기초 세팅</h3>
<h3 style="text-align:left">2. 패키지 인스톨</h3>    
<h3 style="text-align:left">3. 어벤져스 웹크롤</h3>  
<h3 style="text-align:left">4. 감정사전 불러오기</h3>  
<h3 style="text-align:left">5. 키워드 파싱 및 추출</h3>  
<h3 style="text-align:left">6. Co-occurrence Matrix</h3>  
<h3 style="text-align:left">7. 시각화</h3>  

*** =right
<center><img src="assets/img/result_graph.png" height="500" width="600"></center>
---

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

- MAC


```r
##  사용자 경로
user_path = "/Users/kimhyungjun/repo/daum_movie" 
par(family="AppleGothic")  ##  그림 출력시 한글폰트
```

- Windows


```r
user_path = "C:/Users/kimhyungjun/repo/daum_movie"  
```

- MAC & Windows 공통


```r
setwd(user_path)
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

<h4>감정 사전 (엑셀파일 읽기)</h4>
* [readxl](http://cran.r-project.org/web/packages/readxl/index.html)  
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
library("httr")
library("rvest")
library("stringr")
library("dplyr")
library("tm")
library("qgraph")
library("KoNLP")
```

--- .dark .segue .nobackground

## 3. 어벤져스 웹크롤

--- .new-background

## 3. 어벤져스 웹크롤

<h3b><font color="blue"><b> 학습 목표 </b></font></h3b>  
<h3b> - 웹사이트 배경지식</h3b>  
<h3b> - Regualr Expression (REGEX)</h3b>  
<h3b> - 단일 페이지 웹크롤</h3b>  
<h3b> - 복수 페이지 웹크롤</h3b>  

--- .new-background

## 3. 웹사이트 배경지식

- 웹브라우저 열기(e.g. Firefox, Chorme, Safari, Internet Explorer)
- 웹사이트 입력(e.g. http://movie.daum.net)

<h4><br></h4>
- 사용자는 client로 페이지, 이미지, 텍스트를 웹 서버로 요청함
- 웹 서버 사용자에게 반응을 보냄
- 사용자와 웹 서버는 프로토콜(e.g. HTTP)로 커뮤니케이션

--- .new-background .modal

## HTTP

<h4> HTTP? </h4>
- HyperText Transfer Protocal


```r
library("httr")
GET("http://google.com/")  ##  Requset -> Resposne
```

```
## Response [http://www.google.co.kr/?gfe_rd=cr&ei=gP5SVfymLurM8gf-soCABw]
##   Date: 2015-05-13 16:34
##   Status: 200
##   Content-Type: text/html; charset=EUC-KR
##   Size: 18.8 kB
## <!doctype html><html itemscope="" itemtype="http://schema.org/WebPage" l...
## window.google.vel.lu&&window.google.vel.lu(a),d.src=a,google.li=g+1)};go...
## function _gjh(){!_gjuc()&&window.google&&google.x&&google.x({id:"GJH"},f...
## if (!iesg){document.f&&document.f.q.focus();document.gbqf&&document.gbqf...
## }
## })();</script><div id="mngb">    <div id=gbar><nobr><b class=gb1>검색</b> ...
## });})();</script> </div> </span><br clear="all" id="lgpd"><div id="lga">...
```

--- .new-background

## 다음 영화

http://movie.daum.net

<left><img src="assets/img/daum_movie.png" height="550" width="550"></left>

--- .new-background .modal

## 어벤져스 (1 페이지 웹크롤)


```r
urls_view <- "http://movie.daum.net/moviedetail/moviedetailNetizenPoint.do?movieId=73750&t__nil_NetizenPoint=tabName"
r <- GET(urls_view)
htxt <- html(r)
```

--- .new-background .modal




```r
html_nodes(htxt, ".comment")
```

[[1]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811563&amp;type=after" title="댓글달기">어벤져스 1편 윈터솔져 정도는 보고 가셔야 그나마 이해될듯..지금껏 관련 영화는 다보았기에 그나마 이해하며 봤지만..마블영웅에 적응이 돼서 그런가 감흥은 없는듯..하지만 다음편도 나오면 보게될듯..                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[2]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811540&amp;type=after" title="댓글달기">괜찮음                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[3]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811528&amp;type=after" title="댓글달기">여태까지 마블 무비의 팬이었고 군데군데 나오는 떡밥을 알아차릴수있다면 이영화는 굉장히 의미가&#13;
큰영화가 될거다                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[4]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811525&amp;type=after" title="댓글달기">최초에 의미를 둔 슈퍼히어로 매쉬 업                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[5]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811499&amp;type=after" title="댓글달기">좀 실망스러운 영화입니다. 내용도 없고 재미도 없구요                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[6]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811488&amp;type=after" title="댓글달기">별로 재미는~~                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[7]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811481&amp;type=after" title="댓글달기">재미있다기보다는, 내가 어벤져스를 봤구나? 이런기분.                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[8]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811468&amp;type=after" title="댓글달기">여전히 멋져요..근데 한국은 억지로 끼워준 이 찜찜한 느낌은 뭐지..?ㅋㅋ                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[9]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811465&amp;type=after" title="댓글달기">재미있다.?
재미없다.?
양자택일 하면

재미없다...!!
또 한국국민만 특유의  쏠림현상

미국특유의 B급 폭력영화
억지영웅 만들기.미국전통문화컴플렉스에서 기인하는 영화
                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[10]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811407&amp;type=after" title="댓글달기">솔직히 왜 볼까 싶다. 순전히 마케팅에 의한 것이지. 남들이 보니 군중 심리에 휩쓸려 보는...별 볼 것도 없었음. 아무 느낌이 없는 영화였고 평점 줄 것도 없음. 0점도 아까움!                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[11]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811361&amp;type=after" title="댓글달기">40대 후반인데,.... 보느라 혼났내요 ^^  &#13;
                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[12]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811356&amp;type=after" title="댓글달기">재밌더만 왜이리 평이 안좋은 지..                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[13]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811341&amp;type=after" title="댓글달기">할말이 없다..ㅜ                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[14]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811325&amp;type=after" title="댓글달기">만드느라 고생했다 4점..                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[15]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811324&amp;type=after" title="댓글달기">짐 7시50분꺼 보고나왔는데지루하고산만하고                     <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

attr(,"class")
[1] "XMLNodeSet"

--- .new-background


```r
html_nodes(html_nodes(htxt, ".comment"),"a")
```

[[1]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811563&amp;type=after" title="댓글달기">어벤져스 1편 윈터솔져 정도는 보고 가셔야 그나마 이해될듯..지금껏 관련 영화는 다보았기에 그나마 이해하며 봤지만..마블영웅에 적응이 돼서 그런가 감흥은 없는듯..하지만 다음편도 나오면 보게될듯..                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[2]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811540&amp;type=after" title="댓글달기">괜찮음                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[3]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811528&amp;type=after" title="댓글달기">여태까지 마블 무비의 팬이었고 군데군데 나오는 떡밥을 알아차릴수있다면 이영화는 굉장히 의미가&#13;
큰영화가 될거다                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[4]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811525&amp;type=after" title="댓글달기">최초에 의미를 둔 슈퍼히어로 매쉬 업                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[5]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811499&amp;type=after" title="댓글달기">좀 실망스러운 영화입니다. 내용도 없고 재미도 없구요                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[6]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811488&amp;type=after" title="댓글달기">별로 재미는~~                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[7]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811481&amp;type=after" title="댓글달기">재미있다기보다는, 내가 어벤져스를 봤구나? 이런기분.                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[8]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811468&amp;type=after" title="댓글달기">여전히 멋져요..근데 한국은 억지로 끼워준 이 찜찜한 느낌은 뭐지..?ㅋㅋ                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[9]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811465&amp;type=after" title="댓글달기">재미있다.?
재미없다.?
양자택일 하면

재미없다...!!
또 한국국민만 특유의  쏠림현상

미국특유의 B급 폭력영화
억지영웅 만들기.미국전통문화컴플렉스에서 기인하는 영화
                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[10]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811407&amp;type=after" title="댓글달기">솔직히 왜 볼까 싶다. 순전히 마케팅에 의한 것이지. 남들이 보니 군중 심리에 휩쓸려 보는...별 볼 것도 없었음. 아무 느낌이 없는 영화였고 평점 줄 것도 없음. 0점도 아까움!                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[11]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811361&amp;type=after" title="댓글달기">40대 후반인데,.... 보느라 혼났내요 ^^  &#13;
                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[12]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811356&amp;type=after" title="댓글달기">재밌더만 왜이리 평이 안좋은 지..                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[13]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811341&amp;type=after" title="댓글달기">할말이 없다..ㅜ                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[14]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811325&amp;type=after" title="댓글달기">만드느라 고생했다 4점..                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[15]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1811324&amp;type=after" title="댓글달기">짐 7시50분꺼 보고나왔는데지루하고산만하고                     <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

attr(,"class")
[1] "XMLNodeSet"

--- .new-background 


```r
html_text(html_nodes(html_nodes(htxt, ".comment"),"a"))
```

 [1] "어벤져스 1편 윈터솔져 정도는 보고 가셔야 그나마 이해될듯..지금껏 관련 영화는 다보았기에 그나마 이해하며 봤지만..마블영웅에 적응이 돼서 그런가 감흥은 없는듯..하지만 다음편도 나오면 보게될듯..                    "
 [2] "괜찮음                    "                                                                                                                                                                                        
 [3] "여태까지 마블 무비의 팬이었고 군데군데 나오는 떡밥을 알아차릴수있다면 이영화는 굉장히 의미가\r\n큰영화가 될거다                    "                                                                               
 [4] "최초에 의미를 둔 슈퍼히어로 매쉬 업                    "                                                                                                                                                           
 [5] "좀 실망스러운 영화입니다. 내용도 없고 재미도 없구요                    "                                                                                                                                           
 [6] "별로 재미는~~                    "                                                                                                                                                                                 
 [7] "재미있다기보다는, 내가 어벤져스를 봤구나? 이런기분.                    "                                                                                                                                           
 [8] "여전히 멋져요..근데 한국은 억지로 끼워준 이 찜찜한 느낌은 뭐지..?ㅋㅋ                    "                                                                                                                         
 [9] "재미있다.?\n재미없다.?\n양자택일 하면\n\n재미없다...!!\n또 한국국민만 특유의  쏠림현상\n\n미국특유의 B급 폭력영화\n억지영웅 만들기.미국전통문화컴플렉스에서 기인하는 영화\n                    "                   
[10] "솔직히 왜 볼까 싶다. 순전히 마케팅에 의한 것이지. 남들이 보니 군중 심리에 휩쓸려 보는...별 볼 것도 없었음. 아무 느낌이 없는 영화였고 평점 줄 것도 없음. 0점도 아까움!                    "                         
[11] "40대 후반인데,.... 보느라 혼났내요 ^^  \r\n                    "                                                                                                                                                   
[12] "재밌더만 왜이리 평이 안좋은 지..                    "                                                                                                                                                              
[13] "할말이 없다..ㅜ                    "                                                                                                                                                                               
[14] "만드느라 고생했다 4점..                    "                                                                                                                                                                       
[15] "짐 7시50분꺼 보고나왔는데지루하고산만하고                     "                                                                                                                                                    

--- .dark .segue .nobackground

## R 연습 (REGEX & FOR, IF)

--- .new-background .modal

## REGEX (연습 1)


```r
ex <- c("아!! R이 왜 이렇게 재미있냐?", "[1]", "[2]", "[20]", "졸리다...")
str_replace_all(ex, '!', '')
```

```
## [1] "아 R이 왜 이렇게 재미있냐?" "[1]"                       
## [3] "[2]"                        "[20]"                      
## [5] "졸리다..."
```

```r
str_replace_all(ex, "!|\\.", "")
```

```
## [1] "아 R이 왜 이렇게 재미있냐?" "[1]"                       
## [3] "[2]"                        "[20]"                      
## [5] "졸리다"
```

```r
str_replace_all(ex, "[[:punct:]]", "")
```

```
## [1] "아 R이 왜 이렇게 재미있냐" "1"                        
## [3] "2"                         "20"                       
## [5] "졸리다"
```

--- .new-background .modal

## REGEX (연습 1)


```r
str_replace_all(ex, "1", "")
```

```
## [1] "아!! R이 왜 이렇게 재미있냐?" "[]"                          
## [3] "[2]"                          "[20]"                        
## [5] "졸리다..."
```

```r
str_replace_all(ex, "[1]", "")
```

```
## [1] "아!! R이 왜 이렇게 재미있냐?" "[]"                          
## [3] "[2]"                          "[20]"                        
## [5] "졸리다..."
```

```r
str_replace_all(ex, "\\[1\\]", "")
```

```
## [1] "아!! R이 왜 이렇게 재미있냐?" ""                            
## [3] "[2]"                          "[20]"                        
## [5] "졸리다..."
```

--- .new-background

## REGEX (연습 1)


```r
str_replace_all(ex, "\\[[0-9]\\]", "")
```

```
## [1] "아!! R이 왜 이렇게 재미있냐?" ""                            
## [3] ""                             "[20]"                        
## [5] "졸리다..."
```

```r
str_replace_all(ex, "\\[[0-9]+\\]", "")
```

```
## [1] "아!! R이 왜 이렇게 재미있냐?" ""                            
## [3] ""                             ""                            
## [5] "졸리다..."
```

--- .new-background .modal

## REGEX (연습 1)


```r
ex <- str_replace_all(ex, "\\[[0-9]+\\]", "")
```


```r
ex==""
```

```
## [1] FALSE  TRUE  TRUE  TRUE FALSE
```

```r
ex!=""
```

```
## [1]  TRUE FALSE FALSE FALSE  TRUE
```

```r
ex[ex!=""]
```

```
## [1] "아!! R이 왜 이렇게 재미있냐?" "졸리다..."
```

--- .new-background .modal

## FOR & IF, break (연습 2)


```r
for (i in 1:5)
{
    print(i)
}
```

```
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
```


```r
for (i in 1:100)
{
    if(i==3) break
    print(i)
}
```

```
## [1] 1
## [1] 2
```

--- .new-background

## 어벤져스 (1 페이지 웹크롤)




```r
movie_text <- html_text(html_nodes(html_nodes(htxt, ".comment"),"a"))

movie_text <- str_replace_all(movie_text, "\\[[0-9]+\\]", "")  ##  영화평의 댓글 제거

movie_text <- movie_text[movie_text!=""]  ##  영화평의 댓글 제거
```

--- .new-background .modal

## 어벤져스 전체 페이지 웹크롤


```r
movie_text_sum <- c();

for (page_num in 1:1000)
{
urls_view <- paste("http://movie.daum.net/review/netizen_point/movieNetizenPoint.do?type=after&op=movieId&searchValue=73750&page=",page_num,sep="")
r <- GET(urls_view)
htxt <- html(r)

movie_text <-  html_nodes(htxt, ".comment")
movie_text <-  html_nodes(movie_text, "a")
movie_text <-  html_text(movie_text)
#movie_text <-  html_text(html_nodes(html_nodes(htxt, ".comment"),"a"))

if(length(movie_text)==0) break;

movie_text <- str_replace_all(movie_text, "\\[[0-9]+\\]", "")  ##  영화평의 댓글 제거
movie_text <- movie_text[movie_text!=""]
movie_text_sum <- c(movie_text_sum, movie_text)
print(paste(page_num, "-th page", sep=""))    
}

movie_text_sum <- str_replace_all(movie_text_sum, "\n|\n\r", " ")
```

--- .dark .segue .nobackground

## 4. 감정사전 불러오기

--- .new-background

## 4. 감정사전 불러오기

<h3b><font color="blue"><b> 학습 목표 </b></font></h3b>  
<h3b> - 파일 불러오기(read.csv)</h3b>  
<h3b> - 긍정 사전과 부정 사전으로 분할(subset)</h3b>

--- .new-background

## 4. 감정사전 불러오기




```r
emotion_dict <- read.csv("emotion_dict.csv", 
                         header = T, 
                         fileEncoding = fileEncoding,
                         stringsAsFactors = F)
```


```r
pos_word <- subset(emotion_dict, pos_neg=="pos")[,"words"]
neg_word <- subset(emotion_dict, pos_neg=="neg")[,"words"]
#emotion_dict[11:15,]; emotion_dict[1301:1305,];
```

<h4><br></h4>
[감정사전](https://www.dropbox.com/s/okv4mjiq0wlhgbl/emotion_dict.csv?dl=0)

--- .dark .segue .nobackground

## 5. 키워드 파싱 및 추출

--- .new-background

## 5. 키워드 파싱 및 추출

<h3b><font color="blue"><b> 학습 목표 </b></font></h3b>  

<h3b> - R에서 자연어 처리 문제</h3b>  

<h3b> - 키워드 추출 방법 1 (KoNLP 사용)</h3b>  
- Step 1) POS Tagging  
- Step 2) 체언(명사)과 용언(형용사/동사) 추출  
- Step 3) 문장 자르기  
- Step 4) 맞춤법 교정  
- Step 5) 문장 합치기  

<h3b> - 키워드 추출 방법 2 (앞 두 글자 자르기) - APPENDIX </h3b>


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
## [1] "기대 하 것  지루  와이프 재미있 "
```

--- .dark .segue .nobackground

## R 연습

--- .new-background

## 문장 자르기(split) (연습 3)


```r
ex <- "기대보다 아주 재밌음!!!!!!!! !! 꼭 봐요~ > < *"
```


```r
result <- str_split(ex, "([ㄱ-ㅎㅏ-ㅢ]|[[:punct:]]|[0-9A-Za-z]|[[:space:]])+" )
result
```

```
## [[1]]
## [1] "기대보다" "아주"     "재밌음"   "꼭"       "봐요"     ""
```

--- .new-background

## 앞 2글자 추출 (연습 4)


```r
result <- str_sub(result[[1]], 1, 2)
result
```

```
## [1] "기대" "아주" "재밌" "꼭"   "봐요" ""
```

--- .new-background

## 맞춤법 교정 (연습 5)


```r
plyr::revalue("재밌", c("재밌" =  "재미", "재믿" = "재미"), warn_missing=F)
```

```
## [1] "재미"
```

```r
plyr::revalue(result, c("재밌" =  "재미", "재믿" = "재미"), warn_missing=F)
```

```
## [1] "기대" "아주" "재미" "꼭"   "봐요" ""
```

--- .new-background

## 한 문장으로 합치기 (연습 6)


```r
paste(c("하", "R은", "정말", "신나"), sep= ' ')
```

```
## [1] "하"   "R은"  "정말" "신나"
```

```r
paste(c("하", "R은", "정말", "신나"), collapse=" ")
```

```
## [1] "하 R은 정말 신나"
```

```r
paste(c("하", "R은", "정말", "신나"), collapse="+")
```

```
## [1] "하+R은+정말+신나"
```

--- .new-background .modal

## POS Tagging (연습 7)


```r
SimplePos09(ex)
```

```
## $기대보다
## [1] "기대/N+보다/J"
## 
## $아주
## [1] "아주/M"
## 
## $재밌음
## [1] "재밌음/N"
## 
## $`!!!!!`
## [1] "!!!!!/S"
## 
## $`!!!`
## [1] "!!!/S"
## 
## $`!!`
## [1] "!!/S"
## 
## $꼭
## [1] "꼭/M"
## 
## $`봐요~`
## [1] "보/P+아/E+~/S"
## 
## $`>`
## [1] ">/S"
## 
## $`<`
## [1] "</S"
## 
## $`*`
## [1] "*/S"
```

--- .new-background .modal

## POS Tagging (연습 7)

[태그 메뉴얼(pp.16 ~ 17)](http://kldp.net/projects/hannanum/forum/316173)


```r
result <- paste(SimplePos09(ex))
result
```

```
##  [1] "기대/N+보다/J" "아주/M"        "재밌음/N"      "!!!!!/S"      
##  [5] "!!!/S"         "!!/S"          "꼭/M"          "보/P+아/E+~/S"
##  [9] ">/S"           "</S"           "*/S"
```

--- .new-background .modal

## POS Tagging (연습 7)

- 체언(N)과 용언(P)만 추출  
- 체언(N) : 보통명사 + 고유명사 + 의존명사 + 대명사 + 수사  
- 용언(P) : 동사 + 형용사 + 보조용언


```r
result <- str_extract_all(result,"[가-힣]+/P|[가-힣]+/N")
result
```

```
## [[1]]
## [1] "기대/N"
## 
## [[2]]
## character(0)
## 
## [[3]]
## [1] "재밌음/N"
## 
## [[4]]
## character(0)
## 
## [[5]]
## character(0)
## 
## [[6]]
## character(0)
## 
## [[7]]
## character(0)
## 
## [[8]]
## [1] "보/P"
## 
## [[9]]
## character(0)
## 
## [[10]]
## character(0)
## 
## [[11]]
## character(0)
```

--- .new-background .modal

## 체언과 용언 추출 (연습 8)


```r
result <- paste(result, collapse = " ")
result
```

```
## [1] "기대/N character(0) 재밌음/N character(0) character(0) character(0) character(0) 보/P character(0) character(0) character(0)"
```

--- .new-background .modal

## 체언과 용언 추출 (연습 8)


```r
result <- str_replace_all(result,"[ㄱ-ㅎㅏ-ㅢ]|[[:punct:]]|[0-9A-Za-z]|[[:space:]])+","")
result
```

```
## [1] "기대  재밌음     보   "
```

```r
ex  ##  앞 두 글자가 오히려 좋을 수도
```

```
## [1] "기대보다 아주 재밌음!!!!!!!! !! 꼭 봐요~ > < *"
```

```r
split_12(ex)
```

```
## [1] "기대" "아주" "재밌" "!!"   "꼭"   "봐요" ">"    "<"    "*"
```

--- .new-background

## 키워드 추출 (어벤져스)

* Step (1) POS Tagging




```r
movie_text_sum[1]
```

```
## [1] "괜찮음.. 시원한 액션.. 갠적으로 캡틴아메리카 너무 좋아함. 헐크도 좋고.. ♥♥♥"
```

```r
key_vec <- SimplePos09(movie_text_sum[1])
key_vec <- paste(SimplePos09(movie_text_sum[1]),"")
key_vec
```

```
##  [1] "괜찮/P+음/E "           "../S "                 
##  [3] "시원한/N "              "액션/N "               
##  [5] "../S "                  "개/P+ㄴ/E+적/N+으로/J "
##  [7] "캡틴아메리카/N "        "너무/M "               
##  [9] "좋/P+아/E+하/P+ㅁ/E "   "./S "                  
## [11] "헐크도/N "              "좋/P+고/E "            
## [13] "../S "                  "♥♥♥/N "
```

--- .new-background

## 키워드 추출 (어벤져스)

* Step (2) 체언(N)과 용언(P) 추출


```r
key_vec <- str_extract_all(key_vec,"[가-힣]+/P|[가-힣]+/N")
key_vec <- paste(key_vec, collapse=" ")
key_vec
```

```
## [1] "괜찮/P character(0) 시원한/N 액션/N character(0) c(\"개/P\", \"적/N\") 캡틴아메리카/N character(0) c(\"좋/P\", \"하/P\") character(0) 헐크도/N 좋/P character(0) character(0)"
```

--- .new-background .modal

## 키워드 추출 (어벤져스)

* Step (3) 파싱(문장 자르기)


```r
key_vec <- str_replace_all(key_vec,"[ㄱ-ㅎㅏ-ㅢ]|[[:punct:]]|[0-9A-Za-z]|[[:space:]])+","")
key_vec <- str_split(key_vec, " ")
key_vec <- key_vec[[1]]
key_vec
```

```
##  [1] "괜찮"         ""             "시원한"       "액션"        
##  [5] ""             "개"           "적"           "캡틴아메리카"
##  [9] ""             "좋"           "하"           ""            
## [13] "헐크도"       "좋"           ""             ""
```

--- .new-background .modal

## 키워드 추출 (어벤져스)

* Step (4) 맞춤법 교정


```r
movie_name <- "어벤져스"
key_vec <- plyr::revalue(key_vec, c("재밌" = "재미",
                                    "재밋" = "재미",
                                    "잼있" = "재미",
                                    "재밌음" = "재미",
                                    "재미있" = "재미",
                                    "지루함" = "지루",
                                    "좋" = "좋음",
                                    "영화" = movie_name,
                                    "캐릭" = "캐릭터"),
                         warn_missing = F)
key_vec
```

```
##  [1] "괜찮"         ""             "시원한"       "액션"        
##  [5] ""             "개"           "적"           "캡틴아메리카"
##  [9] ""             "좋음"         "하"           ""            
## [13] "헐크도"       "좋음"         ""             ""
```

--- .new-background

## 키워드 추출 (어벤져스)

* Step (5) 다시 한 문장으로 합치기


```r
key_vec <- paste(key_vec, collapse=" ")
key_vec
```

```
## [1] "괜찮  시원한 액션  개 적 캡틴아메리카  좋음 하  헐크도 좋음  "
```

--- .new-background .modal

## 키워드 추출 (어벤져스)


```r
key_vec_sum <- c(); movie_name = "어벤져스"
for (i in 1:length(movie_text_sum))
{
key_vec <- paste(SimplePos09(movie_text_sum[i]))
key_vec <- str_extract_all(key_vec,"[가-힣]+/P|[가-힣]+/N")
key_vec <- paste(key_vec, collapse=" ")
key_vec <- str_replace_all(key_vec,"[ㄱ-ㅎㅏ-ㅢ]|[[:punct:]]|[0-9A-Za-z]|[[:space:]])+","")
key_vec <- str_split(key_vec, " ")
key_vec <- key_vec[[1]]
movie_name <- "어벤져스"
key_vec <- plyr::revalue(key_vec, c("재밌" = "재미",
                                     "재밋" = "재미",
                                     "잼있" = "재미",
                                     "재밌음" = "재미",
                                     "재미있" = "재미",
                                     "지루함" = "지루",
                                     "좋" = "좋음",
                                     "영화" = movie_name,
                                     "캐릭" = "캐릭터"),
                        warn_missing = F)
key_vec <- c(key_vec, ' ')  ##  윈도우 tm 버그 때문
key_vec_sum[i] <- paste(key_vec, collapse='  ')  ##  두 칸 (윈도우 tm 버그 때문)
}
```

```
## Warning: It's not kind of right sentence : '재미겁나.없음.스토리자체가어거지로맞츠는데, '
## Warning: It's not kind of right sentence : '꾸벅꾸벅...........억지로봤네요.........'
## Warning: It's not kind of right sentence : '저는개인적으로1편보단재밌게봤습니다솔직히첨부분은지루한점은있었는데중반부터재밌더라고요역시CG가대단합니다.서울에서찍은장면도기대이상이였습니다'
## Warning: It's not kind of right sentence : '재미없다는사람들대체이때까지어떤영화를본거지....핵꿀잼이던데...'
## Warning: It's not kind of right sentence : '그냥자다가다시일어나서보고ㅜ별로모르겟음ㅜㅜ'
## Warning: It's not kind of right sentence : '계속지네들끼리싸우다가적하고싸우다가또지들끼리싸운다...그러다또적하고싸우고ㅡㅡ지루한건사실이다..새로운인물들이나타날때마다몰입도는떨어져갔다..그러나한국을알리는데는도움이될거같았다..씬도어느정도중요했고..음..딱히재미있는영화라고는못하겠다..그냥그냥볼만한영화?ㅎ그이상그이하도아닌거같았다'
```

--- .dark .segue .nobackground

## 6. Co-occurrence Matrix

--- .new-background

## 6. Co-occurrence Matrix

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
dim(key_vec_sum)
```

```
## NULL
```

```r
dim(as.data.frame(key_vec_sum))
```

```
## [1] 1737    1
```

```r
key_corpus <- Corpus(DataframeSource(as.data.frame(key_vec_sum)))
```

--- .new-background

## Term x Document Matrix

* 해석이 힘든 단어들을 Term x Document Matrix 생성 시 제거


```r
delete_dic <- c('그냥', '너무', '보고', '생각', '정말', '그래', '봤는',
                '나오', '진짜', '평점', '보면', '사람', '중간', '느낌',
                '이런', '보는', '보다', '편보', '많이', 
                '모르', '우리', '그런', '아니', '이해', '그리', '하는',
                '다음', '역시', '없다', '보이', '만들', '그러', '못하', '그렇',
                '위하', '느끼')
```

--- .new-background .modal

## Term x Document Matrix


```r
key_tdm <- TermDocumentMatrix(key_corpus,
                              control = list(
                              removeNumbers = TRUE,
                              wordLengths = c(2,Inf),  ##  윈도우 작동 X
                              removePunctuation = TRUE,
                              stopwords = delete_dic,
                              weighting = function(x) weightBin(x)))
                                  
key_tdm <- as.matrix(key_tdm)
key_tdm <- key_tdm[nchar(rownames(key_tdm))!=1,]  ##  for windows
dim(key_tdm)
```

```
## [1] 5507 1737
```

--- .new-background

## Term x Document Matrix

* 행(row)은 Term(단어들), 열(col)은 Document(개인들)로 이루어진 Matrix
* Binary Weight (boolean)


```r
ex <- matrix(c(1,1,1,0,
               1,0,1,0,
               0,1,0,1), 
               nrow=4)
rownames(ex) <- c("아이폰", "갤럭시", "좋다", "나쁘다")
colnames(ex) <- c("사람1", "사람2", "사람3")
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
key_tdm <- key_tdm[order(rowSums(key_tdm), decreasing = T),][1:20,]
co_matrix <- key_tdm %*% t(key_tdm)
co_matrix[1:5,1:5]
```

```
##           Terms
## Terms      어벤져스 재미 기대 스토리 지루
##   어벤져스      399   79   51     48   28
##   재미           79  287   42     23   28
##   기대           51   42  172     13   21
##   스토리         48   23   13    143   17
##   지루           28   28   21     17  137
```

--- .new-background

## Term x Document Matrix와 감정 사전


```r
groups_list = list()
groups_list$비호감단어 = which(colnames(co_matrix) %in% neg_word)
groups_list$호감단어 = which(colnames(co_matrix) %in% pos_word)
groups_list
```

```
## $비호감단어
## [1]  5 12 13 19
## 
## $호감단어
## [1]  2  3  6 17
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
qgraph(co_matrix, layout="spring", diag = F, 
       labels = colnames(co_matrix), 
       edge.color = "darkblue", 
       legend.cex = .7, 
       vsize = 5,
       label.cex = 0.3, 
       label.color = "black",
       groups = groups_list)

title(movie_name, line = 3)
```

--- .new-background

## Graph

<center><img src="assets/img/result_graph.png" height="500" width="500"></center>

--- .new-background

## Graph


```r
qgraph(co_matrix, layout="spring", diag = F, 
       labels = colnames(co_matrix), 
       edge.color = "darkblue", 
       legend.cex = .7, 
       vsize = log(diag(co_matrix)),
       label.cex = 0.3, 
       label.color = "black",
       groups = groups_list)

title(movie_name, line = 3)
```

--- .new-background

## Graph

<center><img src="assets/img/result_graph_2.png" height="500" width="500"></center>

--- .dark .segue .nobackground

## Appendix - 앞 2글자 자르기

--- .new-background

## 키워드 추출 (어벤져스)

* Step 1) 문장 자르기(split)




```r
key_vec <- str_split(movie_text_sum[1], 
          "([ㄱ-ㅎㅏ-ㅢ]|[[:punct:]]|[0-9A-Za-z]|[[:space:]])+" )
key_vec
```

```
## [[1]]
##  [1] "괜찮음"       "시원한"       "액션"         "갠적으로"    
##  [5] "캡틴아메리카" "너무"         "좋아함"       "헐크도"      
##  [9] "좋고"         ""
```

--- .new-background

## 키워드 추출 (어벤져스)

* Step 2) 앞 2글자 추출


```r
key_vec <- str_sub(key_vec[[1]], 1, 2)
key_vec
```

```
##  [1] "괜찮" "시원" "액션" "갠적" "캡틴" "너무" "좋아" "헐크" "좋고" ""
```

--- .new-background .modal

## 키워드 추출 (어벤져스)

* Step 3) 맞춤법 교정


```r
movie_name <- "어벤져스"
key_vec <- plyr::revalue(key_vec, c("재밌" = "재미",
                                    "재밋" = "재미",
                                    "잼있" = "재미",
                                    "영화" = movie_name,
                                    "스토" = "스토리",
                                    "시사" = "시사회",
                                    "어벤" = "어벤져스",
                                    "아이" = "아이언맨",
                                    "히어" = "히어로",
                                    "어밴져스" = "어벤져스",
                                    "캐릭" = "캐릭터",
                                    "울트" = "울트론"),
                         warn_missing = F)
key_vec
```

```
##  [1] "괜찮" "시원" "액션" "갠적" "캡틴" "너무" "좋아" "헐크" "좋고" ""
```

--- .new-background

## 키워드 추출 (어벤져스)

* Step 4) 다시 한 문장으로 합치기


```r
key_vec <- paste(key_vec, collapse=" ")
key_vec
```

```
## [1] "괜찮 시원 액션 갠적 캡틴 너무 좋아 헐크 좋고 "
```

--- .new-background .modal

## 키워드 추출 (어벤져스)


```r
key_vec_sum <- c(); movie_name = "어벤져스"
for (i in 1:length(movie_text_sum))
{
key_vec <- str_split(movie_text_sum[i], "([ㄱ-ㅎㅏ-ㅢ]|[[:punct:]]|[0-9A-Za-z]|[[:space:]])+" )

key_vec <- str_sub(key_vec[[1]], 1, 2)
movie_name <- "어벤져스"
key_vec <- plyr::revalue(key_vec, c("재밌" = "재미",
                                       "재밋" = "재미",
                                       "잼있" = "재미",
                                       "영화" = movie_name,
                                       "스토" = "스토리",
                                       "시사" = "시사회",
                                       "어벤" = "어벤져스",
                                       "아이" = "아이언맨",
                                       "히어" = "히어로",
                                       "어밴져스" = "어벤져스",
                                       "캐릭" = "캐릭터",
                                       "울트" = "울트론"),
                        warn_missing = F)
key_vec <- c(key_vec, ' ')  ##  윈도우 tm 버그 때문
key_vec_sum[i] <- paste(key_vec, collapse='  ')  ##  두 칸 (윈도우 tm 버그 때문)
}
```

--- .new-background

## 긍정과 부정 - 중복 단어


```r
pos_neg_word <- c(pos_word, neg_word)
pos_neg_word[duplicated(pos_neg_word)]
```

```
##  [1] "구슬" "기대" "기회" "긴장" "꺼리" "너무" "논리" "눈물" "대단" "매력"
## [11] "무지" "바람" "반성" "벅차" "불가" "사상" "새삼" "서글" "서운" "설득"
## [21] "섭섭" "소용" "수작" "시원" "쓸모" "아깝" "아리" "애끓" "애처" "애타"
## [31] "에이" "염려" "예의" "오차" "욕심" "유머" "유행" "의미" "이변" "이상"
## [41] "재미" "지식" "탈피" "탐나" "태평" "특징" "필요" "후회" "희망"
```

--- .new-background

## 긍정과 부정 - 중복 단어 

* 하나의 대안


```r
negation_words <- c("없", "않", "안")
ex <- "재미없다. 기대안했다 헐크 웃기다 웃음!!"
sapply(str_split(ex, " ")[[1]], 
       function(x) if ( str_sub(x,3,3) %in% negation_words )
                        str_sub(x,1,3) else { str_sub(x,1,2) },
       USE.NAMES = F)
```

```
## [1] "재미없" "기대안" "헐크"   "웃기"   "웃음"
```
