clear all, clc, clf, close all;

% fr?gor till alessandro: 
% -vilket v?rde p? A?
% -bara gL som g?r skillnad?
% -4 oberoende variabler, ?r gL och gH verkligen oberoende? Kan A r?knas som en variabel? 

addpath(genpath('ProvidedFiles'))
f=importdata('forest.mat');

%f=double(imread('trees.tif'));
% f=(f-min(f(:)))/(max(f(:))-min(f(:)));
% 
% [x, y]=meshgrid(linspace(0,1,size(f,2)),linspace(0,1,size(f,1)));
% std=0.2;
% z = 1-exp(-(x-0.4).^2/(2*std^2) - (y-0.45).^2/(2*std^2))+0.3;
% f=f.*z;
% 
% f=(f-min(f(:)))/(max(f(:))-min(f(:)));

A=0;%0.01;
gammaL=0.25;%0.025:0.1:2.5;
gammaH=2;%[0.2 2 20];
cVec=1*sqrt(512^2+512^2);%[0.1*sqrt(512^2+512^2) sqrt(512^2+512^2) 10*sqrt(512^2+512^2) 100*sqrt(512^2+512^2)];%[0.01/(80^2) 0.1/(80^2) 1/(80^2)];

n=1;
for gL=gammaL
    for gH=gammaH
        for c=cVec
            
            figure(n)
            t=suptitle(['$\gamma_L$=',num2str(gL),' $\gamma_H$=',num2str(gH),' $c$=',num2str(c)]);
            set(t,'Interpreter','latex')
            subplot(3,2,1)
            imshow(f,[])
            subplot(3,2,2)
            imhist((f-min(f(:)))/(max(f(:))-min(f(:))))
            
            g = homomorphic( f , A , gL, gH , c);

            subplot(3,2,3)
            imshow(g,[])
            subplot(3,2,4)
            imhist((g-min(g(:)))/(max(g(:))-min(g(:))))
            
            subplot(3,2,5)
            diff=(g-f);
            imshow(diff,[])
            subplot(3,2,6)
            %plot(D(end/2,:),H(end/2,:))
            
             imhist((diff-min(diff(:)))/(max(diff(:))-min(diff(:))))
            n=n+1;
            
        end
    end
end

