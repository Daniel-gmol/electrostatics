function graficoCoordenadas(vCoordenadas, vCargas, n, dimension)
%GRAFICOCOORDENADAS Gráfica las partículas en sus coordenadas
%   Según la dimensión (2D/3D) se gráfican las partículas en sus respectiva
%   coordenada como si fuesen un punto. 
%   Dependiendo del signo de la carga el color del punto será diferente
%   Negativos color Azul
%   Positivos color Rojo

if dimension == 2
    % Plot de las coordenadas de las partículas en 2D según la carga
    for i = 1:n
       if vCargas(i) < 0
           % Azul cargas negativas
           plot(vCoordenadas(i), vCoordenadas(i, 2), '.b')
           hold on
       else
           % Rojo cargas positivas
           plot(vCoordenadas(i), vCoordenadas(i, 2), '.r')
           hold on
       end
    end
% axis equal Limita ejes del plot
% PRUEBA DE EJES: axis([-5 12 -5 12]) ¿es necesario? VERIFICAR

else
    % Plot de las coordenadas de las partículas en 3D según la carga
    for i = 1:n
       if vCargas(i) < 0
           % Azul cargas negativas
           plot3(vCoordenadas(i), vCoordenadas(i, 2), vCoordenadas(i, 3), '.b')
           hold on
       else
           % Rojo cargas positivas
           plot3(vCoordenadas(i), vCoordenadas(i, 2), vCoordenadas(i, 3), '.r')
           hold on
       end
    end
    % axis equal   Limita ejes del plot ¿es necesario? VERIFICAR
    % PRUEBA DE EJES: axis([-5 12 -5 12 -5 12])
end
end

