screen = [10.5,350,225];
$fn=32;

t=2;
cr=t*1.5;
a=10;
w=15;
baseL=50;
supportH=23;

// projection(cut = false) 
// screen();

translate([35,0,0]) rotate([0,45-a/2,0]) translate([-20,0,0]) cube([20,w,t]);

brace(a,true);

translate([4.5+screen[0]+sin(a)*supportH,0,0]) {
  translate([-sin(a)*supportH,0,0]) mirror([1,0,0]) brace(-a,true);
  translate([sin(a)*supportH-2,0,0]) brace(-a);
}

rotate([0,90,0]) translate([-t,0,cr]) {
  cube([t,w,baseL]);
  translate([t/2,0,baseL]) rotate([-90,0,0]) cylinder(r=t/2,h=w);
}

module brace(ba,grip=false) {
  translate([cr,0,cr]) rotate([0,ba,0]) translate([-cr,0,0]) {
    cube([t,w,supportH]);
    translate([t/2,0,supportH]) rotate([-90,0,0]) cylinder(r=t/2,h=w);
    if(grip) {
      translate([t,0,supportH-t/2]) rotate([-90,0,0]) scale([0.75,1.25,1]) cylinder(r=t/2,h=w);
    }
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
  color("grey") translate([2.25,-2,t*1.7]) rotate([0,a,0]) cube(screen);
}