---
title       : "텍스트에서 여론과 감정을 발견하기"
subtitle    : "Using R"
author      : "김형준"
job         : "Data Analyst"
biglogo     : logo_01.png
logo        : logo_02.png
license     : by
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
widgets     : []            # {mathjax, bootstrap, quiz}
mode        : selfcontained
hitheme     : tomorrow      # {tomorrow, tomorrow_night, solarized_dark, solarized_light}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
knit        : slidify::knit2slides
---

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

---

## 목차

<h4><br></h4>
<h3 style="text-align:left">1. R 기초 세팅</h3>
<h3 style="text-align:left">2. 패키지 인스톨</h3>    
<h3 style="text-align:left">3. 어벤져스 웹크롤</h3>  
<h3 style="text-align:left">4. 감정사전 불러오기</h3>  
<h3 style="text-align:left">5. 키워드 파싱 및 추출</h3>  
<h3 style="text-align:left">6. 시각화</h3>  

--- &twocol w1:30% w2:70% .new-background

## 목차

*** =left
<h4><br></h4>
<h3 style="text-align:left">1. R 기초 세팅</h3>
<h3 style="text-align:left">2. 패키지 인스톨</h3>    
<h3 style="text-align:left">3. 어벤져스 웹크롤</h3>  
<h3 style="text-align:left">4. 감정사전 불러오기</h3>  
<h3 style="text-align:left">5. 키워드 파싱 및 추출</h3>  
<h3 style="text-align:left">6. 시각화</h3>  

*** =right
<center><img src="assets/img/result_graph.png" height="500" width="600"></center>
---

--- .dark .segue .nobackground
## 1. R 기초 세팅

--- .new-background

## 1. R 기초 세팅

```r
if (.Platform$OS.type == "unix") { 
  ##  코드와 파일 디렉토리
  user_path = "/Users/kimhyungjun/repo/daum_movie/" 
  ##  그래프 폰트
  graph_fonts = "Malgun Gothic"
  par(family=graph_fonts)
  ##  텍스트 인코딩
  fileEncoding = "UTF-8"
} else {
  user_path = "C:/Users/kimhyungjun/repo/daum_movie/"   
  windowsFonts(malgun = windowsFont("맑은고딕"))
  graph_fonts = "malgun"
  fileEncoding = "CP949"
}

setwd(user_path)
```

