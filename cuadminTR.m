function [reEDT,reT10,reT20,reT30] = cuadminTR(Sdb)
%se le ingresa la integral de schoreder en db y devuelve los coef. de la recta que mejor
%aproxima.
%% se busca el principio y el final de la recta (T30) en schroeder
%inicio
global Fs
miT30=0;
mfT30=0;
for i=1:length(Sdb)
    if Sdb(i) >= -5.1 && Sdb(i) <= -5
miT30 = i; %muestra de inicio
break
    end
end
%final
for i=1:length(Sdb)
    if Sdb(i) >= -35.1 && Sdb(i) <= -35
mfT30 = i; %muestra final
break
    end
end

% corto en el inicio y en el final la int de schroeder
if miT30==0
    reT30 ='N/C';
else
Sdbc= Sdb(miT30:mfT30); %cuadrados minimos por proyeccion ortogonal

x1=(1:length(Sdbc));
x = [x1;ones(1,length(Sdbc))];
xt=transpose(x);

yt= transpose(Sdbc);
j=(x*xt);
q=(x*yt);

jinv = inv(j);

p30= jinv*q;

%verificamos los coeficientes con polyfit
poT30=polyfit(x1,Sdbc,1);

%construyo recta T30
a=(1:length(Sdb));
reT30 = p30(1)*(a-miT30) + p30(2);
end


%% se busca el principio y el final de la recta (T10) en schroeder
%inicio
miT10=0;
mfT10=0;
for i=1:length(Sdb)
    if Sdb(i) >= -5.1 && Sdb(i) <= -5
miT10 = i; %muestra de inicio
break
    end
end
%final
for i=1:length(Sdb)
    if Sdb(i) >= -15.1 && Sdb(i) <= -15
mfT10 = i; %muestra final
break
    end
end

% corto en el inicio y en el final la int de schroeder
if miT10==0
    reT10 ='N/C';
else
Sdbc= Sdb(miT10:mfT10);

% cuadrados minimos por proyeccion ortogonal
x1=(1:length(Sdbc));
x = [x1;ones(1,length(Sdbc))];
xt=transpose(x);

yt= transpose(Sdbc);
j=(x*xt);
q=(x*yt);

jinv = inv(j);

p10= jinv*q;

%verificamos los coeficientes con polyfit
poT10=polyfit(x1,Sdbc,1);

%construyo recta T10
a=(1:length(Sdb));
reT10 = p10(1)*(a-miT10) + p10(2);
end
%% se busca el principio y el final de la recta (T20) en schroeder

%inicio
miT20 = 0;
mfT20 = 0;
for i=1:length(Sdb)
    if Sdb(i) >= -5.1 && Sdb(i) <= -5
miT20 = i; %muestra de inicio
break
    end
end
%final
for i=1:length(Sdb)
    if Sdb(i) >= -25.1 && Sdb(i) <= -25
mfT20 = i; %muestra final
break
    end
end

% corto en el inicio y en el final la int de schroeder
if miT20==0
    reT20 = 'N/C';
else
Sdbc= Sdb(miT20:mfT20);

% cuadrados minimos por proyeccion ortogonal

x1=(1:length(Sdbc));
x = [x1;ones(1,length(Sdbc))];
xt=transpose(x);

yt= transpose(Sdbc);
j=(x*xt);
q=(x*yt);

jinv = inv(j);

p20= jinv*q;

%verificamos los coeficientes con polyfit
poT20=polyfit(x1,Sdbc,1);

%construyo recta T20
a=(1:length(Sdb));
reT20 = p20(1)*(a-miT20) + p20(2);
end
%% se busca el principio y el final de la recta (EDT) en schroeder
%inicio
miEDT = 0;
mfEDT = 0;
for i=1:length(Sdb)
    if Sdb(i) >= -0.1 && Sdb(i) <= 0
miEDT = i; %muestra de inicio
break
    end
end
%final
for i=1:length(Sdb)
    if Sdb(i) >= -10.1 && Sdb(i) <= -10
mfEDT = i; %muestra final
break
    end
end

% corto en el inicio y en el final la int de schroeder
if miEDT == 0
    reEDT = 'N/C';
else
Sdbc= Sdb(miEDT:mfEDT);
% cuadrados minimos por proyeccion ortogonal
x1=(1:length(Sdbc));
x = [x1;ones(1,length(Sdbc))];
xt=transpose(x);

yt= transpose(Sdbc);
j=(x*xt);
q=(x*yt);

jinv = inv(j);

pEDT= jinv*q;

%verificamos los coeficientes con polyfit
poEDT=polyfit(x1,Sdbc,1);

%construyo recta EDT
a=(1:length(Sdb));
reEDT = pEDT(1)*(a-miEDT) + pEDT(2);
end
end

