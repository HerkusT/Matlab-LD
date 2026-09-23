clc;
clear;
close all;

%% 1a. Funkcija f(x) = tan(sin(x)) + sin(tan(x))
x = linspace(-pi, pi, 1000);

f = tan(sin(x)) + sin(tan(x));

figure('Color', 'yellow');
plot(x, f, 'b', 'LineWidth', 1.5);

grid on;
xlabel('x');
ylabel('f(x)');
title('f(x) = tan(sin(x)) + sin(tan(x))');
legend('f(x)', 'Location', 'best');


%% 1b. Dviejų funkcijų atvaizdavimas
x = linspace(-5, 5, 1000);

f1 = exp(0.5*x);
f2 = sin(x);

figure;

plot(x, f1, 'r', 'LineWidth', 1.5);
hold on;
plot(x, f2, 'b', 'LineWidth', 1.5);
hold off;

grid on;
xlabel('x');
ylabel('f(x)');
title('Dviejų funkcijų grafikai');
legend('f(x) = e^{0.5x}', 'f(x) = sin(x)', 'Location', 'best');


%% 1c. Logaritminė ir tiesinė priklausomybė nuo y ašies

% Pirmoji funkcija – logaritminė y ašis
figure;

semilogy(x, f1, 'r', 'LineWidth', 1.5);

grid on;
xlabel('x');
ylabel('f(x)');
title('f(x) = e^{0.5x} – logaritminė y ašis');
legend('f(x) = e^{0.5x}', 'Location', 'best');


% Antroji funkcija – tiesinė y ašis
figure;

plot(x, f2, 'b', 'LineWidth', 1.5);

grid on;
xlabel('x');
ylabel('f(x)');
title('f(x) = sin(x) – tiesinė y ašis');
legend('f(x) = sin(x)', 'Location', 'best');


%% 2. Specializuotų grafikų kūrimas

clc;
clear;
close all;


N = 6;
M = 6;


A = rand(N, M);



figure;

area(A);

grid on;
xlabel('Stulpelio numeris');
ylabel('Reikšmė');
title('N x M matricos ploto diagrama');

legendStrings = cell(1, M);

for i = 1:M
    legendStrings{i} = ['Stulpelis ', num2str(i)];
end

legend(legendStrings, 'Location', 'best');




figure;

surf(A);

grid on;
xlabel('Stulpelio numeris');
ylabel('Eilutės numeris');
zlabel('Reikšmė');
title('N x M matricos paviršius');

colorbar;



%% Papildoma uzduotis 20 variantas

clc;
clear;
close all;


% SIGNALO DUOMENYS IŠ 2-OJO LABORATORINIO DARBO


A = 5.5;          
f = 8;           
sigma = 0.8;      

U1 = 3.5;         
U2 = 1.5;         


t = 0:0.002:1;


s = A * sin(2*pi*f*t);


n = sigma * randn(size(t));

sn = s + n;



filtruotas = sn;


filtruotas(abs(filtruotas) < U2) = 0;




atrinktos_U1 = sn(sn > U1);

disp('3a užduotis - reikšmės, viršijančios U1:');
disp(atrinktos_U1);




max_ind = find(sn(2:end-1) > sn(1:end-2) & ...
               sn(2:end-1) > sn(3:end)) + 1;



min_ind = find(sn(2:end-1) < sn(1:end-2) & ...
               sn(2:end-1) < sn(3:end)) + 1;



max_reiksmes = sn(max_ind);


min_reiksmes = sn(min_ind);




figure('Name', 'Rezultatų grafinis 2D atvaizdavimas');



subplot(2,1,1);


plot(t, sn, '--', 'LineWidth', 1.0);
hold on;


plot(t, filtruotas, '-', 'LineWidth', 1.2);


yline(U1, ':b', 'LineWidth', 1.25);


yline(U2, ':', ...
    'Color', [0.494 0.184 0.556], ...
    'LineWidth', 1.25);


plot(t(max_ind), max_reiksmes, ...
    '^k', ...
    'MarkerSize', 5, ...
    'MarkerFaceColor', 'k');


plot(t(min_ind), min_reiksmes, ...
    'vk', ...
    'MarkerSize', 5, ...
    'MarkerFaceColor', 'k');

hold off;

grid on;

xlabel('Laikas, s');
ylabel('Įtampa, V');

title('Pradinis ir filtruotas signalai');

legend('Pradinis signalas', ...
       'Filtruotas signalas', ...
       'Riba U_1', ...
       'Riba U_2', ...
       'Maksimumai', ...
       'Minimumai', ...
       'Location', 'northwest');


xlim([0 1]);


ylim([min(sn)-0.5 max(sn)+0.5]);



subplot(2,1,2);


ind_U1 = sn > U1;



stem(t(ind_U1), sn(ind_U1), ...
    'LineWidth', 0.8, ...
    'Marker', 'o', ...
    'MarkerSize', 3);

hold on;

yline(U1, ':b', 'LineWidth', 1.25);



plot(t(max_ind), max_reiksmes, ...
    '^k', ...
    'MarkerSize', 6, ...
    'MarkerFaceColor', 'k');

plot(t(min_ind), min_reiksmes, ...
    'vk', ...
    'MarkerSize', 6, ...
    'MarkerFaceColor', 'k');

hold off;

grid on;

xlabel('Laikas, s');
ylabel('Įtampa, V');

title('Pradinio signalo reikšmės, viršijančios U_1');

legend('Reikšmės > U_1', ...
       'Riba U_1', ...
       'Maksimumai', ...
       'Minimumai', ...
       'Location', 'northwest');

xlim([0 1]);

ylim([min(sn)-0.5 max(sn)+0.5]);



disp('============================================');
disp('GRAFINIO ATVAIZDAVIMO REZULTATAI');
disp('============================================');

disp(['U1 = ', num2str(U1), ' V']);
disp(['U2 = ', num2str(U2), ' V']);

disp(['Maksimali pradinio signalo reikšmė = ', ...
      num2str(max(sn)), ' V']);

disp(['Minimali pradinio signalo reikšmė = ', ...
      num2str(min(sn)), ' V']);

disp(['Reikšmių, viršijančių U1, skaičius = ', ...
      num2str(length(atrinktos_U1))]);

disp(['Maksimumų skaičius = ', ...
      num2str(length(max_ind))]);

disp(['Minimumų skaičius = ', ...
      num2str(length(min_ind))]);
