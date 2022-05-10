$fn=32;


difference() {
  union() {
    difference() {
      cylinder(r=1.5, h=2);
      translate([-2.5,0,-0.05]) cube([5,5,3.1]);  
    }  
    translate([-3.5,-0.5,0]) cube([7,1,2]);
  }
  translate([0,0,-0.05]) {
    cylinder(r=0.5, h=3.1);
    translate([-0.5,0,0]) cube([1,4,3.1]);
  } 
  translate([0,-0.4,0]) rotate([0,0,45]) translate([0,0,-0.05]) cube([2,2,2.1]);
}