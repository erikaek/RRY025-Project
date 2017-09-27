clear all, clc, clf, close all;
% frågor till alessandro: 
% -vilket värde på A?
% -zeropadding till filter storlek + bild, vad ska vi tänka oss som
%  filter-storlek
% -padda filtret?
% -bara gL som gör skillnad?
% -4 oberoende variabler, är gL och gH verkligen oberoende? Kan A räknas som en variabel? 

addpath(genpath('ProvidedFiles'))
f=importdata('forest.mat');

A=1;
gammaL=[0.025 0.25 2.5];
gammaH=2;
kVec=1/(80^2);


n=1;
for gL=gammaL
    for gH=gammaH
        for k=kVec
            
            figure(n)
            suptitle(['gL=',num2str(gL),' gH=',num2str(gH),' c/D0=',num2str(k)]);
            %set(t,'interpreter','latex')
            subplot(3,2,1)
            imshow(f,[])
            subplot(3,2,2)
            imhist(f)
            
            g = homomorphic( f , A , gL, gH , k);
            
            subplot(3,2,3)
            imshow(g,[])
            subplot(3,2,4)
            imhist(g)
            
            subplot(3,2,5)
            imshow(abs(f-g))
            subplot(3,2,6)
            imhist(abs(f-g))
            
            n=n+1;
            
        end
    end
end

