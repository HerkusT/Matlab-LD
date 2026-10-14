
function skaiciuotiFunkcija()
global x y;

y = zeros(size(x));
y(x < 0) = -sin(x(x < 0));
y(x >= 0) = sin(x(x >= 0));
end