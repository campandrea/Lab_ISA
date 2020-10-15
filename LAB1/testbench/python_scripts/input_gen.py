import functions as f

#main
sine1=f.genSinewave(500)
sine2=f.genSinewave(4500)
sum=f.genInputSignal(sine1,sine2)
sum_SFP= f.convertToSFP(sum, 5, 20)
f.writeListOnFile("prova.txt",sum_SFP)
