$fn=128;

or=9;
ir=7.1;
ih=6;
t=1;


// translate([-50,0,-202]) {
//     import("Barrel1.stl");
//     mirror([0,1,0]) import("Barrel1.stl");
// }

color("#FF6700") union() {
    difference() {
        cylinder(r=or+t,h=ih);
        translate([0,0,-0.5]) cylinder(r=or,h=ih+1);
    }

    difference() {
        cylinder(r=ir,h=ih);
        translate([0,0,-0.5]) cylinder(r=ir-t,h=ih+1);
    }
    
    translate([0,0,ih]) difference() {
        cylinder(r=or+t,h=t);
        translate([0,0,-0.5]) cylinder(r=ir-t,h=t+1);
    }
}