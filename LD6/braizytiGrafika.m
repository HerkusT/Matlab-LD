
function braizytiGrafika()
    global x y;

    figure;
    plot(x, y, '-.k+', 'LineWidth', 1.2, 'MarkerSize', 5);

    grid on;
    xlabel('x');
    ylabel('f(x)');
    title('Funkcijos f(x) grafikas');

    xlim([-2*pi 2*pi]);
    drawnow;
end
