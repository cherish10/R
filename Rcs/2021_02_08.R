install.packages("KoNLP")
install.packages("http://cran.rstudio.com/bin/windows/contrib/3.4/KoNLP_0.80.1.zip",
                 repos = NULL)

install.packages("Sejong")
install.packages("wordcloud")
install.packages("tm")

install.packages("hash")
install.packages("tau")
install.packages("devtools")
install.packages("rJava")
install.packages("RJDBC")

library(KoNLP)
library(rJava)
library(RJDBC)
library(tm)
library(wordcloud)

facebook<-file("C:/Users/user/Desktop/Rcs/Rwork-2nd/Part-II/facebook_bigdata.txt",
               encoding = "UTF-8")
facebook_data <- readLines(facebook)
head(facebook_data)

user_dic<-data.frame(term=c("R프로그래밍","페이스북","김진성","소셜네크워크"),
                     tag = 'ncn')
buildDictionary(ext_dic = 'sejong',user_dic=user_dic)

paste(extractNoun(
  '김진성은 많은 사람과 소통을 위해서 소셜네크워크에 가입하였습니다'),
  collapse = "")

exNouns<-function(x){paste(extractNoun(as.character(x)),collapse = " ")}
facebook_nouns<-sapply(facebook_data,exNouns)
facebook_nouns[1]

myCorpus<-Corpus(VectorSource(facebook_nouns))

myCorpus

myCorpusPrepro<-tm_map(myCorpus,removePunctuation)
myCorpusPrepro<-tm_map(myCorpusPrepro,removeNumbers)
myCorpusPrepro<-tm_map(myCorpusPrepro,tolower)
myCorpusPrepro<-tm_map(myCorpusPrepro,removeWords,stopwords('english'))
inspect(myCorpusPrepro[1:5])

myCorpusPrepro_term<-
  TermDocumentMatrix(myCorpusPrepro,
                     control = list(wordLenghts = c(4,16)))
myCorpusPrepro_term

myTerm_df<-as.data.frame(as.matrix(myCorpusPrepro_term))
dim(myTerm_df)

wordResult<-sort(rowSums(myTerm_df),decreasing = TRUE)
wordResult[1:10]

myCorpusPrepro<-tm_map(myCorpus,removePunctuation)
myCorpusPrepro<-tm_map(myCorpusPrepro,tolower)
myStopwords = c(stopwords('english'),"사용","하기");
myCorpusPrepro<-tm_map(myCorpusPrepro,removeWords,myStopwords)

myCorpusPrepro_term<-
  TermDocumentMatrix(myCorpusPrepro,
                     control = list(wordLenghts = c(4,16)))
myTerm_df<-as.data.frame(as.matrix(myCorpusPrepro_term))

wordResult<-sort(rowSums(myTerm_df),decreasing = TRUE)
wordResult

myName<- names(wordResult)
word.df<-data.frame(word=myName,freq = wordResult)
str(word.df)
pal<-brewer.pal(12,"Paired")

wordcloud(word.df$word,word.df$freq,scale = c(5,1),
          min.freq = 3,random.order = F,
          rot.per = .1, colors = pal,family="malgun")

marketing<-file("C:/Users/user/Desktop/Rcs/Rwork-2nd/Part-II/marketing.txt",
                encoding = "UTF-8")
marketing2 <-readLines(marketing)
close(marketing)
head(marketing2)

lword<-Map(extractNoun,marketing2)
length(lword)
lword<-unique(lword)
length(lword)

lword <-sapply(lword,unique)
length(lword)
lword

filter1<-function(x){
  nchar(x)<= 4 && nchar(x) >=2 && is.hangul(x)
}

filter2<-function(x){Filter(filter1,x)}

lword<-sapply(lword,filter2)
lword

word <- list(c("홍길동","이순","만기","김"),
             c("대한민국","우리나라대한민국","한국","resu"))
class(word)

