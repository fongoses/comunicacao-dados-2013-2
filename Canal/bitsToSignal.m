function [sinalClock, sinalNRZ, amostras, tensao] = bitsToSignal(dados, clock, amostras, tensao)
%% Converte um array de bits (0s e 1s) em um sinal NRZ-L.
%   [signalClock, signalNRZ, amostras] = bitsToSignal(dados, clock, amostras, tensao)
%
%   Exemplos:
%       [signalClock, signalNRZ, amostras] = bitsToSignal([ 0 1 0 1 0 0 1 1 ], 10, 100, 5)

%% Temporização
time = length(dados) * clock;
intervalo = clock / amostras;
t = [0 : intervalo : time];
t = t(1, 1:length(t) - 1);

%% Sinal de Clock
sinalClock = zeros(1, length(t));
fase = 0;
for i = 1 : length(sinalClock)
    if mod(i - 1, (amostras / 2)) == 0
        if fase == 1
            fase = 0;
        else
            fase = 1;
        end
    end
    sinalClock(i) = fase;
end

%% Gera sinal NRZ
sinalNRZ = zeros(1, length(t));
for i = 1 : length(sinalNRZ)
    sinalNRZ(i) = dados(ceil(i / amostras));
end
sinalNRZ = tensao * (sinalNRZ - 0.5);