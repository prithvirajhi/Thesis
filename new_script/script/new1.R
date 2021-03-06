#gaps_br<-c(7, 7.5, 7.5, 4.5, 9)
gaps_flow<-c(2.5, 2, 1.5, 2.5, 1.5, 3.5, 3.5, 4, 3, 1.5, 2.5, 3, 2.5, 2, 2.5)
#gaps<-rbind(gaps_br, gaps_flow)
gaps<-rbind(gaps_flow)
pdf(file="/home/prithvirajhi/new_thesis/Thesis/new_script/R/Predduration.pdf", width=8, height=3.25)
barplot(gaps, xlab="Experiment", ylab="Handoff duration (s)", col=c("green"), beside=TRUE, ylim=c(0, 6), names.arg=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"), legend.text=c("ÆtherFlow configuration with prediction"), args.legend=list(x="top", cex=0.5))
dev.off()
