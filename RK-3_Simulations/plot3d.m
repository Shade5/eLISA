clear all
close all
clc
hold on
for x=-1:0.001:1
    for y=-1:0.001:1
        if x*x + y*y == 1
            plot3(x,y,x+y,'rx')
            pause(0.1);
        end
    end
end
