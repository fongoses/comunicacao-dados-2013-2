function analise_fft
    % Amostragem
    n = 0:1 / 30:1; % 30 amostras

    % Usando a Frequencia fundamental = 1
    f1 = 1; % frequência fundamental
    w1 = 2 * pi * f1;
    x1 = cos(w1 * n); % sinal
    fft1 = abs(fft(x1)); % Cálculo da FFT para a frequencia

    % Usando a Frequencia fundamental = 3
    f3 = 3; % frequência fundamental
    w3 = 2 * pi * f3;
    x3 = cos(w3 * n); % sinal
    fft3 = abs(fft(x3)); % Cálculo da FFT para a frequencia
    
    % Plota os Gráficos
    subplot(2, 2, 1);
    hold on;
    plot(n, x1, '-x'), title('Sinal com f = 1'), grid on;
    stem(n, x1);
    hold off;

    subplot(2, 2, 2);
    plot(n, fft1, '-x'), title('FFT com f = 1'), axis([0 1 0 20]), grid on;
    
    subplot(2, 2, 3);
    hold on;
    plot(n, x3, '-x'), title('Sinal com f = 3'), grid on;
    stem(n, x3);
    hold off;

    subplot(2, 2, 4);
    plot(n, fft3, '-x'), title('FFT com f = 3'), axis([0 1 0 20]), grid on;