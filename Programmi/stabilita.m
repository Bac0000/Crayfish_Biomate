function [t1,t2,t3,t4,t5,t6,t7,lista] = stabilita(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2)
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

t1="instabile";
t2=stabilita1(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2);
t3=stabilita2(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2);
t4=stabilita3(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2);
t5=stabilita4(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2);
t6=stabilita5(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2);
t7=stabilita6(a_1,a_2,a_3,b_1,b_2,c_1,c_2,m_1,m_2,m_3,m_4,lambda,g_1,g_2);
v=["E0"];
n=2;
if (t2=="stabile")
 v(n)="E1";
 n=n+1;
end
if (t3=="stabile")
 v(n)="E2";
 n=n+1;
end
if (t4=="stabile")
 v(n)="E3";
 n=n+1;
end
if (t5=="stabile")
 v(n)="E4";
 n=n+1;
end
if (t6=="stabile")
 v(n)="E5";
 n=n+1;
end
if (t7=="stabile")
 v(n)="E6";
 n=n+1;
end
lista=v(2:n-1);
end