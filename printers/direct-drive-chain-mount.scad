use <chain-mount.scad>;

$fn=32;

wallT=1.5;
motorW=42.5;
boxW=motorW+wallT*2;


rotate([180,0,0]) {
  mountBracket();
  bracketConnector();
  translate([boxW,0,0]) mirror([1,0,0]) bracketConnector();

  translate([49.2,-2.25,10]) rotate([90,0,-90])   chainMount();

  rotate([0,0,-2]) translate([0,-7.5,0]) {
  translate([13.5,0,17.75]) rotate([90,0,0]) difference() {
    rotate_extrude(convexity = 10) translate([20, 0, 0]) cableU();
    rotate([0,0,20]) translate([-500,0,-500]) cube([1000,1000,1000]);
    rotate([0,0,45]) translate([-500,-2,2.5]) cube([1000,4,2]);
    rotate([0,0,-90]) translate([-500,0,-500]) cube([1000,1000,1000]);
  }

    translate([49.5,0,-2.25]) rotate([180,90,0]) 
  difference() {
    linear_extrude(height = 36) cableU();
    translate([-12,-10,18]) cube([10,30,17]);
    translate([-500,2.5,6]) cube([1000,2,4]);
  }
  }
}


module cableU() {
  difference() {
      union() {
        circle(r = 6.5);
        translate([-6.5,0]) square([13,6.5]);
      }
      circle(r = 5);
      translate([-5,0]) square([10,20]);
    }
}

module bracketConnector() {
   translate([boxW/2,boxW/2,0])  {
     rotate([0,0,-135]) translate([-2.5,28,0]) {
     cube([5,5,10]);
     translate([5,5,0]) difference() {
       cylinder(r=5,h=10);
       translate([0,-5,-0.1]) cube([10,10,10.2]);
       rotate([0,0,45]) translate([0,-5,-0.1]) cube([10,10,10.2]);
     }
   }
   }
}
module mountBracket() {
  difference() {
    chamferedSquare(boxW,11.5,(boxW-36)/2);
    translate([1.5,1.5,1.5])   chamferedSquare(motorW,12,(motorW-34.5)/2);
    translate([(boxW-18)/2,-1,1.5]) cube([18,5,12]);
    translate([boxW/2,boxW/2,-1]) {
      honeyComb(7,14);
    }
  }

  translate([boxW/2,boxW/2,11.5]) {
    d=27.2;
    w=7;
    rotate([0,0,-45]) clip(w,d);
    rotate([0,0,-135]) clip(w,d);
    rotate([0,0,45]) clip(w,d);
    rotate([0,0,135]) clip(w,d);

  }
}


module honeyComb(hr,hd) {
    cylinder(r=hr,h=5,$fn=6);
    translate([0,hd,0]) cylinder(r=hr,h=5,$fn=6);
    rotate([0,0,60]) translate([0,hd,0]) cylinder(r=hr,h=5,$fn=6);
    rotate([0,0,120]) translate([0,hd,0]) cylinder(r=hr,h=5,$fn=6);
    rotate([0,0,180]) translate([0,hd,0]) cylinder(r=hr,h=5,$fn=6);
    rotate([0,0,240]) translate([0,hd,0]) cylinder(r=hr,h=5,$fn=6);
    rotate([0,0,300]) translate([0,hd,0]) cylinder(r=hr,h=5,$fn=6);
}

module clip(w,d) {
  translate([-w/2,d,0]) {
    cube([w,wallT,2]);
    translate([0,-1,0.2]) rotate([-30,0,0]) cube([w,1.5,2]);
  }
}
 
module chamferedSquare(w,h,c) {
  difference() {
    cube([w,w,h]);
    translate([0,w-c,-1]) rotate([0,0,45]) cube([w*2,w*2,h+2]);
    translate([c,0,-1]) rotate([0,0,135]) cube([w*2,w*2,h+2]);
    translate([w-c,0,-1]) rotate([0,0,-45]) cube([w*2,w*2,h+2]);
    translate([w,w-c,-1]) rotate([0,0,45]) cube([w*2,w*2,h+2]);
  }
}


