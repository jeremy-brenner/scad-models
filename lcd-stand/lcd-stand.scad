screen = [11,350,225];
$fn=32;

t=1.6;
cr=t*1.5;
a=5;
w=15;
baseL=35;

// projection(cut = false) 
// screen();

brace(a);

translate([14.5,0,0]) mirror([1,0,0]) brace(-a);

translate([16.5,0,0]) brace(-a);


rotate([0,90,0]) translate([-t,0,cr]) {
  cube([t,w,baseL]);
  translate([t/2,0,baseL]) rotate([-90,0,0]) cylinder(r=t/2,h=w);
}

module brace(ba) {
  translate([cr,0,cr]) rotate([0,ba,0]) translate([-cr,0,0]) {
    cube([t,w,20]);
    translate([t/2,0,20]) rotate([-90,0,0]) cylinder(r=t/2,h=w);
  }
  curve(ba);
}

module curve(ba) {
  translate([cr,0,cr]) rotate([-90,0,0]) difference() {
    cylinder(r=cr,h=w);
    translate([0,0,-1]) cylinder(r=cr-t,h=w+2);
    translate([0,-cr,-1]) cube([cr,cr*2,w+2]);
    rotate([0,0,-90+ba]) translate([0,-cr,-1]) cube([cr,cr*2,w+2]);
  }
}

module screen() {
  color("grey") translate([1.8,-2,t*1.7]) rotate([0,a,0]) cube(screen);
}