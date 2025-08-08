function  par = ParamSet(nSig)


par.nSig      =   nSig;
par.delta     =   0.2;  % iterative regularization parameter 
par.gamma     =   0.34; % noise re-estimate scale factor

if nSig <= 15
    par.bb        =   6;  % patch size
    par.nblk      =   50; % cardinality of similar patch groups
    par.S         =   20; % search region
    par.numitr    =   6;
    par.step      =   min(3, par.bb-1);
    
elseif nSig <= 30
    par.bb        =   7;  % patch size
    par.nblk      =   60; % cardinality of similar patch groups
    par.S         =   18; % search region
    par.numitr    =   8;
    par.step      =   min(3, par.bb-1);
    
elseif nSig <= 60
    par.bb        =   8;  % patch size
    par.nblk      =   70; % cardinality of similar patch groups
    par.S         =   14; % search region
    par.numitr    =   10;
    par.step      =   min(4, par.bb-1);
    
else
    par.bb        =   10;  % patch size
    par.nblk      =   100; % cardinality of similar patch groups
    par.S         =   8;   % search region
    par.numitr    =   14;
    par.step      =   min(5, par.bb-1);
end
    

