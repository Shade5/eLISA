
x0 = [2000,1000];
fun = @opt;
options = optimset('Display','iter','PlotFcns',@optimplotfval);
[x,fval,exitflag,output] = fminsearch(fun,x0,options)