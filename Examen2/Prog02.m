clc;
clear all;
close all;

I1=imread('/Users/JohnReb/Desktop/Tareas Digitales/7to-Semestre/Tipoco I/MATLAB/img/mariposa.jpg');

tic;
[ITransf1,IBand1]=transfCompuesta(I,33, 0.75, 0.80);
[ITransf2,IBand2]=transfCompuesta(I,137, 1.15, 1.20);
[ITransf3,IBand3]=transfCompuesta(I,256, 1.55, 1.70);
[ITransf4,IBand4]=transfCompuesta(I,256, 1.55, 1.70);
[ITransf5,IBand5]=transfCompuesta(I,256, 1.55, 1.70);
toc;


tic; [ITransf1R, IBand1R, noPixeles1] = rellenarImg(ITransf1, IBand1, 1); toc;
tic; [ITransf2R, IBand2R, noPixeles2] = rellenarImg(ITransf2, IBand2, 1); toc;
tic; [ITransf3R, IBand3R, noPixeles3] = rellenarImg(ITransf3, IBand3, 1); toc;
tic; [ITransf4R, IBand4R, noPixeles4] = rellenarImg(ITransf4, IBand4, 1); toc;
tic; [ITransf5R, IBand5R, noPixeles5] = rellenarImg(ITransf5, IBand5, 1); toc;

% fprintf('============================================\n')
% total1=size(IAfn1, 1)*size(IAfn1,2);
% fprintf('Imagen 1 (%d, %d)\n', size(IAfn1,1),size(IAfn1,2));
% fprintf('Pixeles recuperados %d (&7.5f porsentaje)\n', noPixeles1, (noPixeles1/total1*100));

%imwrite(ITransf1R, '/Users/JohnReb/Desktop/Tareas Digitales/7to-Semestre/Tipoco I/MATLAB/transformacionAfin/resultados/IAfn1.jpg');

figure;
image(I); title('Imagen original');

figure;
subplot(2,2,1); image(IAfn1); title('Rotacon 1 33?');
subplot(2,2,2); imagesc(IBand1); title('Bandera'); colormap(gray);
subplot(2,2,3); image(IAfn1R); title('Rotacon 2 33? Rellenada');
subplot(2,2,4); imagesc(IBand1R); title('Bandera'); colormap(gray);

figure;
subplot(2,2,1); image(IAfn2); title('Rotacion 2 90?');
subplot(2,2,2); imagesc(IBand2); title('Bandera'); colormap(gray);
subplot(2,2,3); image(IAfn2R); title('Rotacon 2 33? Rellenada');
subplot(2,2,4); imagesc(IBand2R); title('Bandera'); colormap(gray);


figure;
subplot(2,2,1); image(IAfn3); title('Rotacion 3 256?');
subplot(2,2,2); imagesc(IBand3); title('Bandera'); colormap(gray);
subplot(2,2,3); image(IAfn3R); title('Rotacon 3 33? Rellenada');
subplot(2,2,4); imagesc(IBand3R); title('Bandera'); colormap(gray);