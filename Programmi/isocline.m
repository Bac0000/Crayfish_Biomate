function [temp_G,temp_L,GG1,GG2,LL1,LL2]=isocline(b1,b2,a1,a2,m3,m4)
% Disegna le Isocline nel caso dell'equilibrio E3
temp_G=linspace(0,b1/m3);
temp_L=linspace(0,b2/m4);
LL1=zeros(size(temp_G));
LL2=(m3*temp_G-b1)/(-a1);
GG1=zeros(size(temp_L));
GG2=(m4*temp_L-b2)/(-a2);
end