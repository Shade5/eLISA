clear all
clc
close all
hold on


%axis([0 500000 0 10e+39])

h=60*60*240;

G= 6.67408 * 10^-11;

SM = 1.98855*10^30;

AU =1.49597871 * 10^11;


xa0 = 3.3030197*AU;
xav0 = 1.58743376*4.7437*10^3;
ya0 = -0.822771837*AU;
yav0 = 1.47221479*4.7437*10^3;

xb0 = -3.3030197*AU;
xbv0 = 1.58743376*4.7437*10^3;
yb0 = 0.822771837*AU;
ybv0 = 1.47221479*4.7437*10^3;

xc0 = 0;
xcv0 = -3.174867535*4.7437*10^3;
yc0 = 0;
ycv0 = -2.94442961*4.7437*10^3;



%{
xa0 = AU;
xav0 = 0;
ya0 = 0;
yav0 = sqrt(G*SM*3/(AU*2));

xb0 = -AU;
xbv0 = 0;
yb0 = 0;
ybv0 = -sqrt(G*SM*3/(AU*2));

xc0 = 0;
xcv0 = 0;
yc0 = 0;
ycv0 = 0;
%}
E=zeros(50000,1);

for t = 1:5000000
    
    
    %step1
     xat1 = xa0 + h*(xav0)/3;
     xavt1 = xav0 - h*(G*SM*( (xa0-xb0)/( (xa0-xb0)^2+ (ya0-yb0)^2)^(3/2)   + (xa0-xc0)/( (xa0-xc0)^2+ (ya0-yc0)^2)^(3/2) ));
     
     xbt1 = xb0 + h*(xbv0)/3;
     xbvt1 = xbv0 - h*(G*SM*( (xb0-xa0)/( (xb0-xa0)^2+ (yb0-ya0)^2)^(3/2)   + (xb0-xc0)/( (xb0-xc0)^2+ (yb0-yc0)^2)^(3/2) ));
     
     xct1 = xc0 + h*(xcv0)/3;
     xcvt1 = xcv0 - h*(G*SM*( (xc0-xa0)/( (xc0-xa0)^2+ (yc0-ya0)^2)^(3/2)   + (xc0-xb0)/( (xc0-xb0)^2+ (yc0-yb0)^2)^(3/2) ));
     
     
     yat1 = ya0 + h*(yav0)/3;
     yavt1 = yav0 - h*(G*SM*( (ya0-yb0)/( (xa0-xb0)^2+ (ya0-yb0)^2)^(3/2)   + (ya0-yc0)/( (xa0-xc0)^2+ (ya0-yc0)^2)^(3/2) ));
     
     ybt1 = yb0 + h*(ybv0)/3;
     ybvt1 = ybv0 - h*(G*SM*( (yb0-ya0)/( (xb0-xa0)^2+ (yb0-ya0)^2)^(3/2)   + (yb0-yc0)/( (xb0-xc0)^2+ (yb0-yc0)^2)^(3/2) ));
     
     yct1 = yc0 + h*(ycv0)/3;
     ycvt1 = ycv0 - h*(G*SM*( (yc0-ya0)/( (xc0-xa0)^2+ (yc0-ya0)^2)^(3/2)   + (yc0-yb0)/( (xc0-xb0)^2+ (yc0-yb0)^2)^(3/2) ));
     
     
     %step 2
     
     xat2 = xa0 + 2*h*(xavt1)/3;
     xavt2 = xav0 - 2*h*(G*SM*( (xat1-xbt1)/( (xat1-xbt1)^2+ (yat1-ybt1)^2)^(3/2)   + (xat1-xct1)/( (xat1-xct1)^2+ (yat1-yct1)^2)^(3/2) ));
     
     xbt2 = xb0 + 2*h*(xbvt1)/3;
     xbvt2 = xbv0 - 2*h*(G*SM*( (xbt1-xat1)/( (xbt1-xat1)^2+ (ybt1-yat1)^2)^(3/2)   + (xbt1-xct1)/( (xbt1-xct1)^2+ (ybt1-yct1)^2)^(3/2) ));
     
     xct2 = xc0 + 2*h*(xcvt1)/3;
     xcvt2 = xcv0 - 2*h*(G*SM*( (xct1-xat1)/( (xct1-xat1)^2+ (yct1-yat1)^2)^(3/2)   + (xct1-xbt1)/( (xct1-xbt1)^2+ (yct1-ybt1)^2)^(3/2) ));
     
     
     yat2 = ya0 + 2*h*(yavt1)/3;
     yavt2 = yav0 - 2*h*(G*SM*( (yat1-ybt1)/( (xat1-xbt1)^2+ (yat1-ybt1)^2)^(3/2)   + (yat1-yct1)/( (xat1-xct1)^2+ (yat1-yct1)^2)^(3/2) ));
     
     ybt2 = yb0 + 2*h*(ybvt1)/3;
     ybvt2 = ybv0 - 2*h*(G*SM*( (ybt1-yat1)/( (xbt1-xat1)^2+ (ybt1-yat1)^2)^(3/2)   + (ybt1-yct1)/( (xbt1-xct1)^2+ (ybt1-yct1)^2)^(3/2) ));
     
     yct2 = yc0 + 2*h*(ycvt1)/3;
     ycvt2 = ycv0 - 2*h*(G*SM*( (yct1-yat1)/( (xct1-xat1)^2+ (yct1-yat1)^2)^(3/2)   + (yct1-ybt1)/( (xct1-xbt1)^2+ (yct1-ybt1)^2)^(3/2) ));
     
     
     % step 3
     
     xa1 = xa0 + h*(xav0 + 3*xavt2)/4;
     xav1 = xav0 - h*( G*SM*( (xa0-xb0)/( (xa0-xb0)^2+ (ya0-yb0)^2)^(3/2)   + (xa0-xc0)/( (xa0-xc0)^2+ (ya0-yc0)^2)^(3/2) )  + 3*G*SM*( (xat2-xbt2)/( (xat2-xbt2)^2+ (yat2-ybt2)^2)^(3/2)   + (xat2-xct2)/( (xat2-xct2)^2+ (yat2-yct2)^2)^(3/2) ))/4;
     
     xb1 = xb0 + h*(xbv0 + 3*xbvt2)/4;
     xbv1 = xbv0 - h*( G*SM*( (xb0-xa0)/( (xb0-xa0)^2+ (yb0-ya0)^2)^(3/2)   + (xb0-xc0)/( (xb0-xc0)^2+ (yb0-yc0)^2)^(3/2) )  + 3*G*SM*( (xbt2-xat2)/( (xbt2-xat2)^2+ (ybt2-yat2)^2)^(3/2)   + (xbt2-xct2)/( (xbt2-xct2)^2+ (ybt2-yct2)^2)^(3/2) ))/4;
     
     xc1 = xc0 + h*(xcv0 + 3*xcvt2)/4;
     xcv1 = xcv0 - h*( G*SM*( (xc0-xa0)/( (xc0-xa0)^2+ (yc0-ya0)^2)^(3/2)   + (xc0-xb0)/( (xc0-xb0)^2+ (yc0-yb0)^2)^(3/2) )  + 3*G*SM*( (xct2-xat2)/( (xct2-xat2)^2+ (yct2-yat2)^2)^(3/2)   + (xct2-xbt2)/( (xct2-xbt2)^2+ (yct2-ybt2)^2)^(3/2) ))/4;
     
     
     ya1 = ya0 + h*(yav0 + 3*yavt2)/4;
     yav1 = yav0 - h*( G*SM*( (ya0-yb0)/( (xa0-xb0)^2+ (ya0-yb0)^2)^(3/2)   + (ya0-yc0)/( (xa0-xc0)^2+ (ya0-yc0)^2)^(3/2) )  + 3*G*SM*( (yat2-ybt2)/( (xat2-xbt2)^2+ (yat2-ybt2)^2)^(3/2)   + (yat2-yct2)/( (xat2-xct2)^2+ (yat2-yct2)^2)^(3/2) ))/4;
     
     yb1 = yb0 + h*(ybv0 + 3*ybvt2)/4;
     ybv1 = ybv0 - h*( G*SM*( (yb0-ya0)/( (xb0-xa0)^2+ (yb0-ya0)^2)^(3/2)   + (yb0-yc0)/( (xb0-xc0)^2+ (yb0-yc0)^2)^(3/2) )  + 3*G*SM*( (ybt2-yat2)/( (xbt2-xat2)^2+ (ybt2-yat2)^2)^(3/2)   + (ybt2-yct2)/( (xbt2-xct2)^2+ (ybt2-yct2)^2)^(3/2) ))/4;
     
     yc1 = yc0 + h*(ycv0 + 3*ycvt2)/4;
     ycv1 = ycv0 - h*( G*SM*( (yc0-ya0)/( (xc0-xa0)^2+ (yc0-ya0)^2)^(3/2)   + (yc0-yb0)/( (xc0-xb0)^2+ (yc0-yb0)^2)^(3/2) )  + 3*G*SM*( (yct2-yat2)/( (xct2-xat2)^2+ (yct2-yat2)^2)^(3/2)   + (yct2-ybt2)/( (xct2-xbt2)^2+ (yct2-ybt2)^2)^(3/2) ))/4;
     
    
     KE = 0.5*SM*( xav1*xav1 + xbv1*xbv1 + xcv1*xcv1  + yav1*yav1 + ybv1*ybv1 + ycv1*ycv1 );
     
     PE = -G*SM*( ( (xa1-xb1)^2+ (ya1-yb1)^2)^(-1/2) + ((xb1-xc1)^2+ (yb1-yc1)^2)^(-1/2) + ((xa1-xc1)^2+ (ya1-yc1)^2)^(-1/2) );
     
     E(t)= KE+PE;
     
    
     
     
     plot(xa1,ya1,'bo');
     
     plot(xb1,yb1,'ro');
    
     plot(xc1,yc1,'go');
     
     pause(.0000001);
     
     
     
    
    
     
   
     
     xa0= xa1;
     xav0=xav1;
     
     xb0= xb1;
     xbv0=xbv1;
     
     xc0= xc1;
     xcv0=xcv1;
     
     ya0= ya1;
     yav0=yav1;
     
     yb0= yb1;
     ybv0=ybv1;
     
     yc0= yc1;
     ycv0=ycv1;
     
     
end
    % plot(E);
     
     
     
     
     
