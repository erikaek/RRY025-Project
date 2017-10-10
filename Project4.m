clear all, clc, clf, close all;

% fr?gor till alessandro: 
% -vilket v?rde p? A?
% -bara gL som g?r skillnad?
% -4 oberoende variabler, ?r gL och gH verkligen oberoende? Kan A r?knas som en variabel? 

addpath(genpath('ProvidedFiles'))
% f=importdata('forest.mat');

f=double(imread('trees.tif'));
f=(f-min(f(:)))/(max(f(:))-min(f(:)));

[x, y]=meshgrid(linspace(0,1,size(f,2)),linspace(0,1,size(f,1)));
std=0.2;
z = 1-exp(-(x-0.4).^2/(2*std^2) - (y-0.45).^2/(2*std^2))+0.3;
f=f.*z;

f=(f-min(f(:)))/(max(f(:))-min(f(:)));

A=0.01;
gammaL=0.01;%0.025:0.1:2.5;
gammaH=0.2;%[0.2 2 20];
kVec=80;%[8 80 800];

n=1;
for gL=gammaL
    for gH=gammaH
        for k=kVec
            
            figure(1)
            t=suptitle('Noise Polluted Image');
            set(t,'Interpreter','latex','FontSize',18)
%             subplot(3,2,1)
            imshow(f,[])
%             subplot(3,2,2)
%             imhist((f-min(f(:)))/(max(f(:))-min(f(:))))
            
            g = homomorphic( f , A , gL, gH , k);

            %subplot(3,2,3)
            figure(2)
            t=suptitle('Filtered Image');
            set(t,'Interpreter','latex','FontSize',18)
            imshow(g,[])
            %subplot(3,2,4)
            %imhist((g-min(g(:)))/(max(g(:))-min(g(:))))
            
%             subplot(3,2,5)
%             diff=(g-f);
%             imshow(diff,[])
%             subplot(3,2,6)
            %plot(D(end/2,:),H(end/2,:))
            
%             imhist((diff-min(diff(:)))/(max(diff(:))-min(diff(:))))
            n=n+1;
            
        end
    end
end

