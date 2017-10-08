clear all,close all;

gammaL=0.25;%:0.1:2.5;
gammaH=2;%[0.2 2 20];
D01=80;
D02=sqrt(512^2+512^2);

f=double(imread('trees.tif'));
[p,q]=size(f);
P=2^(nextpow2(2*p+1));
Q=2^(nextpow2(2*q+1));

maxu = Q/2;
maxv = P/2;
u = linspace(1, 2*maxu, 2*maxu) - maxu;
v = linspace(1, 2*maxv, 2*maxv) - maxv;
[uu,vv] = meshgrid(u,v);
D = sqrt(uu.^2+ vv.^2);

H1=(gammaH-gammaL)*(1-exp(-(D/D01).^2))+gammaL;
hLimits1 = [min(min(H1)), max(max(H1))];

H2=(gammaH-gammaL)*(1-exp(-(D/D02).^2))+gammaL;
hLimits2 = [min(min(H1)), max(max(H2))];

figure(1)
colormap hot;
contour(uu, vv, H1);
colorbar('Location','eastoutside');
caxis(hLimits1);
title('3D Homomorphic Filter: $D_0=80$','Interpreter','latex','FontSize',16)            
xlabel('$u$','Interpreter','latex','FontSize',16);
ylabel('$v$','Interpreter','latex','FontSize',16);
set(gca,'YLim',[-500 500])
set(gca,'YTick',(-500:500:500))

figure(2)
x = D(end/2:end);
y = H1(end/2:end);

plot(x, y);
axis([0 maxu 0 2.1])
title('2D Homomorphic Filter: $D_0=80$','Interpreter','latex','FontSize',18)            
xlabel('$u$','Interpreter','latex','FontSize',16);
ylabel('$H(u, v)$','Interpreter','latex','FontSize',16);
text(15,gammaL,'$\gamma_L$','Interpreter','latex','FontSize',14)
text(100,gammaH,'$\gamma_H$','Interpreter','latex','FontSize',14)

figure(3)
colormap hot;
contour(uu, vv, H2);
colorbar('Location','eastoutside');
caxis(hLimits2);
title('3D Homomorphic Filter: $D_0=\sqrt{(P/2)^2+(Q/2)^2}$','Interpreter','latex','FontSize',16)            
xlabel('$u$','Interpreter','latex','FontSize',16);
ylabel('$v$','Interpreter','latex','FontSize',16);
set(gca,'YLim',[-500 500])
set(gca,'YTick',(-500:500:500))

figure(4)
x = D(end/2:end);
y = H2(end/2:end);

plot(x, y);
axis([0 maxu 0 2.1])
title('2D Homomorphic Filter: $D_0=\sqrt{(P/2)^2+(Q/2)^2}$','Interpreter','latex','FontSize',16)            
xlabel('$u$','Interpreter','latex','FontSize',16);
ylabel('$H(u, v)$','Interpreter','latex','FontSize',16);
text(15,gammaL+0.1,'$\gamma_L$','Interpreter','latex','FontSize',14)
text(450,gammaH,'$\gamma_H\rightarrow$','Interpreter','latex','FontSize',14)





