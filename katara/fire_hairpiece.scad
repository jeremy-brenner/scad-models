$fn=32;
// linear_extrude(height = 1.4) scale(0.1) import("fire_emblem.svg");

mainCyl();

translate([9.5,0,0]) {
 intersection() {
 hinge();
  translate([0,0,10/3]) cylinder(r=3,h=10/3);
}
}

module hinge() {
difference() {
    cylinder(r=2,h=10);
    translate([0,0,-1])cylinder(r=1,h=12);
}
}

module mainCyl() {
    difference() {
        cylinder(r=8.4,h=10);
        translate([0,0,-1]) {
            cylinder(r=7,h=12);
            translate([-8.4,-16.8,0]) cube([16.8,16.8,12]);
        }
    }
}
