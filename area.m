function [xq, yq, zq] = area(vCoordenadas)
%AREA Summary of this function goes here
%   Detailed explanation goes here
[xq, yq, zq] = meshgrid(min(vCoordenadas(:,1))+0.1:1:max(vCoordenadas(:,1))-0.1, ...
                         min(vCoordenadas(:,2))+0.1:1:max(vCoordenadas(:,2))-0.1,...
                     min(vCoordenadas(:,3)):1:max(vCoordenadas(:,3)));
 if isempty(xq) && isempty(xq) && isempty(xq)
    [X, Y, Z] = sphere();
    r = 5;
    xq = X * r;
    yq = Y * r;
    zq = Z * r;

    % Meshgrid anterior mente se hacia con + 0.1 y menos -0.1/cambio a 5
 end
end

