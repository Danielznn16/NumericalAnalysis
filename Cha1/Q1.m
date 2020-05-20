dec = 100;
dec2 = 10;
h = logspace(-16,0,dec);
tru = [0;1;dec];
for i = 1:1:dec
   tru(i) = max((sin([1;h(i)/dec2;1+h(i)]))) * h(i)/2;
end
rou = 0.0000000000000001 * h.^-1;
rou = rou.';
e_tot = tru+rou;
err = abs(((sin(1 + h) - sin(1)) ./ h) - cos(1));
plot(h,tru,h,rou,h,e_tot,h,err),loglog(h,tru,h,rou,h,e_tot,h,err),axis([0.0000000000000001 1 0.0000000000000001 10]);