function tsr = trans_rate(V)

tsr

etas = 100;
etar = 60;

Vs = 2.25;
% A positive sign for Vr leads to the oscillations
Vr = -1.5;

if V > 0
    % Is this V - Vr supposed to be V + Vr because Vr is supposed to be the
    % absolute of it?
    tsr = exp(etar*(V - Vr));
else 
    tsr = exp(-etas*(V - Vs));
end


end