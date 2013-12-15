function CodificadorManchester(Texto, Clock, VarianciaRuido, Amostras)
%% Codificador Manchester.
%   CodificadorManchester(Dados, Clock, VarianciaRuido, Amostras)
%
%   Exemplos:
%       CodificadorManchester('teste', 10, 1, 100)
%       CodificadorManchester('M', 10, 1, 100)

% Valor binário do M é 01001101

% Conversão de string para vetor de bits
%s = 'teste';
%v_bits = dec2bin(s,8)';
%v_bits = v_bits(:)'-'0'

% Conversão de vetor de bits para string
% s = char(bin2dec(num2str(vec2mat(v_bits, 8),-8)))'

display(sprintf('Texto de Entrada: %s', Texto));

% Transforma o Texto em dados em Binário
Dados = dec2bin(Texto, 8)';
Dados = Dados(:)'-'0';

display(sprintf('Dados de Entrada:\n%s', num2str(Dados)));

% Outros Parâmetros
V = 10;

%% Temporização
Time = length(Dados) * Clock;
Intervalo = Clock / Amostras;
t = [0 : Intervalo : Time];
t = t(1, 1:length(t) - 1);

% Limite para pegar a metade da borda de subida do clock e amostrar o Unipolar aí
Threshold = floor(Amostras / 4);

% Janela com  Sinal Gerado
figure('name', 'Sinal Gerado pelo Transmissor');


%% Sinal de Clock
SinalClock = zeros(1, length(t));
fase = 0;
for i = 1 : length(SinalClock)
    if mod(i - 1, (Amostras / 2)) == 0
        if fase == 1
            fase = 0;
        else
            fase = 1;
        end
    end
    SinalClock(i) = fase;
end
% Plotagem do SinalClock
subplot(4, 1, 1);
plot(t, SinalClock);
title('Sinal do Clock');
xlabel('Tempo (s)');
ylabel('Sinal de Clock (V)');
ylim([-0.5 1.5]);


%% Gera sinal Unipolar
Unipolar = zeros(1, length(t));
for i = 1 : length(Unipolar)
    Unipolar(i) = Dados(ceil(i / Amostras));
end
% Plotagem do Unipolar
subplot(4, 1, 2);
plot(t, Unipolar);
title('Sinal Unipolar');
xlabel('Tempo (s)');
ylabel('Sinal Unipolar (V)');
ylim([-0.5 1.5]);


%% Gera o sinal Manchester
Manchester = V * (xor(SinalClock, Unipolar) - 0.5);

% Plotagem do Manchester
subplot(4, 1, 3);
plot(t, Manchester);
title('Codificação Manchester');
xlabel('Tempo (s)');
ylabel('Sinal Manchester (V)');
ylim(V * [-1 1]);


%% Gera o sinal Manchester Diferencial
% Um "1" é representado fazendo a primeira metade do sinal igual à última metade do sinal anterior
% e um "0" é representado fazendo a primeira metade do sinal ser diferente da segunda metade do sinal anterior.
% Ou, em outras palavras, se no começo do sinal houve mudança de sinal, é 0 e se não houve, é 1.
%
% Fonte: http://pt.wikibooks.org/wiki/Introdu%C3%A7%C3%A3o_%C3%A0_comunica%C3%A7%C3%A3o_entre_computadores_e_tecnologias_de_rede/Como_representar_dados_em_sinais_digitais

ManchesterDiferencial = zeros(1, length(t));

fase = 1;

for i = 1 : length(ManchesterDiferencial)
    if mod(i - 1, (Amostras / 2)) == 0 % Pega o meio do clock
        if SinalClock(i) == 1 % borda de subida
            % Primeira Metade
            if Unipolar(i + Threshold) == 0
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

% Plotagem do Manchester Diferencial
subplot(4, 1, 4);
plot(t, ManchesterDiferencial);
title('Codificação Manchester Diferencial');
xlabel('Tempo (s)');
ylabel('Sinal Man. Dif. (V)');
ylim(V * [-1 1]);


