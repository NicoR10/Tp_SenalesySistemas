function [TR20] = tiempo20(recta)

%% TR20
if isnumeric(recta)== 0
    TR20='N/C';
else
    mit20=0;
    mft20=0;
for i=1:length(recta)
    if recta(i)<=-5 && recta(i)>=-5.1
mit20= i;
    end
    if recta(i)<=-25 && recta(i)>=-25.1
mft20= i;
    end
end
global Fs
MT20= (mft20/Fs) - (mit20/Fs);
if MT20==0
    TR20='N/C'
else
TR20=3*MT20;
end
end
end