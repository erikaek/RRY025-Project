clear all, clc, clf, close all;
% frågor till alessandro: 
% -vilket värde på A?
% -är det bra att leta efter lokala skillnader? motsvarar det höga frekvenser i fourier?
% -är det bra att vi "drar ut" bilden från 0 till 1? Blir f och g ens
%   jämförbara då?
% -vad händer med histogramet för skillnaden??
% -det händer fortfarande bara grejer för gammaL?
% -kvalitetsmått?
% -det betyder det när "flippar" i var vi ändrar (stock eller buskage)?

addpath(genpath('ProvidedFiles'))
f=importdata('forest.mat');

A=0;
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
            %imshow((f-min(f(:)))/max(f(:)),[])
            imagesc(f), colormap gray
            subplot(3,2,2)
            imhist((f-min(f(:)))/(max(f(:))-min(f(:))))
            
            g = homomorphic( f , A , gL, gH , k);
            
            subplot(3,2,3)
            %imshow((g-min(g(:)))/max(g(:)),[])
            imagesc(g), colormap gray
            subplot(3,2,4)
            imhist((g-min(g(:)))/(max(g(:))-min(g(:))))
            
            subplot(3,2,5)
            diff=(g-f);
            %imshow((diff-min(diff(:)))/max(diff(:)),[])
            imagesc(diff), colormap gray
            subplot(3,2,6)
            imhist((diff-min(diff(:)))/(max(diff(:))-min(diff(:))))
            %imhist(diff)
            n=n+1;
            
        end
    end
end

