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

A=0;
gammaL=[0.025 0.25 2.5];
gammaH=2;
c=1;
D0=80;

n=1;
for i=1:length(A)
    for j=1:length(gammaL) 
        for k=1:length(gammaH)
            for l=1:length(c)
                for m=1:length(D0)
                    
                    figure(n)
                    suptitle(['A=',num2str(A(i)),' gL=',num2str(gammaL(j))...
                        ,' gH=',num2str(gammaH(k)),' c=',num2str(c(l)),' D_0='...
                        ,num2str(D0(m))]);
                    %set(t,'interpreter','latex')
                    subplot(3,2,1)
                    imshow(f,[])
                    subplot(3,2,2)
                    imhist(f)
                    
                    g = homomorphic( f , A(i) , gammaL(j), gammaH(k), c(l), D0(m));
                    
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
    end
end

