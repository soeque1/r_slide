# Define UI
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("대통령 취임사 전문 분석"),

  sidebarPanel(
      selectInput("dataset", "Chose a dataset:",
                  choices=c("박근혜","이명박","노무현")),
      
	numericInput("numbers","Numbers of Words to view:",30),
	sliderInput("minFreq","Minimum Frequency of Words to view:", value=2, min=1, max=15)
#	,numericInput("obs","Numbers of Words to view:",10),
	,submitButton("Update View"),
br(),
code("대통령 취임사 전문 source"),
br(),
br(),
tags$a(href="http://www.hani.co.kr/arti/politics/politics_general/575390.html", "박근혜 (한겨례)"),
br(),
tags$a(href="http://stock.mt.co.kr/view/mtview.php?type=1&no=2008022510425323553", "이명박 (머니투데이)"),
br(),
tags$a(href="http://legacy.www.hani.co.kr/section-003000000/2003/02/003000000200302251026287.html", "노무현 (한겨례)")
	),

   mainPanel(
   plotOutput("plot1","100%","600px"),
   verbatimTextOutput("summary")
  )
))
