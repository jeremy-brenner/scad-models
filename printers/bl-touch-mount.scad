$fn=32;

difference() {
  union() {
    translate([0,-10,0]) {
      translate([-5,0,0]) cube([10,31,2]);
      cylinder(r=5,h=2);
      translate([5,4.5,0]) cube([3.5,9,2]);
    }

    translate([-1,20,0]) cylinder(r=4,h=2);
    translate([-1,16,0]) cube([16,8,2]);
    translate([15,20,0]) cylinder(r=4,h=2);
    translate([-1,16,0]) cube([39.5,4,2]);
    translate([2,19,8]) rotate([0,90,0]) cylinder(r=1,h=36.5);

    translate([-2,5,0]) difference() {
      cube([14,14,3]);
      translate([18,0,-0.1]) cylinder(r=14,h=3.2);
    }
    translate([-2,-10,0]) cube([4,20,3]);
    translate([0,-10,0]) cylinder(r=2,h=3);

    translate([8,21,14]) rotate([90,0,0]) difference() {
      translate([-6,-14,0]) union() {
        cube([36.5,9,2]);
        translate([0,2,0]) cylinder(r=7,h=2);
        translate([0,2,2]) intersection() {
          torus(6,1);
          translate([-100,0,0]) cube([100,100,100]);
        }
      }
      translate([15,-9.5,-0.1]) cylinder(r=1.6, h=2.2);
      translate([25,-9.5,-0.1]) cylinder(r=1.6, h=2.2);
    }
    translate([5,5,0]) {
      difference() {
        cube([11,11,2]);
        translate([11,0,-0.1]) cylinder(r=11,h=2.2);
      }
      translate([11,0,2]) intersection() {
        torus(12,1);
        translate([-100,0,0]) cube([100,100,100]);
      }
      translate([11,12,2]) sphere(r=1);
    }
    translate([0,20,2]) rotate([90,0,0]) {
      //translate([2,-1,5]) sphere(r=4);
      //translate([0,0,0]) cylinder(r=1.5,h=8.5);
      translate([-4,0,0]) cylinder(r=1,h=30);
      translate([4,0,15]) cylinder(r=1,h=15);
    }
    translate([0,-10,2]) difference() {
      torus(4,1);
      translate([-5,0,-1]) cube([10,10,10]);
    }
  }

  translate([23,18.999,4.5]) rotate([90,0,0]) cylinder(r=3, h=10);
  translate([33,18.999,4.5]) rotate([90,0,0]) cylinder(r=3, h=10);

  translate([0,-10,0]) {
    translate([0,0,-0.1]) cylinder(r=1.5, h=2.5);
    translate([0,9,-0.1]) cylinder(r=1.6, h=10);
    translate([0,18,-0.1]) cylinder(r=1.5, h=2.5);
    translate([5,6,-0.1]) cube([2,6,2.2]);
    translate([5,8,-0.1]) cube([5,2,2.2]);
  }
  translate([-500,-500,-10]) cube([1000,1000,10]);
  
    

}

module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}

