library(arules)
transaksi_tabular <- read.transactions(file="transaksi_dqlab_retail.tsv", format="single", sep="\t", cols=c(1,2), skip=1)
data_item <- itemFrequency(transaksi_tabular, type="absolute")
data_item <- sort(data_item, decreasing=TRUE)
data_item <- data_item[1:10]
data_item <- data.frame("Nama.Produk"=names(data_item), "Jumlah"=data_item, row.names=NULL)
write.csv(data_item, file="top10_item_retail.txt", sep=",")
