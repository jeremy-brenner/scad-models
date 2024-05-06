$fn=64;

ir=3.25;
t=1.2;
a=25;

d=30;


translate([0,-d,0]) rotate([a,0,0]) arm();
mirror([0,1,0]) translate([0,-d,0]) rotate([a,0,0]) arm();
// translate([0,d,0]) rotate([-30,0,0]) arm();

difference() {
  union () {
    hull() {
      translate([0,-d,0]) rotate([a-8,0,0]) translate([-ir-t,0,130]) rotate([0,90,0]) cylinder(r=35,h=t);
      translate([0,d,0]) rotate([-a+8,0,0]) translate([-ir-t,0,130]) rotate([0,90,0]) cylinder(r=35,h=t);
    }
    hull() {
      translate([0,-d,0]) translate([-ir-t,0,0]) rotate([0,90,0]) cylinder(r=15,h=t);
      translate([0,d,0]) translate([-ir-t,0,0]) rotate([0,90,0]) cylinder(r=15,h=t);
      translate([0,-d,0]) translate([-ir-t,0,38]) rotate([0,90,0]) cylinder(r=15,h=t);
      translate([0,d,0]) translate([-ir-t,0,38]) rotate([0,90,0]) cylinder(r=15,h=t);
    }
  }
  translate([-ir-t-0.1,15,15]) rotate([-a,0,0]) cube([10,3,38]);
  mirror([0,1,0]) translate([-ir-t-0.1,15,15]) rotate([-a,0,0]) cube([10,3,38]);

  translate([-ir-t-0.1,70,118]) cube([10,3,35]);
  mirror([0,1,0]) translate([-ir-t-0.1,70,118]) cube([10,3,35]);

}


module arm() {
  difference() {
    union() {
    hull() {
      translate([0,0,5]) cylinder(r=ir+t,h=120);
      sphere(r=ir+t);
      translate([-ir-t,0,110]) rotate([0,90,0]) cylinder(r=15,h=t);
      translate([-ir-t,0,0]) rotate([0,90,0]) cylinder(r=15,h=t);
    }
      translate([0,-18,10]) rotate([0,-90,0]) cylinder(r=8,h=4.4);
      translate([0,-18,110]) rotate([0,-90,0]) cylinder(r=8,h=4.4);
      translate([0,18,110]) rotate([0,-90,0]) cylinder(r=8,h=4.4);


    }
    translate([0,0,5]) cylinder(r=ir,h=120.2);

    translate([0.1,-18,10]) rotate([0,-90,0]) cylinder(r=6.5,h=3);
    translate([0.1,-18,110]) rotate([0,-90,0]) cylinder(r=6.5,h=3);
    translate([0.1,18,110]) rotate([0,-90,0]) cylinder(r=6.5,h=3);

  }
}



// difference() {
//   cylinder(r=3.25+1.2,h=120);
//   translate([0,0,-0.1]) cylinder(r=3.25,h=120.2);
// }