function [ G, IBand ] = rotar( I, angulo )

    G =0;
    IBand = 0;
    
    %% Calcular nuevas cordenadas
    coseno = cosd(angulo);
    seno = sind(angulo);
    nCoord = zeros(size(I,1), size(I,2),2); %% x', y'
    for i = 1:size(I,1) %%renglones -y
        for j= 1:size(I,2) %%colimnas -x
            nx = (j*coseno)-(i*seno);
            ny = (j*seno) - (i*coseno);
            nCoord(i,j,1)=nx;
            nCoord(i,j,2)=ny;
            
        end
        
    end
    
    %% Valido las decimales y negativos en las cordenadas
    nCoord=round(nCoord);
    minX = min(min(nCoord(:,:,1)));
    minY = min(min(nCoord(:,:,2)));
    if(minX < 0)
        nCoord(:,:,1)=nCoord(:,:,1)+abs(minX)+1;
    end
    if(minY < 0)
        nCoord(:,:,2)=nCoord(:,:,2)+abs(minY)+1;
    end
    maxX=max(max(nCoord(:,:,1)));
    maxY=max(max(nCoord(:,:,2)));
    
    %% Asignar nuevas cordenadas
    G=zeros(maxY,maxX,size(I,3));
    for i = 1:size(I,1) %%renglones -y
        for j= 1:size(I,2) %%colimnas -x
            nX=nCoord(i,j,1);
            nY=nCoord(i,j,2);
            G(nY,nX,:)=I(i,j,:);
            IBand(nY,nX)=1;
        end 
    end
    G=uint8(G);
    IBand=uint8(IBand);
end

