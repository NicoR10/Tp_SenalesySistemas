function [TR10] = tiempo10(recta)

%% TR10
if isnumeric(recta)== 0
    TR10='N/C';
else
    mit10=0;
    mft10=0;
for i=1:length(recta)
    if recta(i)<=-5 && recta(i)>=-5.1
mit10= i;
    end
    if recta(i)<=-15 && recta(i)>=-15.1
mft10= i;
    end
end
global Fs
MT10= (mft10/Fs) - (mit10/Fs);
if MT10==0
    TR10='N/C'
else
TR10=6*MT10;
end
end
end