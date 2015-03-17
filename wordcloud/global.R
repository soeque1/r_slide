library("wordcloud")
# library("KoNLP")
# 
# pre_processing<-function(data, start_line, end_line)
# {
#     bodydata<-data[start_line:end_line]
#     bodydata<-gsub("<P align=justify></P>","",bodydata)
#     bodydata<-str_replace_all(bodydata, "[[:punct:]]|[a-zA-Z]|[\t+]", " ")
#     bodydata<-str_replace_all(bodydata, "[[:space:]][[:space:]]+", "")
#     bodydata<-bodydata[bodydata!=""&bodydata!=" "]
#     return(bodydata)
# }
# 
# wordcloud_proc<-function(bodydata)
# {
#     nouns<-sapply(bodydata,extractNoun)
#     wordcount <- table(unlist(nouns))
#     wordcount <- wordcount[nchar(names(wordcount))!=1]
#     return(wordcount)
# }
# 
# 
# #Load Data
# data<-readLines("http://www.hani.co.kr/arti/politics/politics_general/575390.html",encoding="utf-8")
# start_line = grep("<h4><font color=#006699>박근혜 대통령 취임사 전문</font></h4>",data)
# end_line = grep("감사합니다. <P align=justify></P>",data)
# 
# bodydata = pre_processing(data, start_line, end_line)
# wordcount = wordcloud_proc(bodydata)
# Park<-data.frame(names = rownames(wordcount), value = wordcount)
# 
# data<-readLines("http://stock.mt.co.kr/view/mtview.php?type=1&no=2008022510425323553",encoding="utf-8")
# data<-iconv(data,"cp949","utf-8")
# start_line = grep("선진화의 길,다 함께 열어갑시다.<br />",data)
# end_line = grep("2008년 2월 25일 대한민국 대통령 이명박",data)
# 
# bodydata = pre_processing(data, start_line, end_line)
# wordcount = wordcloud_proc(bodydata)
# Lee<-data.frame(names = rownames(wordcount), value = wordcount)
# 
# data<-readLines("http://legacy.www.hani.co.kr/section-003000000/2003/02/003000000200302251026287.html",encoding="utf-8")
# data<-iconv(data,"cp949","utf-8")
# start_line = grep("존경하는 국민 여러분.    오늘 저는 대한민국의 제16대 대통령에 취임하기 위해 이 자리에 섰습니다.",data)
# end_line = grep("대통령 노 무 현",data)
# 
# bodydata = pre_processing(data, start_line, end_line)
# wordcount = wordcloud_proc(bodydata)
# No<-data.frame(names = rownames(wordcount), value = wordcount)

Park<-read.table("./data/park.csv",sep=",",header=T, encoding = 'UTF-8')
Lee<-read.table("./data/lee.csv",sep=",",header=T, encoding = 'UTF-8')
No<-read.table("./data/no.csv",sep=",",header=T, encoding = 'UTF-8')

options(shiny.usecairo = FALSE)

font_home <- function(path = '') file.path('~', '.fonts', path)
if (Sys.info()[['sysname']] == 'Linux' &&
    system('locate NanumGothic.ttc') != 0 &&
    !file.exists(font_home('NanumGothic.ttc'))) {
    if (!file.exists('NanumGothic.ttc'))
        shiny:::download(
            'https://github.com/soeque1/r_slide/releases/download/v0.10.1/NanumGothic.ttc',
            'NanumGothic.ttc'
        )
    dir.create(font_home())
    file.copy('NanumGothic.ttc', font_home())
    system2('fc-cache', paste('-f', font_home()))
}
rm(font_home)
