function CodificadorManchester(Dados, Clock, SNR, Amostras)
%% Codificador Manchester.
%   CodificadorManchester(Dados, Clock, SNR, Amostras)
%
%   Exemplo: CodificadorManchester([0 1 1 0 0 0 1 1], 10, 10, 100)

%s = 'teste';
%a = dec2bin(s,8)';
%a = a(:)'-'0'

% Outros Parâmetros
V = 10;

%% Temporização
Time = length(Dados) * Clock;
Intervalo = Clock / Amostras;
t = [0 : Intervalo : Time];
t = t(1, 1:length(t) - 1);

% Janela 1
figure('name', 'Codificação NRZ');


%% Sinal de Clock
SinalClock = zeros(1, length(t));
fase = 1;
for i = 1 : length(SinalClock)
    if mod(i, (Amostras / 2)) == 0
        if fase == 1
            fase = 0;
        else
            fase = 1;
        end
    end
    SinalClock(i) = fase;
end
% Plotagem do SinalClock
subplot(2, 1, 1);
plot(t, SinalClock);
title('Sinal do Clock');
xlabel('Tempo (s)');
ylabel('Sinal de Clock (V)');
ylim([-0.5 1.5]);


%% Gera sinal NRZ
NRZ = zeros(1, length(t));
for i = 1 : length(NRZ)
    NRZ(i) = Dados(ceil(i / Amostras));
end
% Plotagem do NRZ
subplot(2, 1, 2);
plot(t, NRZ);
title('Sinal NRZ');
xlabel('Tempo (s)');
ylabel('Sinal NRZ (V)');
ylim([-0.5 1.5]);


%% Gera o sinal Manchester
Manchester = V * (xor(SinalClock, NRZ) - 0.5);

% Plotagem
figure('name', 'Codificação Manchester');
% Plotagem do SinalClock
subplot(2, 1, 1);
plot(t, SinalClock);
title('Sinal do Clock');
xlabel('Tempo (s)');
ylabel('Sinal de Clock (V)');
ylim([-0.5 1.5]);
% Plotagem do Manchester
subplot(2, 1, 2);
plot(t, Manchester);
title('Codificação Manchester');
xlabel('Tempo (s)');
ylabel('Sinal codificado com Manchester (V)');
ylim(V * [-1 1]);


%% Gera o sinal Manchester Diferencial
% Um "1" é representado fazendo a primeira metade do sinal igual à última metade do sinal anterior
% e um "0" é representado fazendo a primeira metade do sinal ser diferente da segunda metade do sinal anterior.
% Ou, em outras palavras, se no começo do sinal houve mudança de sinal, é 0 e se não houve, é 1.
%
% Fonte: http://pt.wikibooks.org/wiki/Introdu%C3%A7%C3%A3o_%C3%A0_comunica%C3%A7%C3%A3o_entre_computadores_e_tecnologias_de_rede/Como_representar_dados_em_sinais_digitais

ManchesterDiferencial = zeros(1, length(t));

fase = NRZ(1);

ManchesterDiferencial(1) = fase;

Threshold = floor(Amostras / 4); % Limite para pegar a metada da borda de subida do clock e amostrar o NRZ aí

for i = 2 : length(ManchesterDiferencial)-1
    if mod(i, (Amostras / 2)) == 0 % Pega o meio do clock
        %display(sprintf('%d - SignalClock: %d - NRZ: %d - fase: %d', i-1, SinalClock(i-1), NRZ(i-1), fase));
        %display(sprintf('%d - SignalClock: %d - NRZ: %d - fase: %d', i, SinalClock(i), NRZ(i), fase));
        %display(sprintf('%d - SignalClock: %d - NRZ: %d - fase: %d', i+1, SinalClock(i+1), NRZ(i+1), fase));
        if SinalClock(i - 1) == 0 & SinalClock(i) == 1 % borda de subida
            % Primeira Metade
            if NRZ(i + Threshold) == 0
                if fase == 0
                    fase = 1;
                else
                    fase = 0;
                end
            end
        else % Borda de descida
            % Segunda Metade
            if fase == 0
                fase = 1;
            else
                fase = 0;
            end
        end
    end
    ManchesterDiferencial(i) = fase;
end
ManchesterDiferencial = V * (ManchesterDiferencial - 0.5);

% Plotagem
figure('name', 'Codificação Manchester Diferencial');
% Plotagem do SinalClock
subplot(2, 1, 1);
plot(t, SinalClock);
title('Sinal do Clock');
xlabel('Tempo (s)');
ylabel('Sinal de Clock (V)');
ylim([-0.5 1.5]);
% Plotagem do Manchester Diferencial
subplot(2, 1, 2);
plot(t, ManchesterDiferencial);
title('Codificação Manchester Diferencial');
xlabel('Tempo (s)');
ylabel('Sinal codificado com Manchester Diferencial (V)');
ylim(V * [-1 1]);


%% Acrescenta um ruído

