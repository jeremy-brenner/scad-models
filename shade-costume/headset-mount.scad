
mw=175;
r=25;
d=55;
cw=170;
wd=mw-cw;

t=2;

h=55+t*2;
w=mw+t*2;

//mount();

intersection() {
  mount();
  translate([0,0,h/2]) cube([1000,1000,h/2]);
}


module mount() {
  difference() {
    union() {
      translate([0,5,0]) cube([w,d-5,h]);
      translate([r,d,0]) cylinder(r=r,h=h);
      translate([w-r,d,0]) cylinder(r=r,h=h);
      translate([w/2,d+15,0]) scale([(cw-9)/20/2,1,1]) cylinder(r=20,h=h);
    }
    translate([t,0,t]) cutout();
    translate([w/2-160/2,40,-1]) cube([160,30,t+2]);
    translate([-1,-1,-1]) cube([w+2,30,t+1.01]);
    translate([-1,-1,h-t-0.1]) cube([w+2,65,t+1.01]);
    translate([0,0,h/2]) rotate([0,90,0]) translate([0,0,-10]) scale([1,4,1]) cylinder(r=10,h=1000);
    translate([w/2,20,-1]) cylinder(r=15,h=5);
  }

  fw=5;
  translate([0,3,t]) cube([fw+t,t,17.5]);
  translate([0,3,t+37.5]) cube([fw+t,t,17.5]);
  translate([w-fw-t,3,t]) cube([fw+t,t,17.5]);
  translate([w-fw-t,3,t+37.5]) cube([fw+t,t,17.5]);
}

module cutout() {
  h=h-t*2;
  hull() {
    translate([0,-1,0]) cube([mw,1,h]);

    translate([r+wd/2,d,0]) cylinder(r=r,h=h);
    translate([-r+wd/2+cw,d,0]) cylinder(r=r,h=h);
    translate([mw/2,d+13,0]) scale([(cw-9)/20/2,1,1]) cylinder(r=20,h=h);
  }
}