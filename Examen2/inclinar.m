
%% inclinar una imagen con base a k
%% Entradas 
%% I imagen de entrada
%% factor de inclinacion. valores  de 0 ..1 (puede ser negativo)
%%salidas 
%% G imagen de salida
%% IBand bandera con indicador de valor (1=existe valor)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ G ] = inclinar( I, k )

    deltaY = round((1:size(I, 1))*k);
    minY = min(deltaY);
    if (minY<0)
        deltaY=deltaY+abs(minY);
    end
    
    G = zeros(size(I, 1), size(I, 2)+max(deltaY), size(I, 3));
    nc = size(I, 2);
    
    for i = 1:size(I, 1)
        G(i, deltaY(i)+1:deltaY(i)+nc, :) = I(i, :, :);
    end
    
    G=uint8(G);

end

