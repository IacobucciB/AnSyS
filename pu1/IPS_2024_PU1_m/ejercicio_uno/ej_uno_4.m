clear all;close all;clc;addpath('../funciones');legajo = 022386;[n, x] = senial(legajo);ds = 0.001;s = -0.5:ds:0.5;% Análisis de Sistemas% Sistema Unoy1 = sys_1(x);% Sistema Dosy2 = sys_2(x);% Sistema Tresy3 = sys_3(x);% Sistema Cuatroy4 = sys_4(x);% Graficas de Funcionesset(0, 'DefaultTextFontSize', 12);set(0, 'DefaultLineLineWidth', 1.5);% Sistema Unofigure;stem(n, y1, 'o');title('Salida del Sistema Uno');xlabel('n');ylabel('y1[n]');% Sistema Dosfigure;stem(n, y2, 'o');title('Salida del Sistema Dos');xlabel('n');ylabel('y2[n]');% Sistema Tresfigure;stem(n, y3, 'o');title('Salida del Sistema Tres');xlabel('n');ylabel('y3[n]');% Sistema Cuatrofigure;stem(n, y4, 'o');title('Salida del Sistema Cuatro');xlabel('n');ylabel('y4[n]');