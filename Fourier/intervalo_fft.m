function intervalo_fft
    % Amostragem (intervalos)
    %n = 0:1 / 30:1; % 30 amostras
    n = 0:1 / 29:1; % 30 amostras
    s = 0:1 / 89:1;

    % Usando a Frequencia fundamental = 1
    f = 1; % frequ�ncia fundamental
    w = 2 * pi * f;

    x0 = cos(w * n);                   % sinal BASE com 1 per�odo
    x1 = [x0 zeros(1,30) zeros(1,30)]; % sinal com 1 per�odo
    x2 = [x0 x0 zeros(1,30)];          % sinal com 2 per�odos
    x3 = [x0 x0 x0];                   % sinal com 3 per�odos

    % N�o-Normalizado
    fft1 = abs(fft(x1, 90)); % C�lculo da FFT para o intervalo 1
    fft2 = abs(fft(x2, 90)); % C�lculo da FFT para o intervalo 2
    fft3 = abs(fft(x3, 90)); % C�lculo da FFT para o intervalo 3

    % Plota os Gr�ficos
    subplot(3, 2, 1);
    hold on;
    plot(s, x1, '-x'), title('Sinal com 1 periodo'), grid on;
    stem(s, x1);
    hold off;
    subplot(3, 2, 2);
    plot(s, fft1, '-x'), title('FFT com 1 Per�odo'), axis([0 1 0 50]), grid on;

    subplot(3, 2, 3);
    hold on;
    plot(s, x2, '-x'), title('Sinal com 2 periodos'), grid on;
    stem(s, x2);
    hold off;
    subplot(3, 2, 4);
    plot(s, fft1, '-x'), title('FFT com 2 Per�odos'), axis([0 1 0 50]), grid on;

    subplot(3, 2, 5);
    hold on;
    plot(s, x3, '-x'), title('Sinal com 3 periodos'), grid on;
    stem(s, x3);
    hold off;
    subplot(3, 2, 6);
    plot(s, fft3, '-x'), title('FFT com 3 Per�odos'), axis([0 1 0 50]), grid on;
