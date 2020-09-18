function I = Just_IV_trial(V,Iexp)

% Run    I = Just_IV_trial(ResetV, ResetI);     in the command window to run it
%   +  run    global a Rs Vct Io lamda    in the command window to allow
%      for the key variables to be inspected in the workspace

global a Rs Vct Io lamda

I  = zeros(202,1);
lamda = zeros(202,1);
lamda(1) = 1;

a  = zeros(202,1);
Io = zeros(202,1);
Rs = zeros(202,1);

R = zeros(202,1);

Vct = zeros(202,1);

% Parameter definition - Specific variables tested in LTSpice

Ri = 100;

amin = 1.5;
amax = 1.7;

Iomin = 2.2*10^-5;
Iomax = 1.3*10^-3;

Rsmin = 100;
Rsmax = 117;

dt = 10^(-10);

for i = 1:202
    
a(i)  = amin +(amax-amin)*lamda(i);
Io(i) = Iomin +(Iomax-Iomin)*lamda(i);
Rs(i) = Rsmin +(Rsmax-Rsmin)*lamda(i);

R(i) = Rs(i)+Ri;

% I-V curve --- Here lies a bug: variables a, Io, and Rs have normal values
% but do not result in legitimate I values
I(i) = (Io(i)/ (2*a(i)*R(i))) * (lambertw((a(i)* R(i)* Io(i)/ 2)* exp(a(i)* V(i)))+ lambertw((-a(i)* R(i)* Io(i)/ 2)* exp(-a(i)* V(i))));


Vct(i) = V(i)-Ri*I(i);

lamda(i+1) = (lamda(i)-heaviside(Vct(i)))*exp(-dt/trans_rate(Vct(i)))+heaviside(Vct(i));

end   

% Initial points (1:10) introduce a peculiarity in the resulting graph so are
% being removed for simplification
x = V(11:202);
yexp = Iexp(11:202);
ymod = I(11:202);

plot(x, yexp);
hold on;
plot(x, ymod);

end
