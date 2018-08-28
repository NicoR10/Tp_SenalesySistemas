function [ycort] = corteimp (y)  

A=vec2mat(y,100);
a=transpose(A);
B=rms(a);
C=max(B);
fi=find(B==C);

%% corte inicial

if fi<= 50 %verifica si el impulso esta previamente cortado
    ycort=y;
else
Bdb=10*log10(abs(B));

pdb = mean(Bdb(1:length(Bdb)/3));
pmdb = max(Bdb(1:length(Bdb)/3));

um = (pdb + pmdb)/2;

for i=1:length(Bdb)
   if Bdb(i) > um + 10
       mc = find (Bdb==Bdb(i));
       break
   end
end

%% corte final
for i=1:length(Bdb)
if Bdb(i) < pdb
       mf = find (Bdb==Bdb(i));
       if mf>mc
          mf = find (Bdb==Bdb(i));  
       break
       end
end
end
ycort=y((mc-1)*100:(mf)*100);
end
ycort=transpose(ycort);
end


        

