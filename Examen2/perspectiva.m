%% Perspectiva
%% Entradas
%% I - imagen
%% K - Constante de perspectiva (cercano a cero)
%% IBand con bandera con indicador de valor (1-existe valor)

function [ G, IBand ] = perspectiva( I, k )

    G=0;
    IBand=0;
    %% Calcular nuevas cordenadas 
    nCoord = zeros(size(I,1), size(I,2),2); %% x', y'
    for i = 1:size(I,1) %%renglones -y
        for j= 1:size(I,2) %%colimnas -x
            nx=(i*j*k);
            nCoord(i,j,1)=nx;
            
        end
        
    end
    
    %% Valido las decimales y negativos en las cordenadas
    nCoord=round(nCoord);
    minX = min(min(nCoord(:,:)));
    if(minX <= 0)
        nCoord(:,:,1)=nCoord(:,:,1)+abs(minX)+1;
    end
    maxX=max(max(nCoord(:,:,1)));
    
    if(maxX<5000)
         %% Asignar nuevas cordenadas
        G=zeros(size(I,1),maxX,size(I,3));
        for i = 1:size(I,1) %%renglones -y
            for j= 1:size(I,2) %%colimnas -x
                nX=nCoord(i,j);
                G(i,nX,:)=I(i,j,:);
                IBand(i,nX)=1;
            end 
        end
    end
    G=uint8(G);
    IBand=uint8(IBand);
end

