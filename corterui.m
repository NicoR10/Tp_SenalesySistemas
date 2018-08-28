function [ycort] = corterui (y)
A=vec2mat(y,100);
a=transpose(A);
B=rms(a);

Bdb=10*log10(abs(B));

pdb = mean(Bdb(1:1000));
pmdb = max(Bdb(1:1000));

um = (pdb + pmdb)/2;

if pmdb > - 10
    S = y;
else

for i=1:length(Bdb)
   if Bdb(i) > um + 15
       mc = find (Bdb==Bdb(i));
       break
   end
end
for i=1:length(Bdb)
if Bdb(i) < pdb
       mf = find (Bdb==Bdb(i));
       if mf>mc
          mf = find (Bdb==Bdb(i));  
       break
       end
end
end
S=y((mc)*100:mf*100);
end

A=vec2mat(S,100);
a=transpose(A);
B=rms(a);

Bdb=10*log10(abs(B));

pdb = mean(Bdb(1:1000));
pmdb = max(Bdb(1:1000));

um = (pdb + pmdb)/2;

for i=1:length(Bdb)
   if Bdb(i) < um && Bdb(i) > um - 0.3
       mc = find (Bdb==Bdb(i));
   end
end

ycort=S((mc-40)*100:end);
ycort=transpose(ycort);
end



        

