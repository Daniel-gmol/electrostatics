function [xq, yq, zq] = area(vCoordenadas)
%AREA Summary of this function goes here
%   Detailed explanation goes here
[xq, yq, zq] = meshgrid(min(vCoordenadas(:,1))+0.1:0.1:max(vCoordenadas(:,1))-0.1, ...
                         min(vCoordenadas(:,2))+0.1:0.1:max(vCoordenadas(:,2))-0.1,...
                     min(vCoordenadas(:,3)):0.1:max(vCoordenadas(:,3)));
end

