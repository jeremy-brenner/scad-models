width=10;
length=14;
radius=3;

spacer(width,length,radius);

module spacer(width,length,radius) {
  $fn=32;
  difference() {
    union() {
      cylinder(r=radius,h=width);
      translate([0,length,0]) cylinder(r=radius,h=width);
      translate([-radius,0,0]) cube([radius*2,length,width]);
    }
    translate([-1,0,-0.5]) cube([2,length,width+1]);
    translate([-1,0,-0.5]) cube([radius*2,2,width+1]);
  }
}