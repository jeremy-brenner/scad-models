$fn=32;

translate([100,0,0]) switchPlate();
mirror([1,0,0]) switchPlate();

translate([100,50,0]) rotate([0,0,180]) case();
// mount();

module mount() {
  difference() {
    union() {
      cylinder(r=5,h=10);
      translate([-5,0,0]) cube([10,5,10]);
    }
    translate([0,0,-0.1]) cylinder(r=2.2, h=5.2);
    translate([0,0,3]) cylinder(r1=2.2, r2=4, h=2.1);
    translate([0,0,5]) cylinder(r=4,h=20);

    translate([-5.1,-5,15]) scale([1,1.14,1]) rotate([0,90,0]) cylinder(r=10,h=10.2);
  }
}

module case() {
  cube([105,40,1.2]); 
  translate([105/2-70/2,40,0]) cube([70,1.2,20]);
  cube([105,1.2,5]);
  translate([0,40,0]) cube([105,1.2,5]);
  cube([1.2,28,20]);
  cube([1.2,40,5]);
  translate([105-1.2,0,0]) {
    cube([1.2,28,20]);
    cube([1.2,40,5]);
  }
  translate([105/2-1.2/2,0,0]) cube([1.2,40,20]);

  o=28/2;
  translate([o,15,1.2]) cylinder(r=1.8,h=5);
  translate([o+25.5,15,1.2]) cylinder(r=2,h=5);
  translate([o+25.5*2,15,1.2]) cylinder(r=2,h=5);
  translate([o+25.5*3,15,1.2]) cylinder(r=2,h=5);

  translate([-5,20,20]) mirror([0,0,1]) rotate([0,0,-90]) mount();
  translate([110,20,20]) mirror([0,0,1]) rotate([0,0,90]) mount();

}

module switchPlate() {

  difference() {
    rotate([0,0,45]) {
      difference() {
        cylinder(r=9.5/2+1.6,h=15);
        translate([0,0,-1]) {
          cylinder(r=9.5/2,h=22);
          cube([10,10,22]);
        }
      }
      translate([9.5/2+0.8,0,0]) cylinder(r=0.8,h=20);
      translate([0,9.5/2+0.8,0]) cylinder(r=0.8,h=20);
    }
    translate([-10,9.5/2,-2.5]) rotate([0,90,0]) cylinder(r=10,h=20);
    translate([-10,9.5/2,22.5]) rotate([0,90,0]) cylinder(r=10,h=20);
  }

  
  translate([-10,-9.5/2-0.8-2.5,0]) hull() {
    cylinder(r=2.5,h=15);
    translate([35,0,0]) cylinder(r=2.5,h=15);
  }
}

// difference() {
//   cube([1.2,50,40]);
//   translate([-1,12,25]) rotate([0,90,0]) cylinder(r=2,h=3.2);
//   translate([-1,38,25]) rotate([0,90,0]) cylinder(r=2,h=3.2);
// }
// translate([1.2,0,0]) cube([10,15,1.2]);


// hull() {
//   translate([5,0,5]) sphere(r=5);
//   translate([10,0,5]) sphere(r=5);
//   cube([15,50,10]);
// }
