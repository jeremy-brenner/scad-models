$fn=64;
t=3.5;
h=200;
r=70;

ba=10;
difference() {
translate([30,-r-3,-96/2]) cube([30,6,96]);
translate([0,0,50]) armHook();
mirror([0,0,1]) translate([0,0,50]) armHook();
translate([51.2,0,41]) rotate([90,0,0]) cylinder(r=2.25,h=200);
mirror([0,0,1]) translate([51.2,0,41]) rotate([90,0,0]) cylinder(r=2.25,h=200);
}



// intersection() {
// armHook();
// translate([0,0,-4]) cylinder(r=1000,h=1000);
// }

module arch() {
  difference() {
    cylinder(r=r+t,h=h);
    translate([0,0,-1]) cylinder(r=r,h=h+2);
    translate([0,-(r+t+1),-1]) cube([r+t+1,(r+t+1)*2,h+2]);
    rotate([0,0,ba]) translate([0,-(r+t+1),-1]) cube([r+t+1,(r+t+1)*2,h+2]);
  }

  rotate([0,0,ba]) translate([0,r,0]) cube([100,t,h]);
  mirror([0,1,0]) translate([0,r,0]) cube([60,t,h]);


}

module armHook() {
  cw=17;
  difference() {
    intersection() {
      translate([0,0,-100]) arch();
       rotate([0,10,0]) translate([-1000,-1000,-cw/2]) cube([2000,2000,cw]);
    }
    rotate([0,10,0]) translate([52,0,0]) rotate([90,0,0]) cylinder(r=2.2,h=100);
    translate([0,0,2.4]) rotate([0,0,ba]) {
      pinHole(30);
      pinHole(80);
    }
  }
  // rotate([0,0,ba]) {
  // pinHole(30);
  //   pinHole(80);
  // }
}
  
module pinHole(x) {
  translate([x+10,71.75,-50]) cylinder(r=0.75,h=100);
  rotate([0,10,0]) translate([x,57.5,0]) rotate([0,90,0]) cylinder(r=15,h=20);
}