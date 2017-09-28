clear all, clc, clf, close all;
% fr�gor till alessandro: 
% -vilket v�rde p� A?
% -�r det bra att leta efter lokala skillnader? motsvarar det h�ga frekvenser i fourier?
% -�r det bra att vi "drar ut" bilden fr�n 0 till 1? Blir f och g ens
%   j�mf�rbara d�?
% -vad h�nder med histogramet f�r skillnaden??
% -det h�nder fortfarande bara grejer f�r gammaL?
% -kvalitetsm�tt?
% -det betyder det n�r "flippar" i var vi �ndrar (stock eller buskage)?

addpath(genpath('ProvidedFiles'))
%f=importdata('forest.mat');
f=double(imread('trees.tif'));
f=(f-min(f(:)))/(max(f(:))-min(f(:)));

[x, y]=meshgrid(linspace(0,1,size(f,2)),linspace(0,1,size(f,1)));
std=0.2;
z = 1-exp(-(x-0.4).^2/(2*std^2) - (y-0.45).^2/(2*std^2))+0.3;
f=f.*z;

f=(f-min(f(:)))/(max(f(:))-min(f(:)));

A=0.01;
gammaL=0.025:0.1:2.5;
gammaH=2;%[0.2 2 20];
kVec=1/(80^2);%[0.01/(80^2) 0.1/(80^2) 1/(80^2)];

n=1;
for gL=gammaL
    for gH=gammaH
        for k=kVec
            
            figure(n)
            t=suptitle(['$\gamma_L$=',num2str(gL),' $\gamma_H$=',num2str(gH),' $c/D0$=',num2str(k)]);
            set(t,'Interpreter','latex')
            subplot(3,2,1)
            imshow(f,[])
            subplot(3,2,2)
            imhist((f-min(f(:)))/(max(f(:))-min(f(:))))
            
            g = homomorphic( f , A , gL, gH , k);
            
            subplot(3,2,3)
            imshow(g,[])
            subplot(3,2,4)
            imhist((g-min(g(:)))/(max(g(:))-min(g(:))))
            
            subplot(3,2,5)
            diff=(g-f);
            imshow(diff,[])
            subplot(3,2,6)
            imhist((diff-min(diff(:)))/(max(diff(:))-min(diff(:))))
            n=n+1;
            
        end
    end
end

