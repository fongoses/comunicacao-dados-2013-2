function r = geraCoef(n, Ts, T, A)
    a0 = (2*A*Ts)/T;
    if n == 0
        r = a0;
    else
        r = a0*(sen((pi*n*Ts)/T)/((pi*n*Ts)/T));
    end
end