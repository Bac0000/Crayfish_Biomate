function tab = stabilita5(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2)
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
L = b_2/m_4;
Z = 1/a_3 * (-m_1 + c_1*V*L- g_2*L);
F = V*L*Z;
G = 0;
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

%MI SA CHE NON é MAI VERO INVECE!!!


%CONDIZIONI
cond1 =  L*(c_1*V - g_2)-m_1;


cond6 = Z-(c_1*c_2*g_2*L - m_2*g_2*L - m_1*m_2)/(2*a_3*m_2);
cond7 = Z-(-a_1*L + b_1)/g_1;



if (cond1>0) 
   if (cond6>0) && (cond7)>0
       tab="stabile";
   else
       tab="instabile";
   end
else
    tab="non ammissibile" ;
end 

end