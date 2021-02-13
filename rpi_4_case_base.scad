
module screwHole() translate([0,0,2]) cylinder(r=1.4, h=20, $fn=32);

module screwColumn() difference() {
    union() {
        cylinder(r=3.5, h=10.25, $fn=32);
        translate([-3.5,-3.5,0])cube(size=[7,3.5,10.25]);
        translate([-3.5-3.5/2,-2.1,0])cube(size=[10.5,3.5/2,10.25]);
    }
    translate([-3.5-3.5/2,-0.3,-1])cylinder(r=3.5/2, h=20, $fn=32);
    translate([3.5+3.5/2,-0.3,-1])cylinder(r=3.5/2, h=20, $fn=32);
    screwHole();
}


module mountPeg() difference() {
  union() {
    cylinder(r=2.9, h=5.95, $fn=32);
    cylinder(h=2.5, r1=5.4, r2=2.9, $fn=32);
    }
  screwHole();
}

module sideVentHole() translate([-5,0,7.7]) rotate([0,90,0]) union() {
    r = 1.2;
    h = 3;
    cylinder(r=r,h=10,$fn=32);
    translate([0,-r,0]) cube(size=[h,r*2,10]);
    translate([h,0,0]) cylinder(r=r,h=10,$fn=32);
}
module sideVents() union() {
   ventDist = 4.80;
   translate([30,17.55,0]) sideVentHole();
   translate([30,17.55 + ventDist,0]) sideVentHole();
   translate([30,17.55 + ventDist*2,0]) sideVentHole();
   translate([30,17.55 + ventDist*3,0]) sideVentHole();
   translate([30,17.55 + ventDist*4,0]) sideVentHole();
   translate([30,-31.05,0]) sideVentHole();
   translate([30,-31.05 + ventDist,0]) sideVentHole();
   translate([30,-31.05 + ventDist*2,0]) sideVentHole();
   translate([30,-31.05 + ventDist*3,0]) sideVentHole();
   translate([-30,-31.05,0]) sideVentHole();
   translate([-30,-31.05 + ventDist,0]) sideVentHole();
   translate([-30,-31.05 + ventDist*2,0]) sideVentHole();

   translate([13,40,0]) rotate([0,0,90]) sideVentHole();
   translate([13+ventDist,40,0]) rotate([0,0,90]) sideVentHole();
   translate([-17.5,40,0]) rotate([0,0,90]) sideVentHole();
   translate([-17.5+ventDist,40,0]) rotate([0,0,90]) sideVentHole();
}

module bottomVentHole() scale([5.2,1,1]) translate([0,-36.25,-1]) cylinder(r=2.5,h=5,$fn=32);
module bottomVents() union() {
  ventDist = 9.2;
  bottomVentHole();
  translate([0,ventDist,0]) bottomVentHole();
  translate([0,ventDist*2,0]) bottomVentHole();
  translate([0,ventDist*3,0]) bottomVentHole();
  translate([0,ventDist*4,0]) bottomVentHole();
  translate([0,ventDist*5,0]) bottomVentHole();
  translate([0,ventDist*6,0]) bottomVentHole();
  translate([0,ventDist*7,0]) bottomVentHole();
}

module mountingWing() {
  translate([37.4,35.3,0]) difference() {
    union() {
      cylinder(r=4.25, h=3.5, $fn=32);
      rotate([0,0,0]) translate([-8.5,-4.25,0]) cube(size=[8.5,8.5,3.5]);
      rotate([0,0,45]) translate([-17,-4.25,0]) cube(size=[17,8.5,3.5]);
    }
    translate([0,0,-1]) cylinder(r=2.2, h=10, $fn=32);
  }
}

module holeBump(w,h) {
  r = w/2/cos(180/4);
  translate([0,w/2,w/2]) rotate([0,90,0]) difference() {
    translate([0,0,-0.01]) rotate([0,0,45]) cylinder(h=0.52,r1=r,r2=r-0.75,$fn=4);
    translate([-w/2-h,-w/2,-1]) cube(size=[w,w,3]);
  }
}

module plugHole(w1,w2,h) {
  d = w1 - w2;
  intersection() {
    union() {
      cube(size=[2,w1,w1]);
      translate([2,0,0]) holeBump(w1,w1-1);
      translate([2.49,d/2,d/2]) cube(size=[2.00,w2,w2]);
    }
    cube([8,w1*2,h]);
  }
}

module usbPort() { 
  cube(size=[16.45,2,10]);
  translate([0.95,1.9,0.69]) cube(size=[14.45,2,8]);
}

module case() union() {
  difference() {
    union() {
        translate([-30.95,-48,0]) cube(size=[61.9,90.5,10.25]);
        mountingWing();
        mirror([0,1,0]) mountingWing();
   
    }
    difference() {
        translate([-28.95,-46,2]) cube(size=[57.9,86.5,10]);
        translate([-29,-5.7,5.8]) holeBump(25.1, 4.5);
        translate([-29,21.9,5.8]) holeBump(13, 4.5);
    }
    sideVents();
    bottomVents();
    translate([-31.95,-5.65, 5.3]) plugHole(11.5,8.5,6);
    translate([-31.95,7.85, 5.3]) plugHole(11.5,8.5,6);
    translate([-31.95,21.9, 5.3]) plugHole(12.97,10,6);
    translate([-9.2,-48.8,7.1]) usbPort();
    translate([-27.15,-48.8,7.1]) usbPort();
    translate([9,-48.8,6.65]) cube(size=[17.4,5,10]);//network jack
    translate([-31.95,-14.35,10.25]) audioJack();
    translate([-7.9,39.9,-2.7]) sdHole();
  }
  translate([-24.44,35.56,0]) mountPeg();
  translate([24.44,35.56,0]) mountPeg();
  translate([-24.44,-22.34,0]) mountPeg();
  translate([24.44,-22.34,0]) mountPeg();
  translate([25,44.15,0]) screwColumn();
  translate([-25,44.15,0]) screwColumn();
  translate([-33,-42.35,0]) rotate([0,0,90]) screwColumn();
  mirror([1,0,0]) translate([-33,-42.35,0]) rotate([0,0,90]) screwColumn();

}

module audioJack() rotate([0,90,0]) {
    cylinder(r=4.75,h=2,$fn=32);
    translate([0,0,1.99]) cylinder(r=3.5,h=2,$fn=32);
}
module sdHole() {
  translate([1,0,0]) cube([13.5,1.6,10]);
  translate([-0.5,1.5,0]) cube([16.5,2,11.5]);
}
union() {
 // import("Pi4_BaseVented_fixed.stl");
  case();
}

//union() {
//    import("Pi4_BaseVented_fixed.stl");
//    translate([37.4,35.3,0]) difference() {
//        union() {
//            cylinder(r=4.25, h=3.5, $fn=32);
//            rotate([0,0,0]) translate([-8.5,-4.25,0]) cube(size=[8.5,8.5,3.5]);
//            rotate([0,0,45]) translate([-17,-4.25,0]) cube(size=[17,8.5,3.5]);
//        }
//        translate([0,0,-1]) cylinder(r=2.2, h=10, $fn=32);
//    }
//}