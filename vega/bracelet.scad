$fn=64;

// rotate([0,90,0]) scale([1,1.3,1]) difference() {
//   cylinder(r=34.25,h=54);
//   translate([0,0,-0.1]) cylinder(r=33,h=54.2);
// }
// band();
// claw();

// claw();

// cube([20,80,1.2]);

// slots();


strapLoop();

module strapLoop() {
  difference() {
    hull() {
      cube([30,5,4.2]);
      translate([2.5,0,4.2]) cube([25,5,2.5]);
    }
    translate([2.5,-0.1,1.2]) cube([25,5.2,3]);
  }
}

module slots() {
  difference() {
    union() {
      translate([0,-5,100]) clawSlot();
      translate([26,-2,100]) rotate([0,0,8]) clawSlot();
      translate([-26,-2,100]) rotate([0,0,-8]) clawSlot();
    }
    scale([1,0.2,1]) cylinder(r=40,h=101);
  }
}
module clawSlot() {
  mirror([0,0,1]) mirror([0,1,0]) difference() {
  scale([0.35,1,1.5]) sphere(r=34);
  translate([-34,-34,-68]) cube([68,68,68]);
  translate([-34,-68,-1]) cube([68,68,68]);
  translate([-1.5,-0.1,-0.1]) cube([3,31,10]);
  translate([-2.5,-0.1,2]) cube([5,31,10]); 
 }
}


module claw() {
difference() {
scale([1,0.2,1]) difference() {
  union() {
    cylinder(r=40,h=100);
    translate([0,0,100]) cylinder(r1=40, r2=30,h=4);
  }
  translate([0,0,-0.1]) cylinder(r=24,h=104.2);
  translate([-100,0,-1]) cube([200, 200, 200]);
}
  translate([48,1,0]) scale([1,1,1.5]) rotate([90,0,0]) cylinder(r1=20, r2=40,h=30);
  translate([-48,1,0]) scale([1,1,1.5]) rotate([90,0,0]) cylinder(r1=20, r2=40,h=30);

}
}


module band() {
  translate([124,75.7,-40.9]) scale(1.25) import("./Cosplay_Garras_Vega_01.stl");
}

// module claw() {
//   // difference() {
//   translate([124,-41.8,-40.9]) scale(1.25) import("./Cosplay_Garras_Vega_00.stl");
//   // translate([152.8,0,-1000+36]) rotate([0,90,0]) difference() {
//   //   cylinder(r=1100, h=1000);
//   //   translate([0,0,-0.1]) cylinder(r=998.65,h=50);
//   // }
//   // }
//   // translate([152.8,-50,35]) cube([1000,100,20]);
// }
