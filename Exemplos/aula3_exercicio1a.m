function aula3_exercicio1()
    n = 0:1/30:1;         %30 amostras
    f = 1;           % frequencia fundamental
    w = 2 * pi * f;
    x = cos(w*n); % Sinal

N1 = 64;    % Tamanho da FFT
N2 = 128;
N3 = 512;
N4 = 30;

X1 = abs(fft(x,N1)); %FFT do sinal amostrado X, de tamanho N
X2 = abs(fft(x,N2));
X3 = abs(fft(x,N3));

X4 = abs(fft(x,N4));

S1 = [0: (N1 -1)]/N1; % Definicao da escala de frequencias
S2 = [0: (N2 -1)]/N2; % de 0 a 1-1/N
S3 = [0: (N3 -1)]/N3;

S4 = [0: (N4 -1)]/N4;

%subplot(3,1,1);
%plot(S1,X1,'-x'), title('N=64'), axis([0 1 0 20]), grid on;

%subplot(3,1,2);
%plot(S2,X2,'-x'), title('N=128'), axis([0 1 0 20]), grid on;

%subplot(3,1,3);
%plot(S3,X3,'-x'), title('N=512'), axis([0 1 0 20]), grid on;

%subplot(4,1,4);
plot(S4,X4,'-x'), title('N=30'), axis([0 1 0 20]), grid on;
