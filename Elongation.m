% Read 3 sets of test results (1405141-1405142-1405143) 
% Three sub-rope samples have been loaded for 3:16:00 hours
% The loading sequences was 
% 1) loading from 0 -> 250 kN and Keep for X min
% 2) loading from 250 -> ~500 kN and Keep for X min
% 3) Un-loading from 500 kN -> 180 kN and Keep for X min
% 4) loading from 0 -> 250 kN and Keep for X min

Data1 = xlsread([cd,'\1405141 raw Data.xlsx'],'1405141','B2:F48600');
F1 = Data1(:,1);
El1 = Data1(:,5);
Data2 = xlsread([cd,'\1405142 raw Data.xlsx'],'1405142','B2:F48600');
F2 = Data2(:,1);
El2 = Data2(:,5);
Data3 = xlsread([cd,'\1405143 raw Data.xlsx'],'1405143','B2:F48600');
F3 = Data3(:,1);
El3 = Data3(:,5);
% Tension [kN]
T11 = F1(1:1200)*12;
T12 = F1(12760:13200)*12;
T13 = F1(24380:24800)*12;
T14 = F1(36000:36300)*12;
E11 = El1(1:1200);
E12 = El1(12760:13200);
E13 = El1(24380:24800);
E14 = El1(36000:36300);
T1A = F1(1:13200)*12;
T1B = F1(24380:36300)*12;
E1A = El1(1:13200);
E1B = El1(24380:36300);
% RUN 2
T21 = F2(1:1200)*12;
T22 = F2(12760:13050)*12;
T23 = F2(23500:24700)*12;
T24 = F2(26000:36050)*12;
E21 = El2(1:1200);
E22 = El2(12760:13050);
E23 = El2(23500:24700);
E24 = El2(26000:36050);
T2A = F2(1:13200)*12;
T2B = F2(24380:36300)*12;
E2A = El2(1:13200);
E2B = El2(24380:36300);
% RUN 3
T31 = F3(1:1500)*12;
T32 = F3(12560:12900)*12;
T33 = F3(23800:24650)*12;
T34 = F3(26000:36000)*12;
E31 = El3(1:1500);
E32 = El3(12560:12900);
E33 = El3(23800:24650);
E34 = El3(26000:36000);
T3A = F3(1:13200)*12;
T3B = F3(24380:36300)*12;
E3A = El3(1:13200);
E3B = El3(24380:36300);

plot (E11,T11,E31,T31,E12,T12,E32,T32,E13,T13,E33,T33,E14,T14,E34,T34)
TS11 = TensionStrain(E11,T11);
TS12 = TensionStrain(E12,T12);
TS13 = TensionStrain(E13,T13);
TS14 = TensionStrain(E14,T14);
TE1A = TensionStrain(E1A,T1A);
TE1B = TensionStrain(E1B,T1B);
xlswrite([cd,'\1405141 raw Data.xlsx'],[TS11(:,1)/100 TS11(:,2) TS12(:,1)/100 TS12(:,2) TS13(:,1)/100 TS13(:,2) TS14(:,1)/100 TS14(:,2)],'1405141','K3:R12');
plot(El1,F1*12,TS11(:,1),TS11(:,2),TS12(:,1),TS12(:,2),TS13(:,1),TS13(:,2),TS14(:,1),TS14(:,2),TE1A(:,1),TE1A(:,2),TE1B(:,1),TE1B(:,2))
% 
TS21 = TensionStrain(E21,T21);
TS22 = TensionStrain(E22,T22);
TS23 = TensionStrain(E23,T23);
TS24 = TensionStrain(E24,T24);
plot(El2,F2*12,TS21(:,1),TS21(:,2),TS22(:,1),TS22(:,2),TS23(:,1),TS23(:,2),TS24(:,1),TS24(:,2))
xlswrite([cd,'\1405142 raw Data.xlsx'],[TS21(:,1)/100 TS21(:,2) TS22(:,1)/100 TS22(:,2) TS23(:,1)/100 TS23(:,2) TS24(:,1)/100 TS24(:,2)],'1405142','K3:R12');

% 
TS31 = TensionStrain(E31,T31);
TS32 = TensionStrain(E32,T32);
TS33 = TensionStrain(E33,T33);
TS34 = TensionStrain(E34,T34);
plot(El3,F3*12,TS31(:,1),TS31(:,2),TS32(:,1),TS32(:,2),TS33(:,1),TS33(:,2),TS34(:,1),TS34(:,2))
xlswrite([cd,'\1405143 raw Data.xlsx'],[TS31(:,1)/100 TS31(:,2) TS32(:,1)/100 TS32(:,2) TS33(:,1)/100 TS33(:,2) TS34(:,1)/100 TS34(:,2)],'1405143','K3:R12');


%%
figure
plot(El1,F1*12,El2,F2*12,El3,F3*12)
xlim([0 4.5])
ylim([0 500*12])
xlabel('Elongation [%]')
ylabel('Tensiojn [kN]')

%%
figure
plot(El1./100,F1*12./(pi/4*0.260^2),El2./100,F2*12./(pi/4*0.260^2),El3./100,F3*12./(pi/4*0.260^2))
xlim([0 0.045])
ylim([0 120000])

%%
plot(1:length(F1),F1*12,1:length(F2),F2*12,1:length(F3),F3*12)
%%
plot(1:length(El1),El1,1:length(El2),El2,1:length(El3),El3)
%%
plot(1:length(F1),F1./El1,1:length(F2),F2./El2,1:length(F3),F3./El3)

%%

figure
plot(El1,F1*12,El2,F2*12,El3,F3*12)
xlim([0 4.5])
ylim([0 6000])

set(gcf,'color',[1 1 1])
ylabel('Tension [kN])')
xlabel('Elongation [%]')
title('Change-in-length performance for WIDP polyester ropes')
legend('Run 1','Run 2','Run 3','location','NW')
grid on


