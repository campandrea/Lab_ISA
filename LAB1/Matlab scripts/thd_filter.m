clear
close all
clc
format short

f_out=fopen("thd_values.txt",'w');
for i=10:10
    s1="resultsC_";
    s2=int2str(i);
    filename=strcat(s1,s2,'.txt');
    f_in=fopen(filename,'r');
    x=fscanf(f_in,"%d"); 
    fclose(f_in);
    res=thd(x');
    fprintf(f_out,"order = 8\t n_bit = %d\t thd = %.1f\n",i,res);
end
fclose(f_out);