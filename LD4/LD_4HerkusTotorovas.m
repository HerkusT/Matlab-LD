% Herkus Totorovas
% EEF-25/2
% 2026-09-30
 
clear;
clc;
close all;

% 18 variantas
%%
% a) 

x = linspace(-2, 2, 20);
y = linspace(-2, 2, 20);
z = linspace(-1, 1, 20);


[X, Y, Z] = meshgrid(x, y, z);

F = sin((X.^2 + Y.^2 + Z.^2) / 20) .* ...
    exp(-(X.^2 + Y.^2 + Z.^2));

figure;

slice(X, Y, Z, F, 0, 0, 0);

shading interp;
colormap jet;
colorbar;

xlabel('x');
ylabel('y');
zlabel('z');

title('Trimačio tūrio grafikas');

grid on;


view(45, 45);


% b) 
%%
x = linspace(-1, 1, 100);
y = linspace(-1, 1, 100);

[X, Y] = meshgrid(x, y);

R = sqrt(X.^2 + Y.^2);

Z = exp(R.^2);

figure;

surf(X, Y, Z);

shading interp;
colormap jet;
colorbar;

xlabel('x');
ylabel('y');
zlabel('z');

title('Trimačio paviršiaus grafikas: z(r) = e^{r^2}');

grid on;

view(70, 70);

% Papildoma uzduotis - 17 variantas

%%
x = linspace(-2, 2, 100);
y = linspace(-2, 2, 100);

[X, Y] = meshgrid(x, y);

Z = 1 - (X.^2 + Y.^2);

surf(X, Y, Z);

colormap([0 0 1]);

alpha(0.5);

xlabel('x');
ylabel('y');
zlabel('z');

title('z(x,y) = 1 - (x^2 + y^2)');

grid on;

view(45, 30);