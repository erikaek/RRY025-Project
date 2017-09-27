function [ g ] = homomorphic( f , A , gammaL, gammaH, c, D0)
%homomorphic: Summary of this function goes here
%   Detailed explanation goes here

[p,q]=size(f);

% taking the logarithm of the image
f_log=log(f + A);

% creating the FT-image and transferring to coord. system corr. to
% filtering

P=2^(nextpow2(2*p+1));
Q=2^(nextpow2(2*q+1));

F=fftshift(fft2(f_log,P,Q));

% creating the template grid used to create the filter
D = raduv(F);

% creating the homomorphic filter
H=(gammaH-gammaL)*(1-exp(-c*(D/D0).^2))+gammaL;

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
