$fn=32;

difference() {
  linear_extrude(height = 1.8) scale(0.1) import("fire_emblem.svg");
  translate([0,6,0]) rotate([0,90,0]) cylinder(r=1.25,h=20);
}

