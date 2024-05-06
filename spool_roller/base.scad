
side();
translate([0,60,0]) side();

rotate([0,0,-59]) translate([-5,10,0]) cube([10,130,2]);
translate([0,79,0]) mirror([0,1,0]) rotate([0,0,-59]) translate([-5,10,0]) cube([10,130,2]);

module side() {
  difference() {
    union() {
      cube([20,19,17]);
      translate([112,0,0]) cube([20,19,12]);
    }
    translate([2,2,2]) cube([128,15,20]);
  }
}