filter1 <-function(x){
  nchar(x) <=4 && nchar(x) >= 2 && is.hangul(x)
}

filter2 <-function(x){
  Filter(filter1,x)
}

filterword <- sapply(word,filter2)
filterword

install.packages("arules")
library(arules)

wordtran<-as(lword,"transactions")
wordtran

tranrules<-apriori(wordtran,
                   parameter = list(supp=0.25,conf = 0.05))
inspect(tranrules)

data("Adult")
Adult
str(Adult)
dim(Adult)
inspect(Adult)

aprl<-apriori(Adult,
              parameter = list(support= 0.1, target="frequent"),
              appearance = list(none=
                                  c("income=small","income=large"),
                                default="both"))
aprl
inspect(aprl)

apr2 <-apriori(Adult,
               parameter = list(support=0.1,target="rules"),
               appearance = list(none=
                                   c("income=small","income=large"),
                                 default="both"))
apr2

apr3 <-apriori(Adult,
               parameter = list(supp=0.5, conf= 0.9, target="rules"),
               appearance = list(none=
                                   c("income=small","income=large"),
                                 default="both"))
apr3

data("Adult")
rules<-apriori(Adult)
inspect(rules[10])

rules<-labels(tranrules,ruleSep=" ")
rules

rules<-sapply(rules,strsplit," ",USE.NAMES = F)
rules

rulemat<-do.call("rbind",rules)

class(rulemat)

install.packages("igraph")
library(igraph)

ruleg<-graph.edgelist(rulemat[c(12:59),],directed = F)
ruleg

plot.igraph(ruleg,vertex.label = V(ruleg)$name,
            vertex.label.cex = 1.2, vertex.label.color='black',
            vertex.size = 20, vertex.color='green',
            vertex.frame.color = "red")

install.packages("httr")

library(httr)

install.packages("XML")
library(XML)

url <-"https://media.daum.net"
web<-GET(url)
web

html<-htmlTreeParse(web,useInternalNodes = T,trim = T,encoding="utf-8")
rootNode<-xmlRoot(html)
news<-xpathSApply(rootNode,"//a[@class='link_txt']",xmlValue)
news

news_pre <- gsub("[\r\n\t]",'',news)
news_pre <- gsub("[[:punct:]]",'',news)
news_pre <- gsub("[[:cntrl:]]",'',news)
news_pre <- gsub('[a-z]+','',news)
news_pre <- gsub('[A-Z]+','',news)
news_pre <- gsub('\\s+','',news)

news_pre

news_data <-news_pre[1:59]
news_data

setwd("C:/Rcs")
write.csv(news_data,"news_data.csv",quote = F)

news_data <-read.csv("news_data.csv",header = T,stringsAsFactors = F)
str(news_data)

names(news_data)<-c("no","next_text")
head(news_data)

news_text<-news_data$next_text
news_text

user_dic<-data.frame(term=c("펜데믹","코로나19","타다"),tag='ncn')
buildDictionary(ext_dic = 'sejong',user_dic = user_dic)

exNouns<-function(x){paste(extractNoun(x),collapse = " ")}

news_nouns<- sapply(news_text,exNouns)
news_nouns

str(news_nouns)

newsCorpus<-Corpus(VectorSource(news_nouns))
newsCorpus

inspect(newsCorpus[1:5])

TDM<-TermDocumentMatrix(newsCorpus,control = list(wordLengths=c(4,16)))
TDM

tdm.df<-as.data.frame(as.matrix(TDM))
dim(tdm.df)

wordResult<-sort(rowSums(tdm.df),decreasing = TRUE)
wordResult[1:10]

library(wordcloud)
myNames<-names(wordResult)
myNames

df<-data.frame(word=myNames,freq = wordResult)
head(df)

pal<-brewer.pal(12,"Paired")
wordcloud(df$word,df$freq,min.freq = 2,
          random.order = F,scale = c(4,0.7),
          rot.per = .1,colors = pal,family="malgun")
