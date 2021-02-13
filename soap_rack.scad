
h = 115;
w = 50;
$fn = 64;

translate([0,0,0]) foot();
translate([-40,0,40]) rotate([0,90,0]) foot();
translate([0,0,h]) rotate([0,180,0]) foot();
translate([40,0,h-40]) rotate([0,270,0]) foot();

translate([12,0,h/2-30]) rotate([0,-45,0]) foot();
translate([-12,0,h-30]) rotate([0,135,0]) foot();


//translate([0,0,19]) rotate([0,180,0]) foot();
//translate([0,0,70]) rotate([0,180,0]) foot();

difference() {
  translate([-40,0,0]) case(80,20,10,h);
  translate([-38,2,-2]) case(76,16,8,h+4);
  translate([-32.5,4,6]) cube([65,100,29]);
  translate([-32.5,4,40]) cube([65,100,29]);
  translate([-32.5,4,74]) cube([65,100,35]);
  drainHoles();
}

module case(w,h,r,l) {
    cube(size=[w,h-r,l]);
    translate([w/2,h-15,0]) rotate([0,0,45]) cube(size=[20,20,l]);
    translate([r,0,0]) cube(size=[w-r*2,h,l]);
    translate([r,h-r,0]) cylinder(r=r,h=l);
    translate([w-r,h-r,0]) cylinder(r=r,h=l);
}

module foot() translate([27.9,0,2.1]) rotate([0,45,0]) difference() {
        rotate([45,0,45]) cube(size=[10,10,10]);
        translate([-50,0,0]) cube(size=[100,100,100]);
}



module drainHole() {
  dhw = 5;
  dhew = sqrt(pow(dhw,2)/2);
  translate([-dhw/2,-0.1,0]) {
    translate([0,0,8]) rotate([0,45,0]) cube([dhew,5,dhew]);
    translate([0,0,h-16+8]) rotate([0,45,0]) cube([dhew,5,dhew]);
    translate([0,0,8]) cube([dhw,5,h-16]);
  }
}
    
module drainHoles() {
  translate([-24,0,0]) drainHole();
  translate([-12,0,0]) drainHole();
  translate([0,0,0]) drainHole();
  translate([12,0,0]) drainHole();
  translate([24,0,0]) drainHole();
}