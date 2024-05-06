
r=100;
$fn=64;

use <./ear-band.scad>;
use <./ear-glass.scad>;

use <./gem.scad>;

color("#222222") translate([0,0,-0.1]) earBand(30);
 
// positionedEar();
// mirror([1,0,0]) positionedEar();
translate([0,0,0.2]) tiaraBack();
 tiaraFront();

translate([0,0,-0.2]) color("DeepPink") gems();

color("white") leds(65);

module leds(a) {
  translate([0,0,0]) scale([1.1,1,1]) difference() {
    cylinder(r=r+1.1,h=10);
    translate([0,0,-0.1]) cylinder(r=r+0.1,h=10.2);
    rotate([0,0,a]) translate([-10000,-20000,-0.1]) cube([20000,20000,10.2]);
    rotate([0,0,-a]) translate([-10000,-20000,-0.1]) cube([20000,20000,10.2]);
  }
}

module gems() {
  translate([0,0,-2]) gemSpread() difference() {
    gem();
    translate([0,-0.1,0]) scale(0.85) gem();
  }
}

module gemSpread(sm=0) {
  translate([0,110,0]) rotate([-90,0,0]) scale(1.1+sm) children();
  translate([23,105,0]) rotate([0,0,-6]) rotate([-90,0,0]) scale(0.9+sm) children();
  translate([41,98,0]) rotate([0,0,-8]) rotate([-90,0,0]) scale(0.7+sm) children();
  translate([54,91,0]) rotate([0,0,-12]) rotate([-90,0,0]) scale(0.5+sm) children();
  mirror([1,0,0]) {
    translate([23,105,0]) rotate([0,0,-6]) rotate([-90,0,0]) scale(0.9+sm) children();
    translate([41,98,0]) rotate([0,0,-8]) rotate([-90,0,0]) scale(0.7+sm) children();
    translate([54,91,0]) rotate([0,0,-12]) rotate([-90,0,0]) scale(0.5+sm) children();
  }
}

module crescent(t) {
  difference() {
    translate([0,18,0]) intersection() {
      a=60;
      o=10;
      translate([o,0,0]) rotate([0,0,a]) scale([1.1,1,1]) cylinder(r=r,h=t);
      translate([-o,0,0]) rotate([0,0,-a]) scale([1.1,1,1]) cylinder(r=r,h=t);
    }
    translate([0,0,-0.1]) scale([1.1,1,1]) cylinder(r=r,h=t+0.2);
  }
}



module tiaraBack() {
  difference() {
    tiaraSolid();
    translate([0,-2,-2]) tiaraSolid();  
    render() gemBacks(0) gem();
  }

  intersection() {
    difference() {
      render() gemBacks(0.1) gem();
      render() gemBacks(0) gem();

      hull() tiaraSolid();
    }
    translate([-10000,-10000,0.01]) cube([20000,20000,10000]);
  }

}

module tiaraFront() {
  difference() {
    union() {
      translate([0,0,-2]) crescent(2);
      render() intersection() {
        render() gemBacks(0.1) gem();
        translate([-10000,-10000,-2]) cube([20000,20000,2]);
      }
    }
    translate([0,0,-0.01]) render() gemBacks(0) gem();
  }
   
}

module tiaraSolid() {
  render() difference() {
    union() {
      hull() {
        intersection() {
          gemBacks(0.1) gem();
          crescent(20);
        }
        crescent(1);
      }
     
    }        
    translate([0,0,-0.1]) scale([1.1,1,1]) cylinder(r=r,h=20);
  }
}

module gemBacks(sm) {
  translate([0,0,-2]) mirror([0,0,1]) scale([1,1,3]) gemSpread(sm) children();
}

module positionedEar() {
   translate([-12,-6,12]) rotate([0,0,35]) translate([0,120,0]) {
    translate([-75,-100,-5]) color("black") import("Ear.L.Velcro.stl");
    color("DeepPink") earGlass();
  }
}