%% Gera os Dados Com Ruído
figure('name', 'Sinais no Meio Físico (com Ruído)');

% Acrescenta um ruído AWGN
Ruido = sqrt(VarianciaRuido) * randn(size(t));

AmplitudeRuido = max(Ruido) + 1;

subplot(4, 1, 1);
plot(t, Ruido);
title('Ruído AWGN');
xlabel('Tempo (s)');
ylabel('Ruído (V)');
ylim(AmplitudeRuido * [-1 1])

% Gera o sinal Manchester com Ruido
ManchesterRuido = Manchester + Ruido;

subplot(4, 1, 3);
plot(t, ManchesterRuido);
title('Codificação Manchester');
xlabel('Tempo (s)');
ylabel('S. Manch. Ruido (V)');
ylim(V * [-1 1]);


% Manchester Diferencial com Ruído
ManchesterDiferencialRuido = ManchesterDiferencial + Ruido;

subplot(4, 1, 4);
plot(t, ManchesterDiferencialRuido);
title('Codificação Manchester Diferencial');
xlabel('Tempo (s)');
ylabel('S. Man. Dif. Ruido (V)');
ylim(V * [-1 1]);


%% Gera os Dados Recebidos
figure('name', 'Dados Recebidos');

% Mostra o Sinal de Clock
subplot(4, 1, 1);
plot(t, SinalClock);
title('Sinal do Clock');
xlabel('Tempo (s)');
ylabel('Sinal de Clock (V)');
ylim([-0.5 1.5]);


% Gera o Unipolar a partir do Manchester
%Manchester = V * (xor(SinalClock, Unipolar) - 0.5);
ManchesterRecebido = zeros(1, length(ManchesterRuido));
for i = 1 : length(ManchesterRecebido)
    if mod(i - 1, (Amostras / 2)) == 0 % Pega o meio do clock
        if (ManchesterRuido(i + Threshold) / V) + 0.5 >= 0.5
            ValorSinal = 1;
        else
            ValorSinal = 0;
        end
    end
    ManchesterRecebido(i) = ValorSinal;
end
UnipolarManchester = xor(SinalClock, ManchesterRecebido);

subplot(4, 1, 3);
plot(t, UnipolarManchester);
title('Sinal Unipolar recebido do Manchester');
xlabel('Tempo (s)');
ylabel('Sinal Unipolar (V)');
ylim([-0.5 1.5]);

% Gera os Dados do Manchester a partir o Unipolar Recebido
DadosManchester = [];
for i = 1 : length(UnipolarManchester)
    if mod(i - 1, Amostras) == 0 % Pega o início do clock
        DadosManchester = [ DadosManchester UnipolarManchester(i + Threshold) ];
    end
end
display(sprintf('Dados de Recebidos (Manchester):\n%s', num2str(DadosManchester)));

Texto_Manchester = char(bin2dec(num2str(vec2mat(DadosManchester, 8),-8)))';
display(sprintf('Texto Recebido (Manchester):\n%s', Texto_Manchester));

BER_Manchester = sum(Dados ~= DadosManchester)/length(Dados) * 100;
display(sprintf('BER dos dados Recebidos (Manchester): %.2f%%', BER_Manchester));

return

% Gera o Unipolar a partir do Manchester Diferencial
ManchesterDiferencial = zeros(1, length(t));

fase = Unipolar(1);

ManchesterDiferencial(1) = fase;

Threshold = floor(Amostras / 4); % Limite para pegar a metade da borda de subida do clock e amostrar o Unipolar aí

for i = 2 : length(ManchesterDiferencial)-1
    if mod(i, (Amostras / 2)) == 0 % Pega o meio do clock
        if SinalClock(i - 1) == 0 & SinalClock(i) == 1 % borda de subida
            % Primeira Metade
            if Unipolar(i + Threshold) == 0
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

subplot(4, 1, 4);
%plot(t, UnipolarRecebido_ManchesterDiferencial);
title('Sinal Unipolar recebido do Manchester Diferencial');
xlabel('Tempo (s)');
ylabel('Sinal Unipolar (V)');
ylim([-0.5 1.5]);


