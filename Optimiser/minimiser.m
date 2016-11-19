sat1

d=365*24;

x0 = [5982,3000];
fun = @opt;
options = optimset('Display','iter','PlotFcns',@optimplotfval);
[x,fval,exitflag,output] = fminsearch(fun,x0,options)
x=round(x)