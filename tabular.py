print("REMEMBER before running the script, edit the tab list")
#is organized by column


tab = [["Architercture", "classic", "csa", "pparch", "stage2 reg+compile", "stage2 reg+compile_ultra", "mbe compile", "mbe compile ultra"],
		["period_min ns", 1.56, 4.28, 1.45, 0.79, 1.52, 1.94, 1.64],
		["area (um^2)", 4047.7, 4851.6, 4088.4, 4924.7, 4188.2, 5360.4, 5327.7]]


fp = open("tabular.txt","w")
fp.write("\\begin{tabular}{")
for i in tab:
	fp.write("|l")
fp.write("|}\n")
for row in range(len(tab[0])):
	fp.write("\t\\hline\n\t")
	for col in range(len(tab)):
		fp.write("{}".format(tab[col][row]))
		if col != len(tab)-1:
			fp.write(" & ")
	fp.write("\\\\\n")
fp.write("\t\\hline\n")
fp.write("\\end{tabular}")
print("Done")
