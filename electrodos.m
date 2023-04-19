% Modelación de sistemas eléctricos

clc
clear

%{
  Equipo:
    n
    n
    n
    n
    n
    n
    
%}

%% 2D

clc

% 1. Ingresar/Cargar Coordenadas y Carga eléctrica de cada partícula

prueba = input("Tipo de prueba: ");
[n, vCoordenadas, vCargas, xq, yq, zq] = tipoPrueba(prueba);


% 2. Calculos y gráficos de campo Eléctrico

% Preguntar si se Calcula para Particula de Prueba o Particula Existente
% O para todo el campo (Un área en específico)
lugarCampo = input("Existente(E) Carga Prueba (P) Área (A): ", "s");

% Coordenadas en donde se halla/cualcula el campo eléctrico de partícual de prueba
if lugarCampo == "P" || lugarCampo == "p"
    % Coordenada partícula de prueba en donde se calcula Campo Eléctrico
    coordenadaCampoX = input("Coordenada X: ");
    coordenadaCampoY = input("Coordenada Y: ");
    
    % Almacenamiento de coordenadas de particula prueba en arreglo de coordenadas de partículas existentes
    vCoordenadas(end + 1, 1) = coordenadaCampoX;
    vCoordenadas(end, 2) = coordenadaCampoY;
    
    % Añadir carga de prueba a vector de cargas q = 1
    vCargas(end + 1) = 1;
    
    % Aumentar número de partículas/ se agrega la de prueba
    n = n + 1;
    
    % Partícula en que se evalua el campo es la última en el arreglo (Posición: n)
    particulaCampo = n;
    
    % Calculo vectorial campo Eléctrico (X, Y)
    [campoElectricoX,campoElectricoY, campoElectricoZ] = campoElectrico(vCoordenadas, vCargas, particulaCampo, n);
    
elseif lugarCampo == "A" || lugarCampo == "a"
    % Área de campo eléctrico en donde se graficarán los vectores del campo
    B = reshape([xq(:) yq(:) zq(:)], [], 3);
    
    % Tamaño de vectores de campoElectricoX, Y, Z
    a = length(B);
    
    % Se agrega las coordenadas del área a vCoordenadas donde están las 
    % partículas fijas
    vCoordenadas = [vCoordenadas; B];

    particulaCampo = 0;
    [campoElectricoX,campoElectricoY, campoElectricoZ] = campoElectrico(vCoordenadas, vCargas, particulaCampo, n, a);
      
else
    % Particula en donde se calculará el campo eléctrico si NO es partícula de prueba
    particulaCampo = input("Particula a calcular campo E: ");
    
    % Calculo vectorial campo Eléctrico (X, Y)
    [campoElectricoX,campoElectricoY, campoElectricoZ] = campoElectrico(vCoordenadas, vCargas, particulaCampo, n);
end



% Calculo magnitud de campo eléctrico
[magnitudCampoE, Ex_num, Ey_num, ~] = magnitudCampo(campoElectricoX, campoElectricoY, campoElectricoZ);


% Graficación de partículas
graficoCoordenadas(vCoordenadas, vCargas, n, 2)
axis equal


% Graficación vectores campo eléctrico en la partícula

if particulaCampo == 0
    xp = B(:,1);
    yp = B(:,2);
    
    colX = campoElectricoX(:);
    colY = campoElectricoY(:);
    
    quiver(xp, yp, colX, colY, 2, 'color', 'g')
    %graficoCampoVectores(xp, yp, colX, colY)   
else
    % Creación de matriz repitiendo coordenada X - Y en donde inicia el vector
    xp = repmat(vCoordenadas(particulaCampo,1), 1, n);
    yp = repmat(vCoordenadas(particulaCampo,2), 1, n);
    
    % Función graficadora de vectores de campo eléctrico
    graficoVectores(xp, yp, campoElectricoX, campoElectricoY);
    
    % Vector resultante
    quiver(median(xp), median(yp), Ex_num, Ey_num, 'color', 'k')
end



disp("Magnitud campo eléctrico en (" + ...
    median(xp) + ", " + median(yp) ...
    + "): " + magnitudCampoE) % Agregar unidades?





%% 3D

clc

% 1. Cargar Coordenadas y Carga eléctrica de cada partícula

prueba = input("Tipo de prueba: ");
[n, vCoordenadas, vCargas, xq, yq, zq] = tipoPrueba3(prueba);


