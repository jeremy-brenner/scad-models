r=5;
$fn = $preview ? 64 : 128;


difference() {
  union() {
    scale([1,1,0.5]) sphere(r=r);
    cylinder(r=r,h=20);
    translate([0,0,20]) scale([1,1,0.5]) sphere(r=r);
  }
  translate([0,0,-5]) cylinder(r=1.5,h=40);
}