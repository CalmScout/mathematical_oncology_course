%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%FRACCIONAMIENTOS EN RT %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
Sf = 0.45;        %FRACCI�N DE SUPERVIVENCIA POR DOSIS
TAU = 20;        %TIEMPO CARACTER�STICO DE DUPLICACI�N (EN D�AS)
rho = log(2)/TAU;   
Nmax = 3e10;      %N�MERO M�XIMO DE C�LULAS EN EL TUMOR
Ncrit = 2.1e10;   %N�MERO CR�TICO DE C�LULAS
N0 = 1e9;         %N�MERO INICIAL DE C�LULAS
NDOSIS = 30;      %N�MERO DE DOSIS DE RT
TFINAL = 2000;     %RANGO DE TIEMPOS A EXPLORAR

% COMPARA EL COMPORTAMIENTO DE LAS DOSIS DADAS CADA DELTA1 CON CADA DELTA2
% 1) RADIOTERAPIA DADA CADA DELTA1 D�AS EMPEZANDO EN EL D�A 7

N1(1) = N0;
DELTA1 = 1;
t1 = 7:DELTA1:7+(NDOSIS-1)*DELTA1;
time1 = [t1(end):0.1:TFINAL];
for j=1:length(t1)-1
    N1(j+1) = Sf*N1(j)*exp(rho*(t1(j+1)-t1(j)))/(1+(N1(j)/Nmax)*(exp(rho*(t1(j+1)-t1(j)))-1));
end;

Number1 = N1(j+1)*exp(rho*(time1-t1(j+1)))./(1+(N1(j+1)/Nmax)*(exp(rho*(time1-t1(j+1)))-1));
subplot(211);
plot(t1,N1,'o',time1,Number1,'-',[0 TFINAL],[Ncrit Ncrit]);

% 2) RADIOTERAPIA DADA CADA DELTA2 D�AS EMPEZANDO EN EL D�A 7
N2(1) = N0;
DELTA2 = 2;
t2 = 7:DELTA2:7+(NDOSIS-1)*DELTA2;
time2 = [t2(end):0.1:TFINAL];
for j=1:length(t2)-1
    N2(j+1) = Sf*N2(j)*exp(rho*(t2(j+1)-t2(j)))/(1+(N2(j)/Nmax)*(exp(rho*(t2(j+1)-t2(j)))-1));
end;
Number2 = N2(j+1)*exp(rho*(time2-t2(j+1)))./(1+(N2(j+1)/Nmax)*(exp(rho*(time2-t2(j+1)))-1));
subplot(212);
plot(t2,N2,'o',time2,Number2,'-',[0 TFINAL],[Ncrit Ncrit]);