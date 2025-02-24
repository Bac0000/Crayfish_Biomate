function Q=equilibrio_instabili(stab,a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2)
% Restituisce l'eq degli equilibri stabili e instabili nella config dei parametri data,
% da usare solamente dopo aver usato la function stabilita, il cui output 
% è una lista che ci dice la natura dei 7 equilibrià
% visto che MatLab è bello ma da alcuni lati fa schifo,
% non esiste il classico append di Python
% quindi ci tocca mettere una matrice con tutti gli equilibri
% se uno non esiste verrà messo a zero

Q=zeros(1,4);
n=1;
if (stab(2)=="stabile" || stab(2)=="instabile" )
    P=[0,0,0,b_2/m_4];
    Q(n,:)=P;
    n=n+1;
end
if (stab(3)=="stabile" || stab(3)=="instabile")
    P=[0,0,b_1/m_3,0];
    Q(n,:)=P;
    n=n+1;
end
if (stab(4)=="stabile" || stab(4)=="instabile")
    D = a_1*a_2 - m_3*m_4;
    N_1 = a_1*b_2 - b_1*m_4;
    N_2 = a_2*b_1 - b_2*m_3;
    L=N_2/D;G=N_1/D;F=0;Z=0;
    P=[Z,F,G,L];
    Q(n,:)=P;
    n=n+1;
end
if (stab(5)=="stabile" || stab(5)=="instabile")
    A = c_2*lambda*g_1;
    Z = (A*b_1*c_1 - b_1*g_1*m_2 - m_1*m_2*m_3)/(A*c_1*g_1 + a_3*m_2*m_3 - ((g_1)^2)*m_2);
    L = 0;
    G = (b_1-g_1*Z)/m_3;
    F = (A/m_2)*G*Z;
    P=[Z,F,G,L];
    Q(n,:)=P;
    n=n+1;
end
if (stab(6)=="stabile" || stab(6)=="instabile")
    V = c_2*g_2/m_2;
    L = b_2/m_4;
    Z = 1/a_3 * (-m_1 + c_1*V*L- g_2*L);
    F = V*L*Z;
    G = 0;
    P=[Z,F,G,L];
    Q(n,:)=P;
    n=n+1;
end
if (stab(7)=="stabile" || stab(7)=="instabile")
    D = a_1*a_2 - m_3*m_4;
    N_1 = a_1*b_2 - b_1*m_4;
    N_2 = a_2*b_1 - b_2*m_3;
    alfa_1 = g_1*m_4;
    alfa_2 = g_1*a_2; 
    q = c_2/m_2;
    r = lambda*alfa_1*g_1 - alfa_2*g_2;
    s = lambda*N_1*g_1 + N_2*g_2;

    Z = (-s*q*c_1 + D*m_1 + N_1*g_1 + N_2*g_2)/(r*q*c_1 - D*a_3 - alfa_1*g_1 + alfa_2*g_2);
    G = (alfa_1*Z + N_1)/D;
    L = (-alfa_2*Z + N_2)/D;
    F = q*Z*(r*Z + s)/D;
    P=[Z,F,G,L];
    Q(n,:)=P;
    n=n+1;
end 

end