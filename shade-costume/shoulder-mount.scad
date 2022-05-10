id=150;
t=2;
w=10;

difference() {
  baseThing(d=id+t*2,h=w,el=0);
  translate([0,0,-1]) baseThing(d=id,h=w+2,el=5);
}

module baseThing(d,h,el) {
  union() {
    cylinder(d=d,h=h);
    translate([-d/2,0,0]) cube([d,d/2+el,h]);
  }
}