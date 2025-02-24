% valore bif, ultima condizione R-H
% 0.3822914034


function bif=ausiliario(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2)
% a_1 = 1;    %competizione LG
% a_2 = 1;    %competizione GL
% a_3 = 1;    %competizione intraspecifica Z
% b_1 = 1;    %crescita G
% b_2 = 1;    %crescita L
% c_1 = 1;    %spore da un fungo
% c_2 = 1;    %funghi da un'infezione
% m_1 = 1;    %mortalità Z
% m_2 = 1;    %mortalità F
% m_3 = 1;    %competizione intraspecifica G
% m_4 = 1;    %competizione intraspecifica L
% lambda = 1; %sopravvivenza F su G morti
% g_1 = 1;    %infezione di G
% g_2 = 1;    %infezione di L
% Tutti positivi ^)





% PARAMETRI PER EQUILIBRIO
D = a_1*a_2 - m_3*m_4;
N_1 = a_1*b_2 - b_1*m_4;
N_2 = a_2*b_1 - b_2*m_3;



%PARAMETRI
A = c_2*lambda*g_1;
V = c_2*g_2/m_2;
alfa_1 = g_1*m_4;
alfa_2 = g_1*a_2; 
q = c_2/m_2;
r = lambda*alfa_1*g_1 - alfa_2*g_2;
s = lambda*N_1*g_1 + N_2*g_2;
%EQUILIBRIO
Z = (A*b_1*c_1 - b_1*g_1*m_2 - m_1*m_2*m_3)/(A*c_1*g_1 + a_3*m_2*m_3 - ((g_1)^2)*m_2);
L = 0;
G = (b_1-g_1*Z)/m_3;
F = (A/m_2)*G*Z;
% Matrice M
alfa = G*g_1 + L*g_2 + 2*Z*a_3 + m_1;
h = Z*g_1;
l = Z*g_2;
beta = c_2*(G*lambda*g_1 + L*g_2);
Q = c_2*Z*lambda*g_1;
P = c_2*Z*g_2;
delta = G*g_1;
omega = 2*G*m_3 + L*a_1 + Z*g_1;
xi = G*a_1;
rho = L*a_2;
eta = G*a_2 + 2*L*m_4;
Sigma=alfa^2*(omega-b_1+m_2)-alfa*beta*c_1-alfa*delta*h+alfa*omega^2-2*alfa*omega*b_1+3*alfa*omega*m_2+alfa*((b_1)^2)-3*alfa*b_1*m_2+alfa*((m_2)^2)-beta*omega*c_1+beta*b_1*c_1-beta*c_1*m_2-delta*omega*h+delta*h*b_1-delta*h*m_2+omega^2*m_2-2*omega*b_1*m_2+omega*((m_2)^2)+((b_1)^2)*m_2-b_1*((m_2)^2);
OMEGA=Q*delta*c_1+alfa*omega*m_2-alfa*b_1*m_2-beta*omega*c_1+beta*b_1*c_1-delta*h*m_2;

%CONDIZIONI
cond1 = Z>0;
cond2 = -Z+b_1/g_1;

cond6 = -b_1+omega+m_2+alfa;
cond7 = alfa*omega-alfa*b_1+alfa*m_2-beta*c_1-delta*h+omega*m_2-b_1*m_2;
cond8 = Q*delta*c_1+alfa*omega*m_2-alfa*b_1*m_2-beta*omega*c_1+beta*b_1*c_1-delta*h*m_2;
bif=cond6*cond7-cond8;
end