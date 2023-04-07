function [magnitudCampoE, Ex_num, Ey_num, Ez_num] = magnitudCampo(campoElectricoX,campoElectricoY, campoElectricoZ)
%MAGNITUDCAMPO Calculo de magnitud del campo eléctrico
%   Uitlizando variables simbólicas, se calcula la sumatoria del campo
%   eléctrico en cada una de las componentes de dirección (XYZ) 
%   generado por cada una de las partículas que ya existen, 
%   sobre la carga de prueba o existente en que se calcula el campo.

% Definir variables simbólicas (Para calculos con mayor precisión)
syms x y z;

% Calcular simbólicamnete la sumatoria del campo eléctrico por componentes
Ex = sum(campoElectricoX.*x);
Ey = sum(campoElectricoY.*y);
Ez = sum(campoElectricoZ.*z);

% Devolver vector resultante como número y no variable simbolica
Ex_num = double(subs(Ex, [x y z], [1 1 1]));
Ey_num = double(subs(Ey, [x y z], [1 1 1]));
Ez_num = double(subs(Ez, [x y z], [1 1 1]));

% Calcular magnitud de campo eléctrico
E = (Ex^2 + Ey^2 + Ez^2)^(1/2);

% Covertir magnitud simbólica a dato tipo double que sea manipulable
magnitudCampoE = double(subs(E, [x y z], [1 1 1]));
end
