use <../cpu-shelf/shelf.scad>

mat=true;
desk=true;
monitors=true;
computer=true;
rafters=true;
ducts=true;


$fn=32;


if(desk) desk();
if(computer) computer();
if(monitors) monitors();
if(ducts) ducts();
if(mat) mat();
if(rafters) rafters();

module rafters() {
  color("#c29432", 0.5) for ( i = [0 : 5] ){
    translate([1725-400*i,-400,2340]) cube([40,3000,230]);
  }
}

module monitors() {
  translate([180,180,740]) {
    translate([200,200,135]) omenMonitor();
    translate([0,750,84]) dellMonitor();
    rotate([0,0,90]) mirror([0,1,0]) translate([0,750,84]) dellMonitor();
  }
}

module omenMonitor() {
  rotate([0,0,135]) translate([-560/2,0,0]) {
    color("#202020") hull() {
      cube([560, 20, 330]);
      translate([560/2,20,330/2]) scale([6,1,3.5]) difference() {
        sphere(r=40);
        translate([-40,-40,-40]) cube([80,40,80]);
      }
    }
    color("#A0A0F0") translate([3,-0.1,25])  cube([560-6, 0.1, 330-28]);
  }
}

module dellMonitor() {
  rotate([0,0,90]) translate([-570/2,0,0]) {
    color("#202020") hull() {      
      translate([10,20,10]) rotate([90,0,0]) cylinder(r=10,h=20);
      translate([560,20,10]) rotate([90,0,0]) cylinder(r=10,h=20);
      translate([10,20,330]) rotate([90,0,0]) cylinder(r=10,h=20);
      translate([560,20,330]) rotate([90,0,0]) cylinder(r=10,h=20);
      translate([570/2,20,340/2]) scale([6,1,3.5]) difference() {
        sphere(r=40);
        translate([-40,-40,-40]) cube([80,40,80]);
      }
    }
    color("#A0A0F0") translate([20,-0.1,20])  cube([570-40, 0.1, 340-40]);
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