--- .dark .segue .nobackground
## 2. 패키지 인스톨

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
install.packages(c("rvest","stringr","dplyr","tm","qgraph"),
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
```

--- .dark .segue .nobackground
## 3. 어벤져스 웹크롤

--- .new-background

## 3. 어벤져스 웹크롤

* 웹사이트
1. 웹브라우저 열기(e.g. Firefox, Chorme, Safari, Internet Explorer)
2. 웹사이트 입력(e.g. http://movie.daum.net)
- 사용자는 client (페이지, 이미지, 텍스트를 웹 서버로 요청함)
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
## Response [http://www.google.co.kr/?gfe_rd=cr&ei=A1hQVeWdJ4ig8wexx4DIDw]
##   Date: 2015-05-11 16:19
##   Status: 200
##   Content-Type: text/html; charset=EUC-KR
##   Size: 18.3 kB
## <!doctype html><html itemscope="" itemtype="http://schema.org/WebPage" l...
## window.google.vel.lu&&window.google.vel.lu(a),d.src=a,google.li=g+1)};go...
## function _gjh(){!_gjuc()&&window.google&&google.x&&google.x({id:"GJH"},f...
## if (!iesg){document.f&&document.f.q.focus();document.gbqf&&document.gbqf...
## }
## })();</script><div id="mngb">    <div id=gbar><nobr><b class=gb1>검색</b> ...
## });})();</script> </div> </span><br clear="all" id="lgpd"><div id="lga">...
## </div></div></div><br></div><form action="/search" name="f"><table cellp...
```

--- .new-background

## 다음 영화

http://movie.daum.net

<left><img src="assets/img/daum_movie.png" height="550" width="550"></left>

--- .new-background .modal

## 어벤져스 (1페이지 웹크롤)


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
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810919&amp;type=after" title="댓글달기">극장수만 왕창 차지하고 재미는 완죤히 없는 영화                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[2]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810883&amp;type=after" title="댓글달기">역시 어벤져스였어요 깨고 부수고 싸우는 영화를 좋아해서 마블 영웅들 영화는 거의다 본 것 같은데 어벤져스는 그 영웅들이 다 나와서 눈이 혀강했어요 점점 발전하는 컴퓨터 그래픽과 캐릭터들을 볼 수 있어서 좋고 다음편이 기대돼요                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[3]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810765&amp;type=after" title="댓글달기">제작비를 한국서 뽑아가려는 허리우드 영화.. 이제 그만보자.. 그저 혼란스러운 영화일 뿐..                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[4]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810764&amp;type=after" title="댓글달기">전편보다는 확실히 약하다. 하지만 마블 대서사시의 스토리 상 한번쯤은 캐릭터와 스토리 정리가 필요했다. 어벤저스3와 캡틴아메리카 시빌워를 위한 반석을 다져주는데 의미가 있는 작품. 쿠키 영상에서 타노스의 짧은 독백 "I'll do it myself" 한마디가 인피니티 워에 대한 기다림을 즐겁게 만들어 줬다.                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[5]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810755&amp;type=after" title="댓글달기">영화 메세지가 뭔지? 스릴도 없구 화려한 그래픽만...액션물 보면서 졸기는 처음이엇음...시간 돈낭비...비츄~~                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[6]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810754&amp;type=after" title="댓글달기">전편에 비해 이야기가 흘러가는 구성방식이 조금은 덜 재밌게 느껴지긴 하지만, 마블의 영웅들은 언제나 봐도 즐겁고 유쾌하다. 영화속에서라도 통쾌하고 시원함을 느끼게 해주는 캐릭터들에게 감사하며 아마 3편을 위한 작은 쉼이 아닐까 싶었던 2편이었다. 퀵실버가 허무하게 마무리된것이 다소아쉬운점...                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[7]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810752&amp;type=after" title="댓글달기">블랙위도우가 헐크를 조련하는 맛!                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[8]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810749&amp;type=after" title="댓글달기">기대했던 것보다 좀 지루했음... 볼거리야 뭐 어마어마 하지만 내용이 좀 한데 뭉쳐지지 않는? 그리고 툭툭 끊어진 기분? 여튼 1편이 훠어어얼씬 괜찮았음                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[9]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810733&amp;type=after" title="댓글달기">1편 보셨거나 아니면 마블 히어로물 좋아하신다면 걍 별기대 없이 보세요.&#13;
저같은 경우 마블 히어로물 다 봤고 마블영화는 다 보는편인데 그중에 제일 별로였네요.&#13;
스토리를 억지로 풀어갈려고 대사가 너무 많음. 중간중간 다큐드라마임. ㅎㅎ&#13;
여친은 옆에서 자네요. ㅋㅋㅋ 매드맥볼건 약간 후회도됨. ㅠㅠ&#13;
                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[10]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810687&amp;type=after" title="댓글달기">1편 보고 2편 많이 기대했는데 짜임새가 많이 떨어지는 느낌이에요.  런닝타임이 굉장히 길게 느껴지고. 유머요소가 1편보다 훨씬 많아졌는데 웃기긴 했지만 영화자체는 산만하게 만드는듯 했어요. 그냥...보기 힘들었어요                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[11]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810650&amp;type=after" title="댓글달기">볼만은 한데...쓸데없이 대사가 많아...                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[12]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810638&amp;type=after" title="댓글달기">스크린독점영화. 우리나라 스크린 2281개중 1843개관을 차진한 영화. 우리나라 극장의 현실입니다. 명량,국제시장 등 스크린을 독신한 영화로 보고싶은 영화를 못보는 현실이 화가 납니다. 물론 영화도 별로 재미없습니다.                    <span class="em b">[1]</span>
                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[13]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810619&amp;type=after" title="댓글달기">저는 앞사람 대갈통이 너무 큰지 아니면 그사람이 너무 허리와목을 쭉 빼고 보는건지 그사람 대가리에 자막이 절반이 가려서 환장하는줄..영화끝까지.. 일부러맨뒷줄에 자리잡았는데 되려 손해;  그러다 내용이 지루해서 졸뻔,, 서울배경은 정말 촌스러웠음                     <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[14]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810614&amp;type=after" title="댓글달기">마블을 잘 모르는 사람에겐 스토리가 지루할수도 있고 산만할수도 있다 러닝타임이 꽤 긴편임에도 액션씬이 쉬지않고 나와 끝나고나면 정신없을수도 있다 하지만 마블팬이라면 재밌게 볼 수 있을법한 영화                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

[[15]]
<span class="comment article">
					
										<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810584&amp;type=after" title="댓글달기">그냥 평점이 너무 아깝다 ㅎㅎ                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a>

					</span> 

attr(,"class")
[1] "XMLNodeSet"

--- .new-background


```r
html_nodes(html_nodes(htxt, ".comment"),"a")
```

[[1]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810919&amp;type=after" title="댓글달기">극장수만 왕창 차지하고 재미는 완죤히 없는 영화                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[2]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810883&amp;type=after" title="댓글달기">역시 어벤져스였어요 깨고 부수고 싸우는 영화를 좋아해서 마블 영웅들 영화는 거의다 본 것 같은데 어벤져스는 그 영웅들이 다 나와서 눈이 혀강했어요 점점 발전하는 컴퓨터 그래픽과 캐릭터들을 볼 수 있어서 좋고 다음편이 기대돼요                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[3]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810765&amp;type=after" title="댓글달기">제작비를 한국서 뽑아가려는 허리우드 영화.. 이제 그만보자.. 그저 혼란스러운 영화일 뿐..                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[4]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810764&amp;type=after" title="댓글달기">전편보다는 확실히 약하다. 하지만 마블 대서사시의 스토리 상 한번쯤은 캐릭터와 스토리 정리가 필요했다. 어벤저스3와 캡틴아메리카 시빌워를 위한 반석을 다져주는데 의미가 있는 작품. 쿠키 영상에서 타노스의 짧은 독백 "I'll do it myself" 한마디가 인피니티 워에 대한 기다림을 즐겁게 만들어 줬다.                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[5]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810755&amp;type=after" title="댓글달기">영화 메세지가 뭔지? 스릴도 없구 화려한 그래픽만...액션물 보면서 졸기는 처음이엇음...시간 돈낭비...비츄~~                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[6]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810754&amp;type=after" title="댓글달기">전편에 비해 이야기가 흘러가는 구성방식이 조금은 덜 재밌게 느껴지긴 하지만, 마블의 영웅들은 언제나 봐도 즐겁고 유쾌하다. 영화속에서라도 통쾌하고 시원함을 느끼게 해주는 캐릭터들에게 감사하며 아마 3편을 위한 작은 쉼이 아닐까 싶었던 2편이었다. 퀵실버가 허무하게 마무리된것이 다소아쉬운점...                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[7]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810752&amp;type=after" title="댓글달기">블랙위도우가 헐크를 조련하는 맛!                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[8]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810749&amp;type=after" title="댓글달기">기대했던 것보다 좀 지루했음... 볼거리야 뭐 어마어마 하지만 내용이 좀 한데 뭉쳐지지 않는? 그리고 툭툭 끊어진 기분? 여튼 1편이 훠어어얼씬 괜찮았음                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[9]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810733&amp;type=after" title="댓글달기">1편 보셨거나 아니면 마블 히어로물 좋아하신다면 걍 별기대 없이 보세요.&#13;
저같은 경우 마블 히어로물 다 봤고 마블영화는 다 보는편인데 그중에 제일 별로였네요.&#13;
스토리를 억지로 풀어갈려고 대사가 너무 많음. 중간중간 다큐드라마임. ㅎㅎ&#13;
여친은 옆에서 자네요. ㅋㅋㅋ 매드맥볼건 약간 후회도됨. ㅠㅠ&#13;
                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[10]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810687&amp;type=after" title="댓글달기">1편 보고 2편 많이 기대했는데 짜임새가 많이 떨어지는 느낌이에요.  런닝타임이 굉장히 길게 느껴지고. 유머요소가 1편보다 훨씬 많아졌는데 웃기긴 했지만 영화자체는 산만하게 만드는듯 했어요. 그냥...보기 힘들었어요                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[11]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810650&amp;type=after" title="댓글달기">볼만은 한데...쓸데없이 대사가 많아...                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[12]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810638&amp;type=after" title="댓글달기">스크린독점영화. 우리나라 스크린 2281개중 1843개관을 차진한 영화. 우리나라 극장의 현실입니다. 명량,국제시장 등 스크린을 독신한 영화로 보고싶은 영화를 못보는 현실이 화가 납니다. 물론 영화도 별로 재미없습니다.                    <span class="em b">[1]</span>
                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[13]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810619&amp;type=after" title="댓글달기">저는 앞사람 대갈통이 너무 큰지 아니면 그사람이 너무 허리와목을 쭉 빼고 보는건지 그사람 대가리에 자막이 절반이 가려서 환장하는줄..영화끝까지.. 일부러맨뒷줄에 자리잡았는데 되려 손해;  그러다 내용이 지루해서 졸뻔,, 서울배경은 정말 촌스러웠음                     <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[14]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810614&amp;type=after" title="댓글달기">마블을 잘 모르는 사람에겐 스토리가 지루할수도 있고 산만할수도 있다 러닝타임이 꽤 긴편임에도 액션씬이 쉬지않고 나와 끝나고나면 정신없을수도 있다 하지만 마블팬이라면 재밌게 볼 수 있을법한 영화                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

[[15]]
<a href="http://movie.daum.net/moviedetail/moviedetailNetizenPointComment.do?movieId=73750&amp;ratingId=1810584&amp;type=after" title="댓글달기">그냥 평점이 너무 아깝다 ㅎㅎ                    <img src="http://i1.daumcdn.net/img-contents/movie/2008_home/board/rewrite_btn02.gif" width="13" height="13" alt="댓글달기" class="btn_reply"/></a> 

attr(,"class")
[1] "XMLNodeSet"

--- .new-background 


```r
html_text(html_nodes(html_nodes(htxt, ".comment"),"a"))
```

 [1] "극장수만 왕창 차지하고 재미는 완죤히 없는 영화                    "                                                                                                                                                                                                                                                            
 [2] "역시 어벤져스였어요 깨고 부수고 싸우는 영화를 좋아해서 마블 영웅들 영화는 거의다 본 것 같은데 어벤져스는 그 영웅들이 다 나와서 눈이 혀강했어요 점점 발전하는 컴퓨터 그래픽과 캐릭터들을 볼 수 있어서 좋고 다음편이 기대돼요                    "                                                                               
 [3] "제작비를 한국서 뽑아가려는 허리우드 영화.. 이제 그만보자.. 그저 혼란스러운 영화일 뿐..                    "                                                                                                                                                                                                                    
 [4] "전편보다는 확실히 약하다. 하지만 마블 대서사시의 스토리 상 한번쯤은 캐릭터와 스토리 정리가 필요했다. 어벤저스3와 캡틴아메리카 시빌워를 위한 반석을 다져주는데 의미가 있는 작품. 쿠키 영상에서 타노스의 짧은 독백 \"I'll do it myself\" 한마디가 인피니티 워에 대한 기다림을 즐겁게 만들어 줬다.                    "           
 [5] "영화 메세지가 뭔지? 스릴도 없구 화려한 그래픽만...액션물 보면서 졸기는 처음이엇음...시간 돈낭비...비츄~~                    "                                                                                                                                                                                                  
 [6] "전편에 비해 이야기가 흘러가는 구성방식이 조금은 덜 재밌게 느껴지긴 하지만, 마블의 영웅들은 언제나 봐도 즐겁고 유쾌하다. 영화속에서라도 통쾌하고 시원함을 느끼게 해주는 캐릭터들에게 감사하며 아마 3편을 위한 작은 쉼이 아닐까 싶었던 2편이었다. 퀵실버가 허무하게 마무리된것이 다소아쉬운점...                    "            
 [7] "블랙위도우가 헐크를 조련하는 맛!                    "                                                                                                                                                                                                                                                                          
 [8] "기대했던 것보다 좀 지루했음... 볼거리야 뭐 어마어마 하지만 내용이 좀 한데 뭉쳐지지 않는? 그리고 툭툭 끊어진 기분? 여튼 1편이 훠어어얼씬 괜찮았음                    "                                                                                                                                                          
 [9] "1편 보셨거나 아니면 마블 히어로물 좋아하신다면 걍 별기대 없이 보세요.\r\n저같은 경우 마블 히어로물 다 봤고 마블영화는 다 보는편인데 그중에 제일 별로였네요.\r\n스토리를 억지로 풀어갈려고 대사가 너무 많음. 중간중간 다큐드라마임. ㅎㅎ\r\n여친은 옆에서 자네요. ㅋㅋㅋ 매드맥볼건 약간 후회도됨. ㅠㅠ\r\n                    "
[10] "1편 보고 2편 많이 기대했는데 짜임새가 많이 떨어지는 느낌이에요.  런닝타임이 굉장히 길게 느껴지고. 유머요소가 1편보다 훨씬 많아졌는데 웃기긴 했지만 영화자체는 산만하게 만드는듯 했어요. 그냥...보기 힘들었어요                    "                                                                                            
[11] "볼만은 한데...쓸데없이 대사가 많아...                    "                                                                                                                                                                                                                                                                     
[12] "스크린독점영화. 우리나라 스크린 2281개중 1843개관을 차진한 영화. 우리나라 극장의 현실입니다. 명량,국제시장 등 스크린을 독신한 영화로 보고싶은 영화를 못보는 현실이 화가 납니다. 물론 영화도 별로 재미없습니다.                    [1]\n                    "                                                                   
[13] "저는 앞사람 대갈통이 너무 큰지 아니면 그사람이 너무 허리와목을 쭉 빼고 보는건지 그사람 대가리에 자막이 절반이 가려서 환장하는줄..영화끝까지.. 일부러맨뒷줄에 자리잡았는데 되려 손해;  그러다 내용이 지루해서 졸뻔,, 서울배경은 정말 촌스러웠음                     "                                                           
[14] "마블을 잘 모르는 사람에겐 스토리가 지루할수도 있고 산만할수도 있다 러닝타임이 꽤 긴편임에도 액션씬이 쉬지않고 나와 끝나고나면 정신없을수도 있다 하지만 마블팬이라면 재밌게 볼 수 있을법한 영화                    "                                                                                                            
[15] "그냥 평점이 너무 아깝다 ㅎㅎ                    "                                                                                                                                                                                                                                                                              

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

--- .new-background

## 어벤져스(1페이지 웹크롤)




```r
movie_text <- html_text(html_nodes(html_nodes(htxt, ".comment"),"a"))

movie_text <- str_replace_all(movie_text, "\\[[0-9]+\\]", "")  ##  영화평의 댓글 제거

movie_text <- movie_text[movie_text!=""]  ##  영화평의 댓글 제거
```

--- .new-background .modal

## FOR문 연습 & IF, break 연습


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

--- .new-background .modal

## 자연어 처리 문제

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
str_split("기대했던 것보다 좀 지루했음... 와이프는 재미있다고...", " ")[[1]]
```

```
## [1] "기대했던"      "것보다"        "좀"            "지루했음..."  
## [5] "와이프는"      "재미있다고..."
```

```r
str_sub(str_split("기대했던 것보다 좀 지루했음... 와이프는 재미있다고...", " ")[[1]],1,2)
```

```
## [1] "기대" "것보" "좀"   "지루" "와이" "재미"
```

--- .new-background .modal

## 키워드 추출 (집중!!)

ex <- "기대보다 아주 재밌음!!!!!!!! !! 꼭 봐요~ > < *"

* Step 1) 문장 자르기(split)


```r
str_split(ex, "([ㄱ-ㅎㅏ-ㅢ]|[[:punct:]]|[0-9A-Za-z]|[[:space:]])+" )
```

```
## [[1]]
## [1] "아"       "이"       "왜"       "이렇게"   "재미있냐" ""        
## 
## [[2]]
## [1] ""
## 
## [[3]]
## [1] ""
## 
## [[4]]
## [1] ""
## 
## [[5]]
## [1] "졸리다" ""
```

--- .new-background

## 키워드 추출 (집중!!)

* Step 2) 앞 2글자 추출


```r
str_sub(str_split(ex, "([ㄱ-ㅎㅏ-ㅢ]|[[:punct:]]|[0-9A-Za-z]|[[:space:]])+" )[[1]], 1, 2)
```

```
## [1] "아"   "이"   "왜"   "이렇" "재미" ""
```

--- .new-background

## 키워드 추출 (집중!!)

* Step 3) 맞춤법 교정

```r
plyr::revalue("재밌", c("재밌" =  "재미", "재믿" = "재미"), warn_missing=F)
```

```
## [1] "재미"
```

```r
plyr::revalue("재믿", c("재밌" =  "재미", "재믿" = "재미"), warn_missing=F)
```

```
## [1] "재미"
```

--- .new-background

## 키워드 추출(집중!!)

* Step 4) 다시 한 문장으로 합치기

```r
paste(c("하", "R은", "정말", "신나"), sep= ' ')
```

```
## [1] "하"   "R은"  "정말" "신나"
```

```r
paste(c("하", "R은", "정말", "신나"),collapse=" ")
```

```
## [1] "하 R은 정말 신나"
```

```r
paste(c("하", "R은", "정말", "신나"),collapse="+")
```

```
## [1] "하+R은+정말+신나"
```

--- .new-background

## 키워드 추출(어벤져스)

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

## Co-occurrence Matrix


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
key_vec_sum <- Corpus(DataframeSource(as.data.frame(key_vec_sum)))
```

--- .new-background

## Co-occurrence Matrix


```r
delete_dic <- c('그냥', '너무', '보고', '생각', '정말', '그래', '봤는',
                '나오', '진짜', '평점', '보면', '사람', '시간', '중간', '느낌',
                '이런', '보는', '보다', '편보', '많이', 
                '모르', '우리', '그런', '아니', '이해', '그리', '하는',
                '다음', '역시', '없다')
```

--- .new-background

## Co-occurrence Matrix


```r
key_vec_sum <- TermDocumentMatrix(key_vec_sum,
                                  control = list(
                                  removeNumbers = TRUE,
                                  wordLengths = c(2,Inf),  ##  윈도우 작동 X
                                  removePunctuation = TRUE,
                                  stopwords = delete_dic,
                                  weighting = function(x) weightBin(x)))
                                  
key_vec_sum <- as.matrix(key_vec_sum)
key_vec_sum <- key_vec_sum[nchar(rownames(key_vec_sum))!=1,]  ##  for windows
dim(key_vec_sum)
```

```
## [1] 4264 1737
```

--- .new-background

## Co-occurrence Matrix


```r
key_vec_sum_d <- key_vec_sum[order(rowSums(key_vec_sum), decreasing = T),][1:20,]
co_matrix <- key_vec_sum_d %*% t(key_vec_sum_d)
co_matrix[1:5,1:5]
```

```
##           Terms
## Terms      어벤져스 재미 기대 지루 액션
##   어벤져스      535  165   92   66   59
##   재미          165  491   80   54   33
##   기대           92   80  243   40   31
##   지루           66   54   40  196   37
##   액션           59   33   31   37  161
```

--- .new-background

## Co-occurrence Matrix



```r
groups_list = list()
groups_list$비호감단어 = which(colnames(co_matrix) %in% neg_word)
groups_list$호감단어 = which(colnames(co_matrix) %in% pos_word)
groups_list
```

```
## $비호감단어
## [1]  2  3  4 14 15 16
## 
## $호감단어
## [1]  2  3 13
```

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

<center><img src="assets/img/result_graph.png" height="800" width="800"></center>

