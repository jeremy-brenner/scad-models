
roundedBox([220,140,230], 60, $fn=64);

module roundedBox(size, radius)
{
	o = radius*2;
    rf = 180/$fn;

    // spheres
    translate([radius,radius,radius]) sphere(r=radius);
    translate([radius,radius,size[2]-radius]) sphere(r=radius);
    translate([radius,size[1]-radius,radius]) sphere(r=radius);
    translate([radius,size[1]-radius,size[2]-radius]) sphere(r=radius);
    translate([size[0]-radius,radius,radius]) sphere(r=radius);
    translate([size[0]-radius,radius,size[2]-radius]) sphere(r=radius);
    translate([size[0]-radius,size[1]-radius,radius]) sphere(r=radius);
    translate([size[0]-radius,size[1]-radius,size[2]-radius]) sphere(r=radius);

    // z cylinders
	translate([radius,radius,radius]) cylinder(r=radius, h=size[2]-o);
    translate([size[0]-radius,radius,radius]) cylinder(r=radius, h=size[2]-o);
	translate([size[0]-radius,size[1]-radius,radius]) cylinder(r=radius, h=size[2]-o);
	translate([radius,size[1]-radius,radius]) cylinder(r=radius, h=size[2]-o);

    // y cylinders
	translate([radius,radius,radius]) rotate([-90,0,0]) rotate([0,0,rf]) cylinder(r=radius, h=size[1]-o);
	translate([radius,radius,size[2]-radius]) rotate([-90,0,0]) rotate([0,0,rf]) cylinder(r=radius, h=size[1]-o);
    translate([size[0]-radius,radius,size[2]-radius]) rotate([-90,0,0]) rotate([0,0,rf]) cylinder(r=radius, h=size[1]-o);
    translate([size[0]-radius,radius,radius]) rotate([-90,0,0]) rotate([0,0,rf]) cylinder(r=radius, h=size[1]-o);

    // x cylinders
	translate([radius,radius,radius]) rotate([0, 90,0]) rotate([0,0,rf]) cylinder(r=radius, h=size[0]-o);
	translate([radius,radius,size[2]-radius]) rotate([0, 90,0]) rotate([0,0,rf]) cylinder(r=radius, h=size[0]-o);
	translate([radius,size[1]-radius,size[2]-radius]) rotate([0, 90,0]) rotate([0,0,rf]) cylinder(r=radius, h=size[0]-o);
	translate([radius,size[1]-radius,radius]) rotate([0, 90,0]) rotate([0,0,rf]) cylinder(r=radius, h=size[0]-o);

    // cubes
    translate([radius,radius,0]) cube([size[0]-o,size[1]-o,size[2]]);
    translate([radius,0,radius]) cube([size[0]-o,size[1],size[2]-o]);
    translate([0,radius,radius]) cube([size[0],size[1]-o,size[2]-o]);
}

