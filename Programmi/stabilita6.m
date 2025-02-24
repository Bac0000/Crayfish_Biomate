function tab = stabilita6(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2)
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




% ammissibilità
% e5 = m_1 < L5*(c_1*V - g_2);
% stabilità
% ee5 = (Z5 > (c_1*c_2*g_2*L - m_2*g_2*L - m_1*m_2)/(2*a_3*m_2)) && (Z5 > (-2*a_1*L + b_1)/g_1);

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
%% E6
Z = (-s*q*c_1 + D*m_1 + N_1*g_1 + N_2*g_2)/(r*q*c_1 - D*a_3 - alfa_1*g_1 + alfa_2*g_2);
G = (alfa_1*Z + N_1)/D;
L = (-alfa_2*Z + N_2)/D;
F = q*Z*(r*Z + s)/D;
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

%CONDIZIONI
cond1 = Z;
cond2 = (r*Z+s)/D;
cond3 = (N_1 + alfa_1*Z)/D;
cond4 = (N_2 - alfa_2*Z)/D;


A_0 = -P*delta*rho*c_1 + Q*delta*eta*c_1 - Q*delta*b_2*c_1 + alfa*eta*omega*m_2 - alfa*eta*b_1*m_2 - alfa*omega*b_2*m_2 - alfa*rho*xi*m_2 + alfa*b_1*b_2*m_2 - beta*eta*omega*c_1 + beta*eta*b_1*c_1 + beta*omega*b_2*c_1 + beta*rho*xi*c_1 - beta*b_1*b_2*c_1 - delta*eta*h*m_2 + delta*l*rho*m_2 + delta*h*b_2*m_2;
A_1 = Q*delta*c_1 + alfa*eta*omega - alfa*eta*b_1 + alfa*eta*m_2 - alfa*omega*b_2 + alfa*omega*m_2 - alfa*rho*xi + alfa*b_1*b_2 - alfa*b_1*m_2 - alfa*b_2*m_2 - beta*eta*c_1 - beta*omega*c_1 + beta*b_1*c_1 + beta*b_2*c_1 - delta*eta*h + delta*l*rho + delta*h*b_2 - delta*h*m_2 + eta*omega*m_2 - eta*b_1*m_2 - omega*b_2*m_2 - rho*xi*m_2 + b_1*b_2*m_2;
A_2 = eta*alfa + alfa*omega - alfa*b_1 - b_2*alfa + alfa*m_2 - beta*c_1 - delta*h + eta*omega - eta*b_1 + eta*m_2 - b_2*omega + omega*m_2 - rho*xi + b_2*b_1 - b_1*m_2 - b_2*m_2;
A_3 = -b_2 + eta - b_1 + omega + m_2 + alfa;
A_3*A_2*A_1 - A_1^2 - A_3^2*A_0;
if (cond1>0) && (cond2>0) && (cond3>0) && (cond4>0)
   if (A_0 > 0) && (A_1 > 0) && (A_2 > 0) && (A_3 > 0) && (A_3*A_2 > A_1) && (A_3*A_2*A_1 > A_1^2 + A_3^2*A_0)
       tab="stabile";
   else
       tab="instabile";
   end
else
    tab="non ammissibile" ;
end 

end