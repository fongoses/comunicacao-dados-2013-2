function r = geraCoef(n, Ts, T, A)
    a0 = (2*A*Ts)/T;
    if n == 0 then
        r = a0;
    else
        r = a0*(sin((%pi*n*Ts)/T)/((%pi*n*Ts)/T));
    end;
endfunction