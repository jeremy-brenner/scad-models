$fn=64;


h=10;
hr=6.3;

so=-13;
sw=24;

difference() {
  union() {
    cylinder(r=hr+2,h=h);
    translate([-sw/2,so,0]) cube([sw,13.5,2]);
    translate([sw/2,so+6.75,0]) cylinder(r=6.75,h=4);
    translate([-sw/2,so+6.75,0]) cylinder(r=6.75,h=4);
    translate([-hr-2,0,0]) cube([(hr+2)*2,8,h]);
  }
  translate([0,0,-0.1]) cylinder(r=hr,h=h+0.2);
  translate([-hr,0,-0.1]) cube([hr*2,hr+3,h+0.2]);

  translate([sw/2,so+6.75,0]) {
    translate([0,0,-0.1]) cylinder(r=2.5,h=2.1);
    translate([0,0,1]) cylinder(r1=2.5, r2=4.75,h=3.1);
  }
  translate([-sw/2,so+6.75,0]) {
    translate([0,0,-0.1]) cylinder(r=2.5,h=2.1);
    translate([0,0,1]) cylinder(r1=2.5, r2=4.75,h=3.1);
  }
}
translate([-hr,6,0]) cylinder(r=2,h=h);
translate([hr,6,0]) cylinder(r=2,h=h);



  cylinder(r=6.15,h=20);