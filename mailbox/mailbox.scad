$fn=64;

mailbox();

module mailbox() {
  l=482.5;
  w=158.75;
  h=222.25;

  translate([0,0,h-w/2]) rotate([0,90,0]) {
    cylinder(r=w/2,h=l);
    translate([0,-w/2,0]) cube([h-w/2,w,l]);
  }
}