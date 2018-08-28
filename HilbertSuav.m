function [Hfdb1,Hfdb2,Hfdb3,Hfdb4,Hfdb5,Hfdb6,Hfdb7,Hfdb8,Hfdb9] = HilbertSuav (yfilt1,yfilt2,yfilt3,yfilt4,yfilt5,yfilt6,yfilt7,yfilt8,yfilt9)
%% 31
xan1 = hilbert(yfilt1); 
H1 = abs(xan1);   
%filtro de promedio movil para suavizar mas a la envolvente de hilbert
b = 1000;
B = ones(1,b)/b;
Hf1 = filter(B, 1,H1);
Hfdb1 = 20*log10(Hf1/max(Hf1));
%% 63
xan2 = hilbert(yfilt2); 
H2 = abs(xan2);   
%filtro de promedio movil para suavizar mas a la envolvente de hilbert
b = 1000;
B = ones(1,b)/b;
Hf2 = filter(B, 1,H2);
Hfdb2 = 20*log10(Hf2/max(Hf2));
%% 125
xan3 = hilbert(yfilt3); 
H3 = abs(xan3);   
%filtro de promedio movil para suavizar mas a la envolvente de hilbert
b = 1000;
B = ones(1,b)/b;
Hf3 = filter(B, 1,H3);
Hfdb3 = 20*log10(Hf3/max(Hf3));
%% 250
xan4 = hilbert(yfilt4); 
H4 = abs(xan4);   
%filtro de promedio movil para suavizar mas a la envolvente de hilbert
b = 1000;
B = ones(1,b)/b;
Hf4 = filter(B, 1,H4);
Hfdb4 = 20*log10(Hf4/max(Hf4));
%% 500
xan5 = hilbert(yfilt5); 
H5 = abs(xan5);   
%filtro de promedio movil para suavizar mas a la envolvente de hilbert
b = 1000;
B = ones(1,b)/b;
Hf5 = filter(B, 1,H5);
Hfdb5 = 20*log10(Hf5/max(Hf5));
%1000
xan6 = hilbert(yfilt6); 
H6 = abs(xan6);   
%filtro de promedio movil para suavizar mas a la envolvente de hilbert
b = 1000;
B = ones(1,b)/b;
Hf6 = filter(B, 1,H6);
Hfdb6 = 20*log10(Hf6/max(Hf6));
%2000
xan7 = hilbert(yfilt7); 
H7 = abs(xan7);   
%filtro de promedio movil para suavizar mas a la envolvente de hilbert
b = 1000;
B = ones(1,b)/b;
Hf7 = filter(B, 1,H7);
Hfdb7 = 20*log10(Hf7/max(Hf7));
%4000
xan8 = hilbert(yfilt8); 
H8 = abs(xan8);   
%filtro de promedio movil para suavizar mas a la envolvente de hilbert
b = 1000;
B = ones(1,b)/b;
Hf8 = filter(B, 1,H8);
Hfdb8 = 20*log10(Hf8/max(Hf8));
%8000
xan9 = hilbert(yfilt9); 
H9 = abs(xan9);   
%filtro de promedio movil para suavizar mas a la envolvente de hilbert
b = 1000;
B = ones(1,b)/b;
Hf9 = filter(B, 1,H9);
Hfdb9 = 20*log10(Hf9/max(Hf9));
end
