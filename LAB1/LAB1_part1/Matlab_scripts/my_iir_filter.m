fs=10000 %% sampling frequency
f1=500;  %% first sinewave freq (in band)
f2=4500; %% second sinnewave freq (out band)

for i=5:5

    N=1; %% filter order
    nb=i; %% number of bits

    T=1/500; %% maximum period
    tt=0:1/fs:10*T; %% time samples

    x1=sin(2*pi*f1*tt); %% first sinewave
    x2=sin(2*pi*f2*tt); %% second sinewave

    x=(x1+x2)/2; %% input signal

    [bi, ai, bq, aq]=myiir_design(N, nb) %% filter design

    y=filter(bq, aq, x); %% apply filter

    %% plots
    figure
    plot(tt,x1,'-');
    hold on
    plot(tt,x2,'r-');
    plot(tt,x, 'b-');
    plot(tt, y, 'c-');

    legend('x1', 'x2', 'x', 'y')

    %% quantize input and output
    xq=floor(x*2^(nb-1));
    idx=find(xq==2^(nb-1));
    xq(idx)=2^(nb-1)-1;

    yq=floor(y*2^(nb-1));
    idy=find(yq==2^(nb-1));
    yq(idy)=2^(nb-1)-1;

    %% save input and output
    num = int2str(i);
    fp=fopen(strcat('samples_', num, '.txt'),'w');
    fprintf(fp,'%d\n', xq);
    fclose(fp);

    fp=fopen(strcat('resultsm_', num,'.txt'), 'w');
    fprintf(fp, '%d\n', yq);
    fclose(fp);
end
