
is = 216;
t = 20;
h = 5;

difference() {
  cube([is+t*2,is+t*2,h]);
  translate([t,t,-0.5]) cube([is,is,h+1]);

}