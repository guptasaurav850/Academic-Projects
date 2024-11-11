getwd()
library(readxl)
fivesec <- read_excel("C:/Users/gupta/SSSIHL-Academics/SSSIHL-MBA-Sem-3/Advanced Financial Analytics/FIVE_SECURITIES.xlsx",sheet = 1, range = "a2:f494")
library(timeSeries)
library(quantmod)
library(PerformanceAnalytics)
library(ggplot2)
library(readxl)
library(zoo)
library(fPortfolio)
sec_prices <- data.frame(fivesec)
head(sec_prices)
class(sec_prices)
sec_prices$dt

#In rows
row.names(sec_prices)<- sec_prices$dt
head(sec_prices)
head(sec_prices[1:2])
#converting into a timeseries
sec_prices1 <-as.timeSeries(sec_prices)
portfolio1<-Return.calculate(sec_prices1, method = 'discrete')
portfolio1
#discrete = arithmetic mean
head(portfolio1)
#to remove a range
portfolio1<- na.omit((portfolio1))
efficient_frontier<- portfolioFrontier(portfolio1,'setRiskFreeRate<-'(portfolioSpec(),0.05/252),constraints = "longonly")
plot(efficient_frontier, c(1,2,3,7,8))
#1 is efficient frontier
#2 is Min-Variance Portfolio
#3 is Tangent Portfolio
#4 is Risk Return on Single Assets
#5 is Equal Weighted Portfolio
#8 is Sharpe Ratio

