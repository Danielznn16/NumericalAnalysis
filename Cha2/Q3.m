clc;
cnt = 0;
off = 0.001;
l = 0.0000000000000000000001;
r = l;
for i=[1:1:10]
    while besselj(0,l)*besselj(0,r)>0
        r = r+0.01;
    end
    r = fzerotx(@ (Z) besselj(0,Z),[l,r]);
    fprintf("%d: %f\n",i,r);
    l = r+off;
    r = l;
end