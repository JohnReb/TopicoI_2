%% Rotar Una Imagen
% Entradas:
% I - Imagen
% angulo - angulo de rotación
% Salidas:
% G - Imagen de salida
% IBand - Bandera con indicador de valor (1-existe valor);

function [ G, IBand ] = rotar( I, angulo )
    G = 0;
    IBand = 0;
    
    %%calcular y guardar coordenadas
    coseno=cosd(angulo);
    seno=sind(angulo);
    nCoord=zeros(size(I,1),size(I,2),2);
    for i=1:size(I,1) % renglones y
        for j=1:size(I,2) % columnas x
            nx=(j*coseno)-(i*seno);
            ny=(j*seno)+(i*coseno);
            nCoord(i,j,1) = nx;
            nCoord(i,j,2) = ny;
        end
    end

    %%validar decimales y negativos en las coordenadas
    nCoord=round(nCoord);
    minX=min(min(nCoord(:,:,1)));
    minY=min(min(nCoord(:,:,2)));

    if (minX < 0) 
        nCoord(:,:,1)=nCoord(:,:,1)+abs(minX)+1;
    end
    
    if (minY < 0) 
        nCoord(:,:,2)=nCoord(:,:,2)+abs(minY)+1;
    end
    
    maxX=max(max(nCoord(:,:,1)));
    maxY=max(max(nCoord(:,:,2)));
    
    %% asignar nuevas coordenas
        G = zeros(maxY,maxX,size(I,3));
        IBand=zeros(maxY,maxX);
        for i=1:size(I,1) %% renglones
            for j=1:size(I,2) %% columnas
                nx=nCoord(i,j,1);
                ny=nCoord(i,j,2);
                G(ny,nx,:)=I(i,j,:);
                IBand(ny,nx)=1;
            end
        end
     G=uint8(G);
     IBand=uint8(IBand);
end

