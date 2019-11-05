%% Perspectiva
%% Entradas
%% I - imagen
%% K - Constante de perspectiva (cercano a cero)
%% IBand con bandera con indicador de valor (1-existe valor)

function [G,Bandera] = perspectiva(I,k)
    nCoord=zeros((size(I,1)),(size(I,2)));
    
    for i =1:size(I,1)
        for j =1:size(I,2)
            nX=j*(i*k);
            nCoord(i,j)=nX;
        end
    end 
    
    %%validar coordenadas
    nCoord=round(nCoord);
    minXs = min((nCoord(:)));
    
    if (minXs<1)
        nCoord(:,:)=nCoord(:,:)+abs(minXs)+1;
    end
    
    %%Crear imagen resultante y guardar
    maxXs = max((nCoord(:)));
    maxYs = size(I,1);
    
    if(maxXs>10000) 
        G=0;
        Bandera=0;
    else
        G = zeros(maxYs, maxXs, size(I, 3));
        Bandera = zeros(maxYs, maxXs);

        for i =1:size(I,1)
            for j =1:size(I,2)
                G(i,nCoord(i,j),:)=I(i,j,:);
                Bandera(i,nCoord(i,j))=1;
            end
        end 
    end
    
    
    G = uint8(G);
    Bandera = uint8(Bandera);
end