%%%% PARAMETRI MODELLO 

%% POPOLAZIONI
Z = 1;
F = 1;
G = 1;
L = 1;

%% PARAMETRI
a_1 = 1;    %competizione LG
a_2 = 1;    %competizione GL
a_3 = 1;    %competizione intraspecifica Z
b_1 = 1;    %crescita G
b_2 = 1;    %crescita L
c_1 = 1;    %spore da un fungo
c_2 = 1;    %funghi da un'infezione
m_1 = 1;    %mortalità Z
m_2 = 1;    %mortalità F
m_3 = 1;    %competizione intraspecifica G
m_4 = 1;    %competizione intraspecifica L
lambda = 1; %sopravvivenza F su G morti
g_1 = 1;    %infezione di G
g_2 = 1;    %infezione di L
% Tutti positivi ^

%% PARAMETRI INTRODOTTI
D = a_1*a_2 - m_3*m_4;
N_1 = a_1*b_2 - b_1*m_4;
N_2 = a_2*b_1 - b_2*m_3;
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
% Tutti positivi ^

M = [-alfa c_1 -s -l; beta -m_2 Q P; -delta 0 b_1-omega -xi; 0 0 -rho b_2-eta];




%%%% EQUILIBRI
% TRUE = 1 e FALSE = 0

%% E0

%% E1
% stabilità
t=stabilita1(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2)
%% E2
% stabilità

%% E3
% ammissibilità
(a_1 > b_1*m_4/b_2 && a_2 > b_2*m_3/b_1) || (a_1 < b_1*m_4/b_2 && a_2 < b_2*m_3/b_1);
% stabilità
stabilita3(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2)
%% E4
% ammissibilità
  % bisogna controllare conti;
% stabilità
stabilita4(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2)
%% E5
% ammissibilità
m_1 < L*(c_1*V - g_2); % L5????
% stabilità
stabilita5(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2)
%% E6
% ammissibilità
(Z > 0) && (Z/D > h/r) && ((N_1 + alfa_1*Z)/D > 0) && ((N_2 - alfa_2*Z)/D > 0); % Z6????
% stabilità



stabilita(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2)