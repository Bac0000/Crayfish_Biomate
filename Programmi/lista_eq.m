function lista=lista_eq(conf)
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

lista={'E1'};
elseif (conf=="bistabilita1")
lista={'E4','E5'};
elseif (conf=="E2")

 lista={'E2'};
elseif (conf=="E3")
 lista={'E3'};
elseif (conf=="E4")
 lista={'E5'};
elseif (conf=="E6")
 lista={'E6'};
elseif (conf=="bistabilita2")
lista={'E2','E5'};
end
