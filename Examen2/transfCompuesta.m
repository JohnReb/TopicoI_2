function [ G, IBand ] = transfCompuesta( I, AnIn, AnRo , Kpe)
    
    G = 0;
    IBand = 0;
    
    cosIn = cosd(AnRo);
    senIn = sind(AnRo);
    nCoord=zeros(size(I,1),size(I,2),2); %% X' , Y'
    
    for i=1:size(I,1) %% renglones
        for j=1:size(I,2) %% columnas
            tempx = (cosIn*AnIn)- senIn;
            tempy = ((senIn*AnIn)+cosIn);
            
            nx = (i * cosIn) + (j* tempx);
            ny=(i*senIn)+(j*tempy);
            
            npx=nx*ny*Kpe;
            npy=ny;
            nCoord(i,j,1)=npx;
            nCoord(i,j,2)=npy;
        end
    end
    
        %% validar decimales y negativos en las coordenadas 
    nCoord=round(nCoord);
    minX =min( min(nCoord(:,:,1)));
    minY =min( min(nCoord(:,:,2)));
    
    maxX=max( max(nCoord(:,:,1)));
    maxY=max( max(nCoord(:,:,2)));
    if minX <= 0
        nCoord(:,:,1)=nCoord(:,:,1)+abs(minX)+1;
        
    end
    if minY <= 0 
        nCoord(:,:,2) = nCoord(:,:,2)+abs(minY)+1;
    end
    
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

