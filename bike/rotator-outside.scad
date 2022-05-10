$fn=64;
rotatorOutside();

module rotatorOutside() {
    rt = 2;
    h = 10;
    ir = 20.2;
    or = ir+rt;

    difference() {
        cylinder(r=or, h=h);
        translate([0,0,-0.05]) cylinder(r=ir, h=h+0.1);
        translate([0,0,h-0.5]) cylinder(r1=ir, r2=ir+0.5, h=0.6);
        translate([0,0,3]) cylinder(r=ir+0.75,h=5);
        pip(ir);
        rotate([0,0,90]) pip(ir);
        rotate([0,0,180]) pip(ir);
        rotate([0,0,270]) pip(ir);
    }
}

module pip(tr) {
  translate([tr+0.25,-1.5,3]) cube([3,3,5]);
}