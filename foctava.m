function [yf1,yf2,yf3,yf4,yf5,yf6,yf7,yf8,yf9] = foctava (ycortada)
%filtra la señal por octava
%"a" es la banda de octava central del filtro desde 31 hasta 16000 Hz.
%ej: a=1 => 31 Hz ; a=2 => 63 ; a=3 => 125 ; etc.
% 1 <= a <= 10

BandsPerOctave = 1;
N = 20;           % Filter Order
F0 = 1000;       % Center Frequency (Hz)
global Fs      % Sampling Frequency (Hz)
f = fdesign.octave(BandsPerOctave,'Class 0','N,F0',N,F0,Fs);
 
 
F0 = validfrequencies(f);
Nfc = length(F0);
 
for i=1:Nfc
    f.F0 = F0(i);
    OctaveFilterBank(i) = design(f,'butter');
end

yf1 = filter(OctaveFilterBank(1),ycortada);
yf2 = filter(OctaveFilterBank(2),ycortada);
yf3 = filter(OctaveFilterBank(3),ycortada);
yf4 = filter(OctaveFilterBank(4),ycortada);
yf5 = filter(OctaveFilterBank(5),ycortada);
yf6 = filter(OctaveFilterBank(6),ycortada);
yf7 = filter(OctaveFilterBank(7),ycortada);
yf8 = filter(OctaveFilterBank(8),ycortada);
yf9 = filter(OctaveFilterBank(9),ycortada);
end
%fvtool(oneThirdOctaveFilterBank(17));