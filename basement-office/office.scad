use <../cpu-shelf/shelf.scad>
use <./monitors.scad>
use <./monitor-lift.scad>

mat=true;
desk=true;
monitors=false;
liftedMonitors=true;
computer=true;
rafters=true;
ducts=true;
animate=false;
position=0; // [0:0.1:1]


p = animate ? $t*2 < 1 ? $t*2 : 1-($t*2-1) : position;
//p=0; // [0:0.1:1]
// p = 
// p=0.0;
mScale=0.35;
mOffset=250;

$fn=32;

//translate([300,-500,0]) cube([200,350,1830]);


// translate([400,400,1700]) rotate([0,0,15]) {
//   h=40;
//   r=380;
//   //r=200;
//   t=r*1.75;
//   cylinder(r=r,h=h, $fn=6);
//   translate([0,t,0]) cylinder(r=r,h=h, $fn=6);
//   rotate([0,0,-120]) translate([0,t,0]) cylinder(r=r,h=h, $fn=6);
// }

if(desk) desk();
if(computer) computer();
if(monitors) monitors();
if(liftedMonitors) liftedMonitors();
if(ducts) ducts();
if(mat) mat();
if(rafters) rafters();

module rafters() {
  color("#c29432", 0.5) for ( i = [0 : 5] ){
    translate([1725-400*i,-400,2340]) cube([40,3000,230]);
  }
}

module liftedMonitors() {
  moveIn=300;
  dellYOffset=670;
  translate([moveIn,moveIn,2000]) mirror([0,0,1]) {
    translate([200,200,0]) rotate([0,0,-135]) liftWithOmen(p,mScale,mOffset);
    translate([0,dellYOffset,0]) rotate([0,0,180]) liftWithDell(p,mScale,mOffset);
    rotate([0,0,90]) mirror([0,1,0]) translate([0,dellYOffset,0]) rotate([0,0,180]) liftWithDell(p,mScale,mOffset);
  }
}

module monitors() {
  translate([180,180,740]) {
    translate([200,200,135]) rotate([0,0,135]) omenMonitor();
    translate([0,750,84]) rotate([0,0,90]) dellMonitor();
    rotate([0,0,90]) mirror([0,1,0]) translate([0,750,84]) rotate([0,0,90]) dellMonitor();
  }
}

module mat() {
  translate([-40,-100,-20]) color("#202020") {
    cube([1830,1215,20]);
    translate([0,1220,0]) cube([1830,1215,20]);
  }
}

module ducts() {
  color("gray",0.5) translate([-1420,10,2100]) {
    translate([0,-150,0]) cube([2000,520,200]);
    translate([2000,0,0]) hull() {
      translate([0,-150,0]) cube([1,520,200]);
      translate([410,0,0]) cube([1,370,200]);
    }
    translate([2410,0,0]) cube([2000,370,200]);
  }
}



module computer() {
  translate([1420,260,1785]) rotate([0,0,90]) prettyRender();
}

module desk() {
  deskOne();
  translate([0,905,0]) deskTwo();
}

module deskOne() {
  color("#541503") difference() {
    union() {
      cube([1680, 600, 740]);
      cube([600, 900, 740]);
      translate([600,600,0]) difference() {
        cube([300, 300, 740]);
        translate([300,300,-1]) cylinder(r=300,h=742);
      }
    }
    translate([25,25,-25]) cube([1680-50, 900-50, 740]);
    translate([325,25,-25]) cube([399, 900, 740]);
  }
}

module deskTwo() {
  color("#541503") difference() {
    cube([600,1200,740]);
    translate([25,-25,-25]) cube([600,1200,740]);
  }
}