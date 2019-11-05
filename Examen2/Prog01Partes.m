clc;
clear all;
close all;

I1=imread('C:\Users\Carlos Daniel\Desktop\TopicoI_2\jordan.jpg');

tic; [Inclinar1]=inclinar(I1,0.2); toc;
tic; [IRot1,IBand1]=rotar(Inclinar1,-50); toc;
tic;[perspectiva1, IBand1]=perspectiva(IRot1,0.003);toc;
tic; [IR1, IBand1R, noPixeles1] = rellenarImg(perspectiva1, IBand1, 1); toc;



imwrite(IRot1, 'C:\Users\Carlos Daniel\Desktop\TopicoI_2\rotar5_enPartes.jpg');
imwrite(perspectiva1, 'C:\Users\Carlos Daniel\Desktop\TopicoI_2\perspectiva5_enPartes.jpg');
imwrite(IR1, 'C:\Users\Carlos Daniel\Desktop\TopicoI_2\rellenada5_enPartes.jpg');
imwrite(Inclinar1, 'C:\Users\Carlos Daniel\Desktop\TopicoI_2\Inclinar5_enPartes.jpg');


fprintf("======================================================\n");
total1=size(IR1,1)*size(IR1,2);
fprintf("Imagen 1(%d,%d)\n",size(IR1,1),size(IR1,2));
fprintf("Pixeles recuperados %d (%7.5f porcentaje)\n",noPixeles1, (noPixeles1/total1)*100);



figure;
image(I1); title('Imagen original');

figure;
image(IR1); title('en partes');




