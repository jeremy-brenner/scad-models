include <./involute_gears.scad>;

module gear() {
  keyW=15.2;
  keyT=3.2;
  difference() {
    bevel_gear (
        number_of_teeth=20,
        cone_distance=50,
        face_width=5,
        outside_circular_pitch=205,
        pressure_angle=30,
        clearance = 0.2,
        bore_diameter=5,
        gear_thickness = 15,
        backlash = 0,
        involute_facets=0,
        finish = -1);
    translate([-keyT/2,-keyW/2,-0.5]) cube([keyT,keyW,15]);
    translate([0,0,-0.5]) cylinder(r=5.75, h=10);
  }
}
