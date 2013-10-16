function fourier(A, sequence, numCoeff)

T=length(sequence);
Ts = 1;

a0 = (2*A*Ts)/T;
a = zeros(1,numCoeff);

for n=1:numCoeff
    a(n) = 2*A*(sin(n * pi  / T)) / (n * pi);
end
disp(a)
curvas(a0, a, numCoeff);

end
    
function curvas(a0, a, numCoeff)

t= -1:0.00001:1;

%A0
f0 = zeros(1,length(t));
f0(:) = a0/2;

plot(t,f0, '-r', 'LineWidth', 2);

grid on;
hold on;

f = zeros(1,numCoeff);

func = zeros(1,length(t));
func(:) = f0(:);
%An
for i=1:numCoeff
    plot(t, a(i)*cos(i*2*pi*t), '-b');
    func = func + a(i)*cos(i*2*pi*t);
end

%Serie com numCoeff coeficientes
plot(t,func, 'black', 'LineWidth', 2);

xlabel('t [ms]');
ylabel('A [Volts]');

end