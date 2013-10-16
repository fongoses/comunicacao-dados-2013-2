function aula3_exercicio2()
n = 0:1/29:1;         %30 amostras
f = 1;           % frequencia fundamental
w = 2 * pi * f;


    x1 = cos(w*n); % Sinal
    x2 = [x1 x1]; % Sinal
    x3 = [x1 x1 x1]; % Sinal

N = 90;

X1 = abs(fft(x1,N)); %FFT do sinal amostrado X, de tamanho N
X2 = abs(fft(x2,N));
X3 = abs(fft(x3,N));

S = [0: (N -1)]/N; % Definicao da escala de frequencias de 0 a 1-1/N

subplot(3,1,1);
plot(S,X1,'-x'), title('1 Periodos'), axis([0 1 0 50]), grid on;

subplot(3,1,2);
plot(S,X2,'-x'), title('2 Periodos'), axis([0 1 0 50]), grid on;

subplot(3,1,3);
plot(S,X3,'-x'), title('3 Periodos'), axis([0 1 0 50]), grid on;
