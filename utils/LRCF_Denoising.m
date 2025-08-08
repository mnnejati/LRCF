function res = LRCF_Denoising( sigma, nI, oI  )
%==========================================================================
% Image denoising based on optimal low-rank matrix recovery
%
% Inputs:
% sigma - standard deviation of the added Gaussian noise.
% nI    - input noisy image.
% oI    - original image (optional) only used for printing the PSNR after
%         each step.
%==========================================================================
if (nargin==2)
   oI = [];
end

par = ParamSet( sigma );
res = LRCF( nI, oI, par );

if (~isempty(oI))
    fprintf('-------------------------\n');
    fprintf(' PSNR = %.2f\n',res.psnr);
    fprintf('-------------------------\n');
end
return