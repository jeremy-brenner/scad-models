
$fn=128;

difference() {


union() {
  cylinder(r=38,h=8);
  translate([0,30,0]) finger();
  rotate([0,0,360/3]) translate([0,30,0]) finger();
  rotate([0,0,360/3*2]) translate([0,30,0]) finger();
}

translate([0,0,-0.1]) cylinder(r1=30,r2=20,h=50);

  
 // translate([0,0,-0.1]) cylinder(r=20,h=8.2);
}


//cylinder(r=20,h=10);
module finger() {
  fr=8;
  translate([0,0,50]) sphere(r=fr);
  cylinder(r=fr,h=50);
}

module ring() {
  ir=65/2;
  t=8;

  difference() {
    cylinder(r=ir+10,h=8);
    translate([0,0,-0.1]) cylinder(r=ir,h=8.2);
  }
}