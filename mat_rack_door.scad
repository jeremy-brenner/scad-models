$fn=128;

hr=20;
t=4;

hd=sqrt(2)*hr*2+t*3;

difference() {
  union() { 
    translate([-hr*2,-hr-t,0]) cube([hd*5,45,t]);
    translate([-hr*2-10,-hr-t,0]) cube([hd*5+20,10,t]);
  }
  holes();
}


module holes() {
  translate([0,0,0]) hole();
  translate([hd,0,0]) hole();
  translate([hd*2,0,0]) hole();
  translate([hd*3,0,0]) hole();
  translate([hd*4,0,0]) hole();
}


module hole() translate([0,0,-1]) rotate([0,0,50]) {
  cylinder(r=hr,h=t+2);
  translate([-hr,0,0]) cube([hr*2,hr*4,t+2]);
}
