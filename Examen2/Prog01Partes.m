clc;
clear all;
close all;


I1=imread('/Users/JohnReb/Desktop/Tareas Digitales/7to-Semestre/Tipoco I/MATLAB/img/mariposa.jpg');
I2=imread('/Users/JohnReb/Desktop/Tareas Digitales/7to-Semestre/Tipoco I/MATLAB/img/mariposa.jpg');
I3=imread('/Users/JohnReb/Desktop/Tareas Digitales/7to-Semestre/Tipoco I/MATLAB/img/mariposa.jpg');
I4=imread('/Users/JohnReb/Desktop/Tareas Digitales/7to-Semestre/Tipoco I/MATLAB/img/mariposa.jpg');
I5=imread('/Users/JohnReb/Desktop/Tareas Digitales/7to-Semestre/Tipoco I/MATLAB/img/mariposa.jpg');

tic;
[Inclinar1]=inclinar(I1,45);
[Inclinar2]=inclinar(I2,80);
[Inclinar3]=inclinar(I3,-45);
[Inclinar4]=inclinar(I4,-80);
[Inclinar5]=inclinar(I5,-80);
toc;

tic;
[IRot1,IBand1]=rotar(Inclinar1,33);
[IRot2,IBand2]=rotar(Inclinar2,90);
[IRot3,IBand3]=rotar(Inclinar3,90);
[IRot4,IBand4]=rotar(Inclinar4,256);
[IRot5,IBand5]=rotar(Inclinar5,256);
toc;

% tic; [IRot1R, IBand1R, noPixeles1] = rellenarImg(IRot1, IBand1, 1); toc;
% tic; [IRot2R, IBand2R, noPixeles2] = rellenarImg(IRot2, IBand2, 1); toc;
% tic; [IRot3R, IBand3R, noPixeles3] = rellenarImg(IRot3, IBand3, 1); toc;

% fprintf('============================================\n')
% total1=size(IRot1, 1)*size(IRot1,2);
% fprintf('Imagen 1 (%d, %d)\n', size(IRot1,1),size(IRot1,2));
% fprintf('Pixeles recuperados %d (&7.5f porsentaje)\n', noPixeles1, (noPixeles1/total1*100));


tic;
[Inclinar1, IBand1]=perspectiva(IRot1,0.0045);
[Inclinar2, IBand2]=perspectiva(IRot2,0.0080);
[Inclinar3, IBand3]=perspectiva(IRot3,-0.0040);
[Inclinar4, IBand4]=perspectiva(IRot4,-0.0080);
[Inclinar5, IBand5]=perspectiva(IRot5,-0.0040);
toc;

figure;
image(I); title('Imagen original');

figure;
subplot(2,2,1); image(Inclinar1); title('Inclinar1');
subplot(2,2,2); image(Inclinar2); title('Inclinar2'); 
subplot(2,2,3); image(Inclinar3); title('Inclinar3');
subplot(2,2,4); image(Inclinar4); title('Inclinar4');
subplot(2,2,4); image(Inclinar5); title('Inclinar4');


