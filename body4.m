% 3D  four body simulation

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
za0 = -0.822771837*AU;
zav0 = -1.47221479*4.7437*10^3;

xb0 = -3.3030197*AU;
xbv0 = 1.58743376*4.7437*10^3;
yb0 = 0.822771837*AU;
ybv0 = 1.47221479*4.7437*10^3;
zb0 = 0.822771837*AU;
zbv0 = 1.47221479*4.7437*10^3;

xc0 = 0;
xcv0 = -3.174867535*4.7437*10^3;
yc0 = 0;
ycv0 = -2.94442961*4.7437*10^3;
zc0 = 0;
zcv0 = -2.94442961*4.7437*10^3;

xd0 = 6*AU;
xdv0 = 1000;
yd0 = 6*AU;
ydv0 = 0;
zd0 = 6*AU;
zdv0 = 0;



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

for t = 1:300
    
    t 
    %step1
     xat1 = xa0 + h*(xav0)/3;
     xavt1 = xav0 - h*(G*SM*( (xa0-xb0)/( (xa0-xb0)^2+ (ya0-yb0)^2 +(za0-zb0)^2)^(3/2)   ...
                            + (xa0-xc0)/( (xa0-xc0)^2+ (ya0-yc0)^2 + (za0-zc0)^2)^(3/2) ...
                            + (xa0-xd0)/( (xa0-xd0)^2+ (ya0-yd0)^2 + (za0-zd0)^2)^(3/2)));
     
     xbt1 = xb0 + h*(xbv0)/3;
     xbvt1 = xbv0 - h*(G*SM*( (xb0-xa0)/( (xb0-xa0)^2+ (yb0-ya0)^2 +(zb0-za0)^2)^(3/2)     ... 
                             + (xb0-xc0)/( (xb0-xc0)^2+ (yb0-yc0)^2 +(zb0-zc0)^2)^(3/2)    ...
                             + (xb0-xd0)/( (xb0-xd0)^2+ (yb0-yd0)^2 +(zb0-zd0)^2)^(3/2)));
     
     xct1 = xc0 + h*(xcv0)/3;
     xcvt1 = xcv0 - h*(G*SM*( (xc0-xa0)/( (xc0-xa0)^2+ (yc0-ya0)^2 +(zc0-za0)^2)^(3/2)   ...
                            + (xc0-xb0)/( (xc0-xb0)^2+ (yc0-yb0)^2 +(zc0-zb0)^2)^(3/2)    ...
                            + (xc0-xd0)/( (xc0-xd0)^2+ (yc0-yd0)^2 +(zc0-zd0)^2)^(3/2)));
                            
     xdt1 = xd0 + h*(xdv0)/3;
     xdvt1 = xdv0 - h*(G*SM*( (xd0-xa0)/( (xd0-xa0)^2+ (yd0-ya0)^2 +(zd0-za0)^2)^(3/2)   ...
                            + (xd0-xb0)/( (xd0-xb0)^2+ (yd0-yb0)^2 +(zd0-zb0)^2)^(3/2)    ...
                            + (xd0-xc0)/( (xd0-xc0)^2+ (yd0-yc0)^2 +(zc0-zc0)^2)^(3/2)));
 
                            
                            
     
     yat1 = ya0 + h*(yav0)/3;
     yavt1 =yav0 - h*(G*SM*( (ya0-yb0)/( (xa0-xb0)^2+ (ya0-yb0)^2 +(za0-zb0)^2)^(3/2)      ...
                            + (ya0-yc0)/( (xa0-xc0)^2+ (ya0-yc0)^2 + (za0-zc0)^2)^(3/2)   ...
                            + (ya0-yd0)/( (xa0-xd0)^2+ (ya0-yd0)^2 + (za0-zd0)^2)^(3/2)));
     
     ybt1 = yb0 + h*(ybv0)/3;
     ybvt1 = ybv0 - h*(G*SM*( (yb0-ya0)/( (xb0-xa0)^2+ (yb0-ya0)^2 +(zb0-za0)^2)^(3/2)      ...
                             + (yb0-yc0)/( (xb0-xc0)^2+ (yb0-yc0)^2 +(zb0-zc0)^2)^(3/2)    ...
                             + (yb0-yd0)/( (xb0-xd0)^2+ (yb0-yd0)^2 +(zb0-zd0)^2)^(3/2)));
     
     yct1 = yc0 + h*(ycv0)/3;
     ycvt1 = ycv0 - h*(G*SM*( (yc0-ya0)/( (xc0-xa0)^2+ (yc0-ya0)^2 +(zc0-za0)^2)^(3/2)   ...
                            + (yc0-yb0)/( (xc0-xb0)^2+ (yc0-yb0)^2 +(zc0-zb0)^2)^(3/2)    ...
                            + (yc0-yd0)/( (xc0-xd0)^2+ (yc0-yd0)^2 +(zc0-zd0)^2)^(3/2)));
                            
     ydt1 = yd0 + h*(ydv0)/3;
     ydvt1 = ydv0 - h*(G*SM*( (yd0-ya0)/( (xd0-xa0)^2+ (yd0-ya0)^2 +(zd0-za0)^2)^(3/2)   ...
                            + (yd0-yb0)/( (xd0-xb0)^2+ (yd0-yb0)^2 +(zd0-zb0)^2)^(3/2)    ...
                            + (yd0-yc0)/( (xd0-xc0)^2+ (yd0-yc0)^2 +(zc0-zc0)^2)^(3/2)));
                            

                            
                            
                            
     zat1 = za0 + h*(zav0)/3;
     zavt1 =zav0 - h*(G*SM*( (ya0-yb0)/( (za0-zb0)^2+ (ya0-yb0)^2 +(za0-zb0)^2)^(3/2)      ...
                            + (ya0-yc0)/( (za0-zc0)^2+ (ya0-yc0)^2 + (za0-zc0)^2)^(3/2)   ...
                            + (ya0-yd0)/( (za0-zd0)^2+ (ya0-yd0)^2 + (za0-zd0)^2)^(3/2)));
 
     zbt1 = zb0 + h*(zbv0)/3;
     zbvt1 =zbv0 - h*(G*SM*( (zb0-za0)/( (xb0-xa0)^2+ (yb0-ya0)^2 +(zb0-za0)^2)^(3/2)      ...
                             + (zb0-zc0)/( (xb0-xc0)^2+ (yb0-yc0)^2 +(zb0-zc0)^2)^(3/2)    ...
                             + (zb0-zd0)/( (xb0-xd0)^2+ (yb0-yd0)^2 +(zb0-zd0)^2)^(3/2)));
     
     zct1 = zc0 + h*(zcv0)/3;
     zcvt1 = zcv0 - h*(G*SM*( (zc0-za0)/( (xc0-xa0)^2+ (yc0-ya0)^2 +(zc0-za0)^2)^(3/2)   ...
                            + (zc0-zb0)/( (xc0-xb0)^2+ (yc0-yb0)^2 +(zc0-zb0)^2)^(3/2)    ...
                            + (zc0-zd0)/( (xc0-xd0)^2+ (yc0-yd0)^2 +(zc0-zd0)^2)^(3/2)));
                            
     zdt1 = zd0 + h*(zdv0)/3;
     zdvt1 = zdv0 - h*(G*SM*( (zd0-za0)/( (xd0-xa0)^2+ (yd0-ya0)^2 +(zd0-za0)^2)^(3/2)   ...
                            + (zd0-zb0)/( (xd0-xb0)^2+ (yd0-yb0)^2 +(zd0-zb0)^2)^(3/2)    ...
                            + (zd0-zc0)/( (xd0-xc0)^2+ (yd0-yc0)^2 +(zc0-zc0)^2)^(3/2)));
                            
     

                            
                            
     %step 2
     
     xat2 = xa0 + 2*h*(xavt1)/3;
     xavt2 = xav0 - 2*h*(G*SM*( (xat1-xbt1)/( (xat1-xbt1)^2+ (yat1-ybt1)^2 + (zat1-zbt1)^2)^(3/2)     ... 
                              + (xat1-xct1)/( (xat1-xct1)^2+ (yat1-yct1)^2 + (zat1-zct1)^2)^(3/2)    ...
                              + (xat1-xdt1)/( (xat1-xdt1)^2+ (yat1-ydt1)^2 + (zat1-zdt1)^2)^(3/2)));
     
     xbt2 = xb0 + 2*h*(xbvt1)/3;
     xbvt2 = xbv0 - 2*h*(G*SM*( (xbt1-xat1)/( (xbt1-xat1)^2+ (ybt1-yat1)^2 + (zbt1-zat1)^2)^(3/2)    ...
                              + (xbt1-xct1)/( (xbt1-xct1)^2+ (ybt1-yct1)^2 + (zbt1-zct1)^2)^(3/2)    ...
                              + (xbt1-xdt1)/( (xbt1-xdt1)^2+ (ybt1-ydt1)^2 + (zbt1-zdt1)^2)^(3/2)));
     
     xct2 = xc0 + 2*h*(xcvt1)/3;
     xcvt2 = xcv0 - 2*h*(G*SM*( (xct1-xat1)/( (xct1-xat1)^2+ (yct1-yat1)^2 + (zct1-zat1)^2)^(3/2)      ...
                              + (xct1-xbt1)/( (xct1-xbt1)^2+ (yct1-ybt1)^2 + (zct1-zbt1)^2)^(3/2)    ...
                              + (xct1-xdt1)/( (xct1-xdt1)^2+ (yct1-ydt1)^2 + (zct1-zdt1)^2)^(3/2)));
     
     xdt2 = xd0 + 2*h*(xdvt1)/3;
     xdvt2 = xdv0 - 2*h*(G*SM*( (xdt1-xat1)/( (xdt1-xat1)^2+ (ydt1-yat1)^2 + (zdt1-zat1)^2)^(3/2)      ...
                              + (xdt1-xbt1)/( (xdt1-xbt1)^2+ (ydt1-ybt1)^2 + (zdt1-zbt1)^2)^(3/2)    ...
                              + (xdt1-xct1)/( (xdt1-xct1)^2+ (ydt1-yct1)^2 + (zdt1-zct1)^2)^(3/2)));
                              

                              
                              
     yat2 = ya0 + 2*h*(xavt1)/3;
     yavt2 = yav0 - 2*h*(G*SM*( (yat1-ybt1)/( (xat1-xbt1)^2+ (yat1-ybt1)^2 + (zat1-zbt1)^2)^(3/2)      ...
                              + (yat1-yct1)/( (xat1-xct1)^2+ (yat1-yct1)^2 + (zat1-zct1)^2)^(3/2)    ...
                              + (yat1-ydt1)/( (xat1-xdt1)^2+ (yat1-ydt1)^2 + (zat1-zdt1)^2)^(3/2)));
     
     ybt2 = yb0 + 2*h*(ybvt1)/3;
     ybvt2 = ybv0 - 2*h*(G*SM*( (ybt1-yat1)/( (xbt1-xat1)^2+ (ybt1-yat1)^2 + (zbt1-zat1)^2)^(3/2)    ...
                              + (ybt1-yct1)/( (xbt1-xct1)^2+ (ybt1-yct1)^2 + (zbt1-zct1)^2)^(3/2)    ...
                              + (ybt1-ydt1)/( (xbt1-xdt1)^2+ (ybt1-ydt1)^2 + (zbt1-zdt1)^2)^(3/2)));
     
     yct2 = yc0 + 2*h*(ycvt1)/3;
     ycvt2 = ycv0 - 2*h*(G*SM*( (yct1-yat1)/( (xct1-xat1)^2+ (yct1-yat1)^2 + (zct1-zat1)^2)^(3/2)      ...
                              + (yct1-ybt1)/( (xct1-xbt1)^2+ (yct1-ybt1)^2 + (zct1-zbt1)^2)^(3/2)    ...
                              + (yct1-ydt1)/( (xct1-xdt1)^2+ (yct1-ydt1)^2 + (zct1-zdt1)^2)^(3/2)));
     
     ydt2 = yd0 + 2*h*(ydvt1)/3;
     ydvt2 = ydv0 - 2*h*(G*SM*( (ydt1-yat1)/( (xdt1-xat1)^2+ (ydt1-yat1)^2 + (zdt1-zat1)^2)^(3/2)      ...
                              + (ydt1-ybt1)/( (xdt1-xbt1)^2+ (ydt1-ybt1)^2 + (zdt1-zbt1)^2)^(3/2)    ...
                              + (ydt1-yct1)/( (xdt1-xct1)^2+ (ydt1-yct1)^2 + (zdt1-zct1)^2)^(3/2)));
                              
                              
                              
                              
                              
     zat2 = za0 + 2*h*(xavt1)/3;
     zavt2 = zav0 - 2*h*(G*SM*( (zat1-zbt1)/( (xat1-xbt1)^2+ (yat1-ybt1)^2 + (zat1-zbt1)^2)^(3/2)      ...
                              + (zat1-zct1)/( (xat1-xct1)^2+ (yat1-yct1)^2 + (zat1-zct1)^2)^(3/2)    ...
                              + (zat1-zdt1)/( (xat1-xdt1)^2+ (yat1-ydt1)^2 + (zat1-zdt1)^2)^(3/2)));
     
     zbt2 = zb0 + 2*h*(zbvt1)/3;
     zbvt2 = zbv0 - 2*h*(G*SM*( (zbt1-zat1)/( (xbt1-xat1)^2+ (ybt1-yat1)^2 + (zbt1-zat1)^2)^(3/2)    ...
                              + (zbt1-zct1)/( (xbt1-xct1)^2+ (ybt1-yct1)^2 + (zbt1-zct1)^2)^(3/2)    ...
                              + (zbt1-zdt1)/( (xbt1-xdt1)^2+ (ybt1-ydt1)^2 + (zbt1-zdt1)^2)^(3/2)));
     
     zct2 = zc0 + 2*h*(zcvt1)/3;
     zcvt2 = zcv0 - 2*h*(G*SM*( (zct1-zat1)/( (xct1-xat1)^2+ (yct1-yat1)^2 + (zct1-zat1)^2)^(3/2)      ...
                              + (zct1-zbt1)/( (xct1-xbt1)^2+ (yct1-ybt1)^2 + (zct1-zbt1)^2)^(3/2)    ...
                              + (zct1-zdt1)/( (xct1-xdt1)^2+ (yct1-ydt1)^2 + (zct1-zdt1)^2)^(3/2)));
     
     zdt2 = zd0 + 2*h*(zdvt1)/3;
     zdvt2 = zdv0 - 2*h*(G*SM*( (zdt1-zat1)/( (xdt1-xat1)^2+ (ydt1-yat1)^2 + (zdt1-zat1)^2)^(3/2)      ...
                              + (zdt1-zbt1)/( (xdt1-xbt1)^2+ (ydt1-ybt1)^2 + (zdt1-zbt1)^2)^(3/2)    ...
                              + (zdt1-zct1)/( (xdt1-xct1)^2+ (ydt1-yct1)^2 + (zdt1-zct1)^2)^(3/2)));
                              
                              
                              
                              
                              
     
     % step 3
     
     xa1 = xa0 + h*(xav0 + 3*xavt2)/4;
     xav1 = xav0 - h*( G*SM*( (xa0-xb0)/( (xa0-xb0)^2+ (ya0-yb0)^2 + (za0-zb0)^2)^(3/2)     ...
                            + (xa0-xc0)/( (xa0-xc0)^2+ (ya0-yc0)^2 + (za0-zc0)^2)^(3/2) ...
                            + (xa0-xd0)/( (xa0-xd0)^2+ (ya0-yd0)^2 + (za0-zd0)^2)^(3/2)) ...
                   + 3*G*SM*( (xat2-xbt2)/( (xat2-xbt2)^2+ (yat2-ybt2)^2 + (zat2-zbt2)^2)^(3/2)  ...
                            + (xat2-xct2)/( (xat2-xct2)^2+ (yat2-yct2)^2 + (zat2-zct2)^2)^(3/2)  ...
                            + (xat2-xdt2)/( (xat2-xdt2)^2+ (yat2-ydt2)^2 + (zat2-zdt2)^2)^(3/2)))/4;
     
     xb1 = xb0 + h*(xbv0 + 3*xbvt2)/4;
     xbv1 = xbv0 - h*( G*SM*( (xb0-xa0)/( (xb0-xa0)^2+ (yb0-ya0)^2 + (zb0-za0)^2)^(3/2)  ...
                            + (xb0-xc0)/( (xb0-xc0)^2+ (yb0-yc0)^2 + (zb0-zc0)^2)^(3/2) ...
                            + (xb0-xd0)/( (xb0-xd0)^2+ (yb0-yd0)^2 + (zb0-zd0)^2)^(3/2))  ...        
                   + 3*G*SM*( (xbt2-xat2)/( (xbt2-xat2)^2+ (ybt2-yat2)^2 + (zbt2-zat2)^2)^(3/2) ...
                            + (xbt2-xct2)/( (xbt2-xct2)^2+ (ybt2-yct2)^2 + (zbt2-zct2)^2)^(3/2) ...
                            + (xbt2-xdt2)/( (xbt2-xdt2)^2+ (ybt2-ydt2)^2 + (zbt2-zdt2)^2)^(3/2)))/4;

                        
     xc1 = xc0 + h*(xcv0 + 3*xcvt2)/4;
     xcv1 = xcv0 - h*( G*SM*( (xc0-xa0)/( (xc0-xa0)^2+ (yc0-ya0)^2 + (zc0-za0)^2)^(3/2)  ...
                            + (xc0-xb0)/( (xc0-xb0)^2+ (yc0-yb0)^2 + (zc0-zb0)^2)^(3/2) ...
                            + (xc0-xd0)/( (xc0-xd0)^2+ (yc0-yd0)^2 + (zc0-zd0)^2)^(3/2))  ...        
                   + 3*G*SM*( (xct2-xat2)/( (xct2-xat2)^2+ (yct2-yat2)^2 + (zct2-zat2)^2)^(3/2) ...
                            + (xct2-xbt2)/( (xct2-xbt2)^2+ (yct2-ybt2)^2 + (zct2-zbt2)^2)^(3/2) ...
                            + (xct2-xdt2)/( (xct2-xdt2)^2+ (yct2-ydt2)^2 + (zct2-zdt2)^2)^(3/2)))/4;
                        
     xd1 = xd0 + h*(xdv0 + 3*xdvt2)/4;
     xdv1 = xdv0 - h*( G*SM*( (xd0-xa0)/( (xd0-xa0)^2+ (yd0-ya0)^2 + (zd0-za0)^2)^(3/2)  ...
                            + (xd0-xb0)/( (xd0-xb0)^2+ (yd0-yb0)^2 + (zd0-zb0)^2)^(3/2) ...
                            + (xd0-xc0)/( (xd0-xc0)^2+ (yd0-yc0)^2 + (zd0-zc0)^2)^(3/2))  ...        
                   + 3*G*SM*( (xdt2-xat2)/( (xdt2-xat2)^2+ (ydt2-yat2)^2 + (zdt2-zat2)^2)^(3/2) ...
                            + (xdt2-xbt2)/( (xdt2-xbt2)^2+ (ydt2-ybt2)^2 + (zdt2-zbt2)^2)^(3/2) ...
                            + (xdt2-xct2)/( (xdt2-xct2)^2+ (ydt2-yct2)^2 + (zdt2-zct2)^2)^(3/2)))/4;
                        

 
                        
                        
     ya1 = ya0 + h*(yav0 + 3*yavt2)/4;
     yav1 = yav0 - h*( G*SM*( (ya0-yb0)/( (xa0-xb0)^2+ (ya0-yb0)^2 + (za0-zb0)^2)^(3/2)     ...
                            + (ya0-yc0)/( (xa0-xc0)^2+ (ya0-yc0)^2 + (za0-zc0)^2)^(3/2) ...
                            + (ya0-yd0)/( (xa0-xd0)^2+ (ya0-yd0)^2 + (za0-zd0)^2)^(3/2)) ...
                   + 3*G*SM*( (yat2-ybt2)/( (xat2-xbt2)^2+ (yat2-ybt2)^2 + (zat2-zbt2)^2)^(3/2)  ...
                            + (yat2-yct2)/( (xat2-xct2)^2+ (yat2-yct2)^2 + (zat2-zct2)^2)^(3/2)  ...
                            + (yat2-ydt2)/( (xat2-xdt2)^2+ (yat2-ydt2)^2 + (zat2-zdt2)^2)^(3/2)))/4;
     
     yb1 = yb0 + h*(ybv0 + 3*ybvt2)/4;
     ybv1 = ybv0 - h*( G*SM*( (yb0-ya0)/( (xb0-xa0)^2+ (yb0-ya0)^2 + (zb0-za0)^2)^(3/2)  ...
                            + (yb0-yc0)/( (xb0-xc0)^2+ (yb0-yc0)^2 + (zb0-zc0)^2)^(3/2) ...
                            + (yb0-yd0)/( (xb0-xd0)^2+ (yb0-yd0)^2 + (zb0-zd0)^2)^(3/2))  ...        
                   + 3*G*SM*( (ybt2-yat2)/( (xbt2-xat2)^2+ (ybt2-yat2)^2 + (zbt2-zat2)^2)^(3/2) ...
                            + (ybt2-yct2)/( (xbt2-xct2)^2+ (ybt2-yct2)^2 + (zbt2-zct2)^2)^(3/2) ...
                            + (ybt2-ydt2)/( (xbt2-xdt2)^2+ (ybt2-ydt2)^2 + (zbt2-zdt2)^2)^(3/2)))/4;

                        
     yc1 = yc0 + h*(ycv0 + 3*ycvt2)/4;
     ycv1 = ycv0 - h*( G*SM*( (yc0-ya0)/( (xc0-xa0)^2+ (yc0-ya0)^2 + (zc0-za0)^2)^(3/2)  ...
                            + (yc0-yb0)/( (xc0-xb0)^2+ (yc0-yb0)^2 + (zc0-zb0)^2)^(3/2) ...
                            + (yc0-yd0)/( (xc0-xd0)^2+ (yc0-yd0)^2 + (zc0-zd0)^2)^(3/2))  ...        
                   + 3*G*SM*( (yct2-yat2)/( (xct2-xat2)^2+ (yct2-yat2)^2 + (zct2-zat2)^2)^(3/2) ...
                            + (yct2-ybt2)/( (xct2-xbt2)^2+ (yct2-ybt2)^2 + (zct2-zbt2)^2)^(3/2) ...
                            + (yct2-ydt2)/( (xct2-xdt2)^2+ (yct2-ydt2)^2 + (zct2-zdt2)^2)^(3/2)))/4;
                        
     yd1 = yd0 + h*(ydv0 + 3*ydvt2)/4;
     ydv1 = ydv0 - h*( G*SM*( (yd0-ya0)/( (xd0-xa0)^2+ (yd0-ya0)^2 + (zd0-za0)^2)^(3/2)  ...
                            + (yd0-yb0)/( (xd0-xb0)^2+ (yd0-yb0)^2 + (zd0-zb0)^2)^(3/2) ...
                            + (yd0-yc0)/( (xd0-xc0)^2+ (yd0-yc0)^2 + (zd0-zc0)^2)^(3/2))  ...        
                   + 3*G*SM*( (ydt2-yat2)/( (xdt2-xat2)^2+ (ydt2-yat2)^2 + (zdt2-zat2)^2)^(3/2) ...
                            + (ydt2-ybt2)/( (xdt2-xbt2)^2+ (ydt2-ybt2)^2 + (zdt2-zbt2)^2)^(3/2) ...
                            + (ydt2-yct2)/( (xdt2-xct2)^2+ (ydt2-yct2)^2 + (zdt2-zct2)^2)^(3/2)))/4;
                        
                        
                        

     za1 = za0 + h*(zav0 + 3*zavt2)/4;
     zav1 = zav0 - h*( G*SM*( (za0-zb0)/( (xa0-xb0)^2+ (ya0-yb0)^2 + (za0-zb0)^2)^(3/2)     ...
                            + (za0-zc0)/( (xa0-xc0)^2+ (ya0-yc0)^2 + (za0-zc0)^2)^(3/2) ...
                            + (za0-zd0)/( (xa0-xd0)^2+ (ya0-yd0)^2 + (za0-zd0)^2)^(3/2)) ...
                   + 3*G*SM*( (zat2-zbt2)/( (xat2-xbt2)^2+ (yat2-ybt2)^2 + (zat2-zbt2)^2)^(3/2)  ...
                            + (zat2-zct2)/( (xat2-xct2)^2+ (yat2-yct2)^2 + (zat2-zct2)^2)^(3/2)  ...
                            + (zat2-zdt2)/( (xat2-xdt2)^2+ (yat2-ydt2)^2 + (zat2-zdt2)^2)^(3/2)))/4;
     
     zb1 = zb0 + h*(zbv0 + 3*zbvt2)/4;
     zbv1 = zbv0 - h*( G*SM*( (zb0-za0)/( (xb0-xa0)^2+ (yb0-ya0)^2 + (zb0-za0)^2)^(3/2)  ...
                            + (zb0-zc0)/( (xb0-xc0)^2+ (yb0-yc0)^2 + (zb0-zc0)^2)^(3/2) ...
                            + (zb0-zd0)/( (xb0-xd0)^2+ (yb0-yd0)^2 + (zb0-zd0)^2)^(3/2))  ...        
                   + 3*G*SM*( (zbt2-zat2)/( (xbt2-xat2)^2+ (ybt2-yat2)^2 + (zbt2-zat2)^2)^(3/2) ...
                            + (zbt2-zct2)/( (xbt2-xct2)^2+ (ybt2-yct2)^2 + (zbt2-zct2)^2)^(3/2) ...
                            + (zbt2-zdt2)/( (xbt2-xdt2)^2+ (ybt2-ydt2)^2 + (zbt2-zdt2)^2)^(3/2)))/4;

                        
     zc1 = zc0 + h*(zcv0 + 3*zcvt2)/4;
     zcv1 = zcv0 - h*( G*SM*( (zc0-za0)/( (xc0-xa0)^2+ (yc0-ya0)^2 + (zc0-za0)^2)^(3/2)  ...
                            + (zc0-zb0)/( (xc0-xb0)^2+ (yc0-yb0)^2 + (zc0-zb0)^2)^(3/2) ...
                            + (zc0-zd0)/( (xc0-xd0)^2+ (yc0-yd0)^2 + (zc0-zd0)^2)^(3/2))  ...        
                   + 3*G*SM*( (zct2-zat2)/( (xct2-xat2)^2+ (yct2-yat2)^2 + (zct2-zat2)^2)^(3/2) ...
                            + (zct2-zbt2)/( (xct2-xbt2)^2+ (yct2-ybt2)^2 + (zct2-zbt2)^2)^(3/2) ...
                            + (zct2-zdt2)/( (xct2-xdt2)^2+ (yct2-ydt2)^2 + (zct2-zdt2)^2)^(3/2)))/4;
                        
     zd1 = zd0 + h*(zdv0 + 3*zdvt2)/4;
     zdv1 = zdv0 - h*( G*SM*( (zd0-za0)/( (xd0-xa0)^2+ (yd0-ya0)^2 + (zd0-za0)^2)^(3/2)  ...
                            + (zd0-zb0)/( (xd0-xb0)^2+ (yd0-yb0)^2 + (zd0-zb0)^2)^(3/2) ...
                            + (zd0-zc0)/( (xd0-xc0)^2+ (yd0-yc0)^2 + (zd0-zc0)^2)^(3/2))  ...        
                   + 3*G*SM*( (zdt2-zat2)/( (xdt2-xat2)^2+ (ydt2-yat2)^2 + (zdt2-zat2)^2)^(3/2) ...
                            + (zdt2-zbt2)/( (xdt2-xbt2)^2+ (ydt2-ybt2)^2 + (zdt2-zbt2)^2)^(3/2) ...
                            + (zdt2-zct2)/( (xdt2-xct2)^2+ (ydt2-yct2)^2 + (zdt2-zct2)^2)^(3/2)))/4;
                        
                        
                        
                        
         
    
     KE = 0.5*SM*( xav1*xav1 + xbv1*xbv1 + xcv1*xcv1  + xdv1*xdv1 ...
                 + yav1*yav1 + ybv1*ybv1 + ycv1*ycv1  + ydv1*ydv1 ...
                 + zav1*zav1 + zbv1*ybv1 + zcv1*ycv1  + zdv1*ydv1 );
     
     PE = -G*SM*( ( (xa1-xb1)^2+ (ya1-yb1)^2 + (za1-zb1)^2)^(-1/2) ...
                 + ((xb1-xc1)^2+ (yb1-yc1)^2 + (zb1-zc1)^2)^(-1/2) ...
                 + ((xa1-xc1)^2+ (ya1-yc1)^2 + (za1-zc1)^2)^(-1/2) ...
                 + ((xa1-xd1)^2+ (ya1-yd1)^2 + (za1-zd1)^2)^(-1/2) ...
                 + ((xb1-xd1)^2+ (yb1-yd1)^2 + (zb1-zd1)^2)^(-1/2) ...
                 + ((xd1-xc1)^2+ (yd1-yc1)^2 + (zd1-zc1)^2)^(-1/2) );
     
     E(t)= KE+PE;
     
    
     
     
     plot3(xa1,ya1,za1,'bo');
     
     plot3(xb1,yb1,zb1,'ro');
    
     plot3(xc1,yc1,zc1,'go');
     
     plot3(xd1,yd1,zd1,'yo');
     
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

figure();
     plot(E);
     
     
     
     
     
