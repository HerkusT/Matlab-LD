% Herkus Totorovas
% EEF-25/2
% 2026-10-12


clc;
clear;

%% 1,

disp('1 UZDUOTIS.');


C = {5, 'SVEIKI', 3.14, 2+3i; ...
    true, [1 2 3], -7, 'Labas'; ...
    0, 1+0i, [], 8.5};

L = cellfun(@(x) isnumeric(x) && isreal(x), C);

disp('Celiu masyvas:');
disp(C);

disp('Logine matrica (1 - realusis, 0 - nerealusis):');
disp(L);

kiekis = sum(L(:));

disp('Realiuju skaiciu kiekis:');
disp(kiekis);

figure;
cellplot(C);
title('Celiu masyvas');


%% 2. 

disp(' ');
disp('2 UZDUOTIS. KVADRATINE FUNKCIJA');

while true

    
    a = input('Iveskite a: ');
    b = input('Iveskite b: ');
    c = input('Iveskite c: ');
    x = input('Iveskite x: ');

    
    f = a*x^2 + b*x + c;

    fprintf('Funkcijos reiksme f = %.4f\n', f);

    
    if a == 2 && b == 2 && c == 1 && x == 1
        disp('Visos reikiamos reiksmes ivestos!');
        break;
    else
        disp('Bandykite dar karta.');
    end

end

disp('Programa baige darba.');

%% Papildoma uzduotis

disp(' ');
disp('3 UZDUOTIS. ATSITIKTINIAI SKAICIAI');

A = [];
B = [];

while true
 
    a = round(rand*5);
    b = round(rand*7);

    A(end+1) = a;
    B(end+1) = b;
   
    fprintf('A = %d, B = %d\n', a, b);
    
    if a == b
        disp('Sugeneruoti vienodi skaiciai!');
        break;
    end
end

figure;
plot(1:length(A), A, '-o');
hold on;
plot(1:length(B), B, '-x');
grid on;

xlabel('Ciklo numeris');
ylabel('Sugeneruoto skaiciaus reiksme');
title('Atsitiktiniu skaiciu kitimas');
legend('round(rand*5)', 'round(rand*7)');
hold off;

