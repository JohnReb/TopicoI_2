clc;
clear all;
close all;

I1=imread('C:\Users\Carlos Daniel\Desktop\TopicoI_2\jordan.jpg');

tic; [Inclinar1]=inclinar(I1,10); toc;
imwrite(Inclinar1, 'C:\Users\Carlos Daniel\Desktop\TopicoI_2\Salidas\Inclinar1_enPartes.jpg');

tic; [IRot1,IBand1]=rotar(Inclinar1,-100); toc;
imwrite(IRot1, 'C:\Users\Carlos Daniel\Desktop\TopicoI_2\Salidas\rotar1_enPartes.jpg');

tic;[perspectiva1, IBand1]=perspectiva(IRot1,0.001);toc;
imwrite(perspectiva1, 'C:\Users\Carlos Daniel\Desktop\TopicoI_2\Salidas\perspectiva1_enPartes.jpg');

tic; [IR1, IBand1R, noPixeles1] = rellenarImg(perspectiva1, IBand1, 1); toc;
imwrite(IR1, 'C:\Users\Carlos Daniel\Desktop\TopicoI_2\Salidas\rellenada_enPartes.jpg');

fprintf("======================================================\n");
total1=size(IR1,1)*size(IR1,2);
fprintf("Imagen 1(%d,%d)\n",size(IR1,1),size(IR1,2));
fprintf("Pixeles recuperados %d (%7.5f porcentaje)\n",noPixeles1, (noPixeles1/total1)*100);

figure;
image(I1); title('Imagen original');

figure;
subplot(2,2,1); image(IR1); title('in = 10, rotar = -100, persp = 0.001');
subplot(2,2,2); image(IBand1R); title('rellenada');



