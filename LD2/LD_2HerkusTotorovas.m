clc;
clear;
close all;

% 20 variantas pagrindine užduotis




v1 = 10:-1:-15;


v2 = log2(v1);


v3 = v1 ./ v2;


v3_stulpelis = v3.';

disp('1 užduotis - galutinis vektorius:');
disp(v3_stulpelis);



Cm1 = [pi/2, pi/2, 3*pi/2];

Cm2 = [-1 1];

Cm3 = [-3 -1 -5];





suma1 = sum(Cm1);
suma2 = sum(Cm2);
suma3 = sum(Cm3);

disp(' ');
disp('2 užduotis - matricų eilučių sumos:');
disp(['Cm1 eilutės suma = ', num2str(suma1)]);
disp(['Cm2 eilutės suma = ', num2str(suma2)]);
disp(['Cm3 eilutės suma = ', num2str(suma3)]);




A = 5.5;       
f = 8;         
sigma = 0.8;
U1 = 3.5;      
U2 = 1.5;      


t = 0:0.002:1;


s = A * sin(2*pi*f*t);


n = sigma * randn(size(t));


sn = s + n;




atrinktos_U1 = sn(sn > U1);

disp(' ');
disp('3a užduotis - reikšmės, viršijančios U1:');
disp(atrinktos_U1);




filtruotas = sn;

filtruotas(abs(filtruotas) < U2) = 0;

disp(' ');
disp('3b užduotis - filtruotas signalas:');
disp(filtruotas);



nefiltruoto_dydis = length(sn);

disp(' ');
disp('3c užduotis:');
disp(['Nefiltruoto signalo dydis = ', num2str(nefiltruoto_dydis)]);




atrinktu_dydis = length(atrinktos_U1);

disp(' ');
disp('3d užduotis:');
disp(['Atrinktų reikšmių dydis = ', num2str(atrinktu_dydis)]);




didziausia = max(filtruotas);
maziausia = min(filtruotas);

disp(' ');
disp('3e užduotis:');
disp(['Didžiausia filtruoto signalo įtampa = ', ...
    num2str(didziausia), ' V']);

disp(['Mažiausia filtruoto signalo įtampa = ', ...
    num2str(maziausia), ' V']);



figure;

plot(t, sn);
grid on;

xlabel('Laikas, s');
ylabel('Įtampa, V');
title('Triukšmingas signalas');


%Papildoma


A = input('Įveskite 12 elementų vektorių A: ');

B = A(10:end);
B = [B A(1:9)];


disp('vektorius B yra:');
disp(B);
