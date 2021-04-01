$fn=128;

difference() {
    cube([40,20,3]);
    translate([6,10,0]) screwHole();
    translate([34,10,0]) screwHole();
}

translate([11,0,0]) cube([18,3,32]);
translate([11,0,0]) cube([18,42,3]);
translate([11,0,29]) cube([18,16,3]);
translate([11,13,29]) cube([18,3,10]);
translate([11,10,36]) cube([18,6,3]);

rotate([5,0,0]) translate([11,7,5]) cube([18,1,25]);

translate([11,37,0]) {
  difference() {
    cube([18,5,10]);
    translate([-1,1,7]) rotate([0,90,0]) cylinder(r=1,h=20);
    translate([-1,-1,6]) cube([20,2,6]);
  }
  translate([0,1,9]) rotate([0,90,0]) cylinder(r=1,h=18);
}

module screwHole() {
    translate([0,0,1.5]) cylinder(r=5,h=10);
    translate([0,0,-0.5]) cylinder(r=2.5,h=10);

}