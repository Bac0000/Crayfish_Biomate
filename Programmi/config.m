function [a1,a2,a3,b1,b2,c1,c2,m1,m2,m3,m4,lambda,g1,g2]=config(conf)
% Restituisce una configurazione di parametri in cui ll'equilibrio E_n è
% stabile, o in cui vi è bistabilità:
% conf=E1 implica E1 stabile
% conf=E2 implica E2 stabile
% conf=E3 implica E3 stabile
% conf=E4 implica E4 stabile
% conf=E5 implica E5 stabile
% conf=E6 implica E6 stabile
% conf=bisatbilita1 implica bistabilita E4 E5
% conf=bisatbilita2 implica bistabilita E2 E5

if (conf=="E1")
c1=25;
m1=25;
g2=0.0062;
g1=0.005;
a3=10;
c2=8;
lambda=0.005; %E1 Stabile
a1=1;
a2=0.05;
m2=1;
b1=7;
b2=19;
m3=1;
m4=1;
elseif (conf=="bistabilita1")
c1=250;
m1=2;
g2=0.0072;
g1=0.0075;
a3=4;
c2=30;
lambda=0.5; %Bistabilità E4 E5
a1=7;
a2=7;
m2=1;
b1=19;
b2=19;
m3=1;
m4=1;
elseif (conf=="E2")
c1=25;
m1=2;
g2=0.0075;
g1=0.007;
a3=4;
c2=30;
lambda=0.005; %E2 Stabile
a1=0.05;
a2=1;
m2=0.64;
b1=19;
b2=7;
m3=1;
m4=1;
elseif (conf=="E3")
 c1=45;
 m1=40;
 g2=0.00075;
 g1=0.0007;
 a3=4;
 c2=3;
 lambda=0.005; %E3 Stabile
 a1=0.2;
 a2=0.2;
 m2=15;
 b1=19;
 b2=19;
 m3=1;
 m4=1;
elseif (conf=="E4")
c1=250;
m1=2;
g2=0.0072;
g1=0.0075;
a3=4;
c2=30;
lambda=0.5; %E4 Stabile
a1=0.5;
a2=1;
m2=1;
b1=19;
b2=7;
m3=1;
m4=1;  
elseif (conf=="E5")
c1=25;
m1=2;
g2=0.0075;
g1=0.007;
a3=4;
c2=30;
lambda=0.005; %E5 Stabile
a1=1;
a2=0.05;
m2=0.64;
b1=7;
b2=19;
m3=1;
m4=1;
elseif (conf=="E6")
 c1=150;
 m1=6;
 g2=0.0075;
 g1=0.007;
 a3=4;
 c2=45;
 lambda=0.5; %E6 Stabile
 a1=0.2;
 a2=0.2;
 m2=7;
 b1=19;
 b2=19;
 m3=1;
 m4=1; 
elseif (conf=="bistabilita2")
c1=250;
m1=20;
g2=0.0072;
g1=0.0075;
a3=41;
c2=35;
lambda=0.0005; %bistabilita E2 E5
a1=2;
a2=5;
m2=1;
b1=17;
b2=11;
m3=1;
m4=1;
elseif(conf=="bistabilita3")
 c1=45;
 m1=40;
 g2=0.00075;
 g1=0.0007;
 a3=4;
 c2=3;
 lambda=0.005; %bistabilita E1,E2
 a1=3;
 a2=3;
 m2=15;
 b1=19;
 b2=19;
 m3=1;
 m4=1;
end




