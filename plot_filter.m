clear all;

gammaL=0.2%:0.1:2.5;
gammaH=0.25;%[0.2 2 20];
k=0.1/(80^2);%[0.01/(80^2) 0.1/(80^2) 1/(80^2)];

% 

f=double(imread('trees.tif'));
[p,q]=size(f);
P=2^(nextpow2(2*p+1));
Q=2^(nextpow2(2*q+1));

maxu = Q/2;
maxv = P/2;
u = linspace(1, 2*maxu, 2*maxu) - maxu;
v = linspace(1, 2*maxv, 2*maxv) - maxv;
[uu,vv] = meshgrid(u,v);
D = sqrt(uu.^2/maxu^2 + vv.^2/maxv^2);

H=(gammaH-gammaL)*(1-exp(-k*(D).^2))+gammaL;
hLimits = [min(min(H)), max(max(H))];

t=suptitle(['$\gamma_L$=',num2str(gammaL),' $\gamma_H$=',num2str(gammaH),' $k$=',num2str(k)]);
set(t,'Interpreter','latex')

subplot(2, 2, 1);
colormap hot;
contour(uu, vv, H);
c = colorbar('Location','eastoutside');
%c.Label.String = 'H(u, v)';
caxis(hLimits);
t=xlabel('$u$');
set(t,'Interpreter','latex');
t=ylabel('$v$');
set(t,'Interpreter','latex');
            

subplot(2, 2, 2);
x = uu(1, :); 
x = x(end/2:end);
y = H(1, :);
y = y(end/2:end);

plot(x, y);
xlim([min(x), max(x)]);
ylim(hLimits);
t=xlabel('$u$');
set(t,'Interpreter','latex');
t=ylabel('$H(u, v)$');
set(t,'Interpreter','latex');
set(gca,'YTickLabel',{' '})


print('-bestfit','filters','-dpdf')
