sat1

d=365*24;
% (358878,179397)  365*60*24 with earth
% (358759,179334)  365*60*24 without earth
% (358707,179301)  365*60*24 with jupiter and earth
x0 = [358878,179397];
fun = @opt;
options = optimset('Display','iter','PlotFcns',@optimplotfval);
[x,fval,exitflag,output] = fminsearch(fun,x0,options)
x=round(x)