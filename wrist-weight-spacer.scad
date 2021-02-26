width=10;

spacer(width);

module spacer(width) {
  $fn=32;
  difference() {
    union() {
      cylinder(r=3,h=width);
      translate([0,14,0]) cylinder(r=3,h=width);
      translate([-3,0,0]) cube([6,14,width]);
    }
    translate([-1,0,-0.5]) cube([2,14,width+1]);
    translate([-1,0,-0.5]) cube([10,2,width+1]);
  }
}