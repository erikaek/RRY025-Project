function [ g ] = homomorphic( f , A , gammaL, gammaH, k)
%homomorphic: Applies Homomorphic filtering to an input image f provided
%             filter parameters and compensation A for image zeros
%
% INPUT:
%   f - input image  
%   A - translating factor to avoid 0:s in the logarithm, scaled depending
%       on image gray scale span
%   gammaL - filter variable 
%   gammaH - filter variable
%   k - filter variable
%
% OUTPUT:
%   g - filtered image
%

[p,q]=size(f);

% taking the logarithm of the image
f_log=log(f + A);

% calculating size of zeropadded image as the next power of 2 for two times 
% the dimension size 
P=2^(nextpow2(2*p+1));
Q=2^(nextpow2(2*q+1));

% creating the FT-image and transferring to coord. system corr. to
% filtering
F=fftshift(fft2(f_log,P,Q));

% creating the template grid used to create the filter
maxu = Q/2;
maxv = P/2;
u = linspace(1, Q, Q) - maxu;
v = linspace(1, P, P) - maxv;
[uu,vv] = meshgrid(u,v);
D = sqrt(uu.^2/maxu^2 + vv.^2/maxv^2);

% creating the homomorphic filter
H=(gammaH-gammaL)*(1-exp(-(D/k).^2))+gammaL;

% filtering image and changing back to original coord. syst.
G=ifftshift(F.*H);

% taking IDFT
g_log=real(ifft2(G));

% removing effect of logarithm
g=exp(g_log)-A;

% removing bias, i.e preserving image flux
mu_f=sum(sum(f))/(P*Q);
mu_g=sum(sum(g))/(P*Q);
BIAS=mu_g-mu_f;
g=g-BIAS;

% removing padding
g=g(1:p,1:q);

end

