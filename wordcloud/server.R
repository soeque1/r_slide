# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
    
    datasetInput<-reactive({
        switch(input$dataset, "박근혜"=Park,"이명박"=Lee,
               "노무현"=No)
    })
    
    output$plot1<-reactivePlot(function(){
        dataset<-datasetInput()
        words<-dataset[[1]]
        counts<-dataset[[2]]
        #par(family="AppleGothic")
        wordcloud(words,
                  counts,
                  random.order=F,
                  max.words = input$numbers, 
                  rot.per=.1,
                  min.freq=input$minFreq,
                  scale=c(10,1),
                  colors = brewer.pal(12,"Set3")[-c(1:2)])
    })
    output$summary <- renderPrint({
        dataset<-datasetInput()
        counts = dataset[[2]]
        summary(counts)
    })
})
