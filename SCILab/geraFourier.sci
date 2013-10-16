function geraFourier(T, A, coef)
    // Intervalo (vetor com 2/passo posições)
    passo = 0.001;
    t = -1:passo:1;

    // Frequência Angular 2*%pi*(1/T)
    w = 2*%pi;
    
    // Número de bits 1 no período
    Ts = 1;
    
    // Definir o tamanho do f (cria um vetor com o mesmo tamanho de t)
    f = zeros(t);
    
    // Configura o Plot
    clf();
    set(gca(),"grid",[1 1]);
    set(gca(),"auto_clear","off");
    xtitle("Fourier(T, A, coef)");
    xlabel("Tempo");
    ylabel("Amplitude");
    
    // Imprime a componente DC (coeficiente do a0)
    a0 = geraCoef(0, Ts, T, A);
    f0 = zeros(t) + a0/2;
    plot(t, f0, "-r");

    // Acumula f(t) (componente DC)
    f = f + f0;
    
    // Acumular os coeficientes de f para montar a série
    for i = 1:(coef-1)
        // Gera uma fi(t) para cada coeficiente
        a(i) = geraCoef(i, Ts, T, A);
        fa(i,:) = a(i)*cos(i*w*t);
        plot(t, fa(i,:), "-b");
        
        // Acumula f(t)
        f = f + fa(i,:);
    end;
    
    // Imprime f(t)
    plot(t, f, "-k");
endfunction