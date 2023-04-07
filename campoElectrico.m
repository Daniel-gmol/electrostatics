function [campoElectricoX,campoElectricoY, campoElectricoZ] = campoElectrico(vCoordenadas, vCargas, particulaCampo, n)
% CAMPOELECTRICO Cálculo vectorial del campo eléctrico por cada partícula
% Por cada partícula que genera un cmapo eléctrico, se calculan las 
% componenetes X, Y, o Z, del campo sobre una prueba de carga
% o partícula existnete

% Constante k
k = 8.99 * 10^9; % Nm^2/C^2

% Creación de vectores para almacenar calculo del campo en cada componente
campoElectricoX = 1:n; % Campo eléctrico componente X
campoElectricoY = 1:n; % Campo eléctrico componente Y
campoElectricoZ = 1:n; % Campo eléctrico componente Z

for i = 1:n
    % Distancia: √(xp - xi)^2 + (yp - yi)^2
    distancia = ((vCoordenadas(particulaCampo,1) - vCoordenadas(i,1))^2 ...
              + (vCoordenadas(particulaCampo,2)  - vCoordenadas(i,2))^2 ...
              + (vCoordenadas(particulaCampo,3)  - vCoordenadas(i,3))^2)^(1/2); 

    if distancia ~= 0
        % Vector Unitario r;
        componenteX = (vCoordenadas(i,1) - vCoordenadas(particulaCampo,1)) / distancia;

        componenteY = (vCoordenadas(i,2) - vCoordenadas(particulaCampo,2)) / distancia;
        
        componenteZ = (vCoordenadas(i,3) - vCoordenadas(particulaCampo,3)) / distancia;
                     
        if vCargas(i) > 0 && vCargas(particulaCampo) > 0 || ...
           vCargas(i) < 0 && vCargas(particulaCampo) < 0
            % E = k * q / r^2 * vector unitario
            % Si las cargas son iguales el campo es inverso al vector unitario
            campoElectricoX(i) = - (k * abs(vCargas(i)) / distancia^2) * componenteX;

            campoElectricoY(i) =  - (k * abs(vCargas(i)) / distancia^2) * componenteY;
                                
            campoElectricoZ(i) =  - (k * abs(vCargas(i)) / distancia^2) * componenteZ;                                
        else
            % Si son diferentes, campo va en misma direcicón al vector unitario 
            campoElectricoX(i) =  (k * abs(vCargas(i)) / distancia^2) * componenteX;

            campoElectricoY(i) =   (k * abs(vCargas(i)) / distancia^2) * componenteY;
                                   
            campoElectricoZ(i) =   (k * abs(vCargas(i)) / distancia^2) * componenteZ;                             
        end
  
    else
        % Si la distancia es 0, campoElectrico = indefnidio = 0
        campoElectricoX(i) =  0;
        campoElectricoY(i) = 0;
        campoElectricoZ(i) = 0;
    end
end
