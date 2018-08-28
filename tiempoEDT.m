function [EDT] = tiempoEDT(recta)

%% EDT
if isnumeric(recta)== 0
    EDT='N/C';
else
    miEDT=0;
    mfEDT=0;
for i=1:length(recta)
    if recta(i)<=0 && recta(i)>=-0.1
miEDT= i;
    end
    if recta(i)<=-10 && recta(i)>=-10.1
mfEDT= i;
    end
end

global Fs
MTEDT= (mfEDT/Fs) - (miEDT/Fs);
if MTEDT == 0
    EDT='N/C';
else
EDT=6*MTEDT;
end
end
end