% 2. Calcular y gráficar campo eléctrico

% Preguntar si se Calcula para Particula de Prueba o Particula Existente
% o para todo el campo (área)
lugarCampo = input("Particula existente (E)de prueba (P) área (A): ", "s");

% Coordenadas en donde se halla/cualcula el campo eléctrico de partícual de prueba
if lugarCampo == "P" || lugarCampo == "p"
    % Coordenada partícula de prueba en donde se calcula Campo Eléctrico
    coordenadaCampoX = input("Coordenada X: ");
    coordenadaCampoY = input("Coordenada Y: ");
    coordenadaCampoZ = input("Coordenada Z: ");
    
    % Almacenamiento de coordenadas de particula prueba en arreglo de coordenadas de partículas existentes
    vCoordenadas(end + 1, 1) = coordenadaCampoX;
    vCoordenadas(end, 2) = coordenadaCampoY;
    vCoordenadas(end, 3) = coordenadaCampoZ;
    
    % Añadir carga de prueba a vector de cargas q = 1
    vCargas(end + 1) = 1;
    
    % Aumentar número de partículas / se agrega la partícula de prueba
    n = n + 1;
    
    % Partícula en que se evalua el campo es la última en el arreglo (Posición: n)
    particulaCampo = n;
    
    % Cálculo campo eléctrico Vectores de X, Y, Z
    [campoElectricoX,campoElectricoY, campoElectricoZ] = campoElectrico(vCoordenadas, vCargas, particulaCampo, n);
    
elseif lugarCampo == 'A' || lugarCampo == 'a'
    % Área de campo eléctrico en donde se graficarán los vectores del campo
    B = reshape([xq(:) yq(:) zq(:)], [], 3);
    
    % Tamaño de vectores de campoElectricoX, Y, Z
    a = length(B);
    
    % Se agrega las coordenadas del área a vCoordenadas donde están las 
    % partículas fijas
    vCoordenadas = [vCoordenadas; B];

    particulaCampo = 0;
    
     % Cálculo campo eléctrico Vectores de X, Y, Z
    [campoElectricoX,campoElectricoY, campoElectricoZ] = campoElectrico(vCoordenadas, vCargas, particulaCampo, n, a);
    
else
    % Partícula en donde se calculará el campo eléctrico si NO es partícula de prueba
    particulaCampo = input("Particula a calcular campo E: ");
    
     % Cálculo campo eléctrico Vectores de X, Y, Z
    [campoElectricoX,campoElectricoY, campoElectricoZ] = campoElectrico(vCoordenadas, vCargas, particulaCampo, n);
end



% Calculo magnitud de campo eléctrico
[magnitudCampoE, Ex_num, Ey_num, Ez_num] = magnitudCampo(campoElectricoX, campoElectricoY, campoElectricoZ);


% Graficación de partículas
graficoCoordenadas(vCoordenadas, vCargas, n, 3)
axis equal
grid on


% Graficación vectores campo eléctrico en la partícula

if particulaCampo == 0
    xp = B(:,1);
    yp = B(:,2);
    zp = B(:,3);
    
    colX = campoElectricoX(:);
    colY = campoElectricoY(:);
    colZ = campoElectricoZ(:);
    
    quiver3(xp, yp, zp, colX, colY, colZ, 2, 'color', 'g')
    %graficoCampoVectores(xp, yp, colX, colY)   
else
    % Creación de matriz repitiendo coordenada X - Y en donde inicia el vector
    xp = repmat(vCoordenadas(particulaCampo,1), 1, n);
    yp = repmat(vCoordenadas(particulaCampo,2), 1, n);
    zp = repmat(vCoordenadas(particulaCampo,3), 1, n);
    
    % Función graficadora de vectores de campo eléctrico
    graficoVectores3(xp, yp, zp, campoElectricoX, campoElectricoY, campoElectricoZ);
    
    % Vector resultante graficado
    quiver3(median(xp), median(yp), median(zp), Ex_num, Ey_num, Ez_num, 'color', 'k')
end


disp("Magnitud campo eléctrico en (" + ...
    median(xp) + ", " + median(yp) + "," + median(zp) ...
    + "): " + magnitudCampoE) % Agregar unidades?


%%

% Permitir al usario cambiar el tamaño de cada placa
% Gráficar/Imprimir componentes de campo eléctrico Neto 

