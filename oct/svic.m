clear all;
close all;
clc;

addpath('./funciones')

dt = 1e-2;
t = -5:dt:5;
x = cajon(t)
plotCompleto([-2 4 -1 3],'t','Amplitud','Gráfico de la SVIC',25,'r*-',1.5,t,x);