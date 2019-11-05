clc;
close all;
clear all;

I=imread('C:\Users\Carlos Daniel\Desktop\TopicoI_2\jordan.jpg');

tic; [Icompuesta, Iband1] = transfCompuesta(I,.1,10,0.004);  toc;

tic;[IcompuestaR, Iband1R,noPixeles1] = ...
    rellenarImg(Icompuesta, Iband1, 1); toc;

fprintf("======================================================\n");
total1=size(Icompuesta,1)*size(Icompuesta,2);
fprintf("Imagen 1(%d,%d)\n",size(Icompuesta,1),size(Icompuesta,2));
fprintf("Pixeles recuperados %d (%7.5f porcentaje)\n",noPixeles1, (noPixeles1/total1)*100);
fprintf("======================================================\n");

imwrite(IcompuestaR, 'C:\Users\Carlos Daniel\Desktop\TopicoI_2\rellenada_compuesta_4.jpg');

figure;
image(IcompuestaR); title('compuesta rellenada');

