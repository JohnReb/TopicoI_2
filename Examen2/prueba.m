clc;
close all;
clear all;

% I=imread('C:\Users\Carlos Daniel\Desktop\TopicoI_2\descarga.jpg');
I=imread('C:\Users\Carlos Daniel\Desktop\7 Semestre\Topico 1\PETS\Sh1.jpg');


tic;


% [IAfin1, Iband1] = transfCompuesta(I,33,0.75,0.80,50,75); 
% [IAfin2, Iband2] = transfCompuesta(I,137,1.15,1.20,50, 75);
% [IAfin3, Iband3] = transfCompuesta(I,256,1.55,1.70,50,75); 
[IAfin1, Iband1] = transfCompuesta(I,5,190,0.0003); 
% [IAfin2, Iband2] = transfCompuesta(I,137,1.15,1.20,50, 75);
% [IAfin3, Iband3] = transfCompuesta(I,256,1.55,1.70,50,75); 

toc;

tic;[IAfin1R, Iband1R,noPixeles1] = ...
    rellenarImg(IAfin1, Iband1, 1); toc;

% tic;[IAfin2R, Iband2R,noPixeles2] = ...
%     rellenarImg(IAfin2, Iband2, 1); toc;
% 
% tic; [IAfin3R, Iband3R,noPixeles3] = ...
%     rellenarImg(IAfin3, Iband3, 1); toc;


fprintf("======================================================\n");
total1=size(IAfin1,1)*size(IAfin1,2);
fprintf("Imagen 1(%d,%d)\n",size(IAfin1,1),size(IAfin1,2));
fprintf("Pixeles recuperados %d (%7.5f porcentaje)\n",noPixeles1, (noPixeles1/total1)*100);

% total2=size(IAfin2,1)*size(IAfin2,2);
% fprintf("Imagen 2(%d,%d)\n",size(IAfin2,1),size(IAfin2,2));
% fprintf("Pixeles recuperados %d (%7.5f porcentaje)\n",noPixeles2, (noPixeles2/total2)*100);
% 
% total3=size(IAfin3,1)*size(IAfin3,2);
% fprintf("Imagen 3(%d,%d)\n",size(IAfin3,1),size(IAfin3,2));
% fprintf("Pixeles recuperados %d (%7.5f porcentaje)\n",noPixeles3, (noPixeles3/total3)*100);

fprintf("======================================================\n");

imwrite(IAfin1, 'C:\Users\Carlos Daniel\Desktop\7 Semestre\Topico 1\Salidas\IAfin1.jpg');
% imwrite(IAfin2, 'C:\Users\Carlos Daniel\Desktop\7 Semestre\Topico 1\Salidas\IAfin2.jpg');
% imwrite(IAfin3, 'C:\Users\Carlos Daniel\Desktop\7 Semestre\Topico 1\Salidas\IAfin3.jpg');
% 
imwrite(IAfin1R, 'C:\Users\Carlos Daniel\Desktop\7 Semestre\Topico 1\Salidas\IAfin1R.jpg');
% imwrite(IAfin2R, 'C:\Users\Carlos Daniel\Desktop\7 Semestre\Topico 1\Salidas\IAfin2R.jpg');
% imwrite(IAfin3R, 'C:\Users\Carlos Daniel\Desktop\7 Semestre\Topico 1\Salidas\IAfin3R.jpg');

figure;
image(I); title('Imagen Original');

figure
 image(IAfin1); title('angulo=33');
figure
subplot(2,2,2); imagesc(Iband1); title('bandera'); colormap(gray);

subplot(2,2,3); image(IAfin1R); title('angulo=33 rellenada');
subplot(2,2,4); imagesc(Iband1R); title('bandera'); colormap(gray);

% 
% figure
% subplot(2,2,1); image(IAfin2); title('angulo=137');
% subplot(2,2,2); imagesc(Iband2); title('bandera'); colormap(gray);
% 
% subplot(2,2,3); image(IAfin2R); title('angulo=137 rellenada');
% subplot(2,2,4); imagesc(Iband2R); title('bandera'); colormap(gray);
% 
% 
% figure
% subplot(2 ,2,1); image(IAfin3); title('angulo=256');
% subplot(2,2,2); imagesc(Iband3); title('bandera'); colormap(gray);
% 
% subplot(2,2,3); image(IAfin2R); title('angulo=256 rellenada');
% subplot(2,2,4); imagesc(Iband2R); title('bandera'); colormap(gray);