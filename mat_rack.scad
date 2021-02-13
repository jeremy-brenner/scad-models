$fn=128;

hr=20;
t=4;
sr=hr+t;

segment(sr,hr,t,0);
segment(sr,hr,t,1);
segment(sr,hr,t,2);
segment(sr,hr,t,3);
segment(sr,hr,t,4);

module segment(sr,hr,t,o) {
  co = sqrt(2)*sr;
  translate([0,co*2*o,0]) difference() {
    union() {
      cylinder(r=sr, h=t);
      translate([-co/2,co/2,0]) cube([co,co,t]);
      translate([0,co*2,0]) cylinder(r=sr, h=t);
      translate([-10,-co,0]) cube([20,co*4,t]);
    }
    translate([co,co,-1]) cylinder(r=sr, h=t+2);
    translate([-co,co,-1]) cylinder(r=sr, h=t+2);
    translate([0,0,-1]) cylinder(r=hr, h=t+2);
    translate([0,co*2,-1]) cylinder(r=hr, h=t+2);
  }
  
}
//cylinder(r=hr, h=2);
