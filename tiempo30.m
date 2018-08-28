function [TR30] = tiempo30(r)

%% TR30
if isnumeric(r)== 0
    TR30='N/C';
else
    mit30=0;
    mft30=0;
for i=1:length(r)
    if r(i)<=-5 && r(i)>=-5.1
mit30= i;
    end
    if r(i)<=-35 && r(i)>=-35.1
mft30= i;
    end
end
global Fs
MT30= (mft30/Fs) - (mit30/Fs);
if MT30==0
    TR30='N/C';
else
TR30=2*MT30;
end
end
end