module snapClip(h) {
  translate([0,0,0]) cube([1,3,h]);
  translate([0,0,0]) difference() {
    translate([0,2,0]) cube([2,2,h]);
    rotate([0,0,25]) translate([2.6,0.5,-0.5]) cube([2,3,h+1]);
  }
}