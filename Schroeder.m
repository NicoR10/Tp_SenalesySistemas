function [Sdb1,Sdb2,Sdb3,Sdb4,Sdb5,Sdb6,Sdb7,Sdb8,Sdb9] = Schroeder (yfilt1,yfilt2,yfilt3,yfilt4,yfilt5,yfilt6,yfilt7,yfilt8,yfilt9)
% Schroeder por octava
%31
S1 = fliplr(cumsum(fliplr(yfilt1.^2)));
Sdb1=10*log10(S1/max(S1));
%63
S2 = fliplr(cumsum(fliplr(yfilt2.^2)));
Sdb2=10*log10(S2/max(S2));
%125
S3 = fliplr(cumsum(fliplr(yfilt3.^2)));
Sdb3=10*log10(S3/max(S3));
%250
S4 = fliplr(cumsum(fliplr(yfilt4.^2)));
Sdb4=10*log10(S4/max(S4));
%500
S5 = fliplr(cumsum(fliplr(yfilt5.^2)));
Sdb5=10*log10(S5/max(S5));
%1000
S6 = fliplr(cumsum(fliplr(yfilt6.^2)));
Sdb6=10*log10(S6/max(S6));
%2000
S7 = fliplr(cumsum(fliplr(yfilt7.^2)));
Sdb7=10*log10(S7/max(S7));
%4000
S8 = fliplr(cumsum(fliplr(yfilt8.^2)));
Sdb8=10*log10(S8/max(S8));
%8000
S9 = fliplr(cumsum(fliplr(yfilt9.^2)));
Sdb9=10*log10(S9/max(S9));

end
