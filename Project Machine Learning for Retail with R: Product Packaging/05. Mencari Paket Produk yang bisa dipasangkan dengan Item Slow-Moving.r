library(arules)
transaksi_tabular <- read.transactions(file="transaksi_dqlab_retail.tsv",
format="single", sep="\t", cols=c(1,2), skip=1)
rules <- apriori(transaksi_tabular, parameter = 
list(supp=10/length(transaksi_tabular), confidence=0.1,
minlen=2, maxlen=3))
A <- subset(rules,rhs %in% "Tas Makeup")
B <- subset(rules,rhs %in% "Baju Renang Pria Anak-anak")
A <- head(sort(A,by="lift",decreasing=TRUE),3)
B <- head(sort(B,by="lift",decreasing=TRUE),3)
AB <- c(A,B)
inspect(AB)
write(AB, file="kombinasi_retail_slow_moving.txt")
