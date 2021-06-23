$fn=128;


//color("#303030") mount();

color("white") translate([0,0,2]) center();

module mount() {
  translate([12,-15/2,0]) clasp();
  rotate([0,0,180]) translate([12,-15/2,0]) clasp();
  difference() {
    cylinder(r=13,h=2);
    translate([0,0,2]) center();
  }
}

module clasp() {
  
  linear_extrude(height=1.5) polygon(points=[[0,5], [0,15-5], [7,15], [7,0]]);

  translate([7,0,0.75]) cube([6,15,0.75]);
}

module center() {
  rotate([0,90,0]) scale([0.2,1,1]) sphere(r=9);
}