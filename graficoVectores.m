function graficoVectores(xp, yp, campoElectricoX, campoElectricoY)
% GRAFICOVECTORES Graficación de vectores 2D de campo eléctrico
% Para cada campo eléctrico que generan las partículas presentes en el
% sistema, se dibuja en 2 dimensiones el vector del campo eléctrico
% en la prueba de carga o en una partícula existente.

% Cambio vectores filas a vectores columnas en Matriz Repetida
xp = xp(:);
yp = yp(:);

% Cambio vectores filas a vectores columnas en matrices de campoElectricoXY 
campoXCol = campoElectricoX(:);
campoYCol = campoElectricoY(:);

% Creación de tabla de campoElectrico en X - Y
tablaCampoXY = table(campoXCol, campoYCol);

% Explicación de Proceso de Graficación
%{ 
La graficación de vectores se divide en 2 partes

1. Vectores Únicos
2. Vectores Repetidos

Esto se realizo para poder cambiar su COLOR y TAMAÑO de manera que
se puedan DISTINGUIR vectores de IGUAL MANGITUD Y DIRECCIÓN
y que esto NO se SOLAPEN aparentando que estos Vecotres Repetidos
no se graficaron.
%} 


% Graficación Vectores Campo eléctrico Únicos

%{
%Documentación de unique
[C,ia,ic] = unique(___) also returns index vectors ia and ic using any 
of the previous syntaxes.

If A is a table or timetable, then unique returns the unique rows in A 
in sorted order. For timetables, unique takes row times and row values
 into account when determining whether rows are unique, and 
sorts the output timetable C by row times.

If A is a vector, then C = A(ia) and A = C(ic).

PUEDE BORRARSE AL FINAL
%}

% Hallar valores X, Y, únicos (NO se repiten)
[tablaUnicos, ~, ic] = unique(tablaCampoXY);

% Cantidad de valores X-Y de campo Eléctrico Únicos
cantUnicos = length(tablaUnicos.campoXCol);

% Plot de Vectores únicos
quiver(xp(1:cantUnicos), yp(1:cantUnicos), ...
       tablaUnicos.campoXCol, tablaUnicos.campoYCol,...
       'color', '#ffc000');
       hold on


% Graficación Vectores campo Eléctrico Repetidos

% Contar valores que se repiten 
contarReps = accumarray(ic,1);

% Explicación de porque gráficar por separado
%{
Para DISTINGUIR y poder OBSERVAR los VECTORES REPETIDOS,
se cambiara su TAMAÑO APARENTE en la GRAFICA, de manera que
se VERAN MÁS GRANDES, de lo que en verdad son.
%}

k = 0.92; % Factor de Tamaño de Vector
for i = 1:cantUnicos
   if contarReps(i) > 1
       % Para cada VECTOR REPETIDO
       for r = 1:contarReps(i)-1
           % Plot de Vectores Repetidos
            quiver(xp(1), yp(1), tablaUnicos.campoXCol(i), tablaUnicos.campoYCol(i), ...
                  k, 'color', '#77AC30'); hold on
       
            k = k + 0.01;   % Se aumenta el factor de tamaño del vector

       end
   end
end  
axis equal % Ajuste nuevo de ejes según vectores /// ¿seguro que es necesario? VERIFICAR
end
