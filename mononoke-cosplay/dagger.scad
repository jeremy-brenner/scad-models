$fn = $preview ? 256 : 512;


color("red") chevron();
//color("red") translate([20,0,0]) chevron();

//color("white") blade();
//color("#303030") handle();

module chevron() {
  intersection() {
    difference() {
      scale([5,5,1]) translate([-6,6.1,1]) rotate([0,0,-90]) linear_extrude(height=10) import("chevron.svg");
      blade();
    }
    translate([0,0,1]) blade();
  } 
}

module handle() {
  rotate([0,-90,0]) {
    cylinder(r=6,h=100);
    translate([0,0,-10]) cylinder(r=3,h=10);
    translate([0,0,98]) torus(r1=6,r2=2);
  }
}


module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn/2)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn/4);
}

module blade() {
  difference() {
    scale([1.25,1.2,1.8]) fullBlade();
    translate([-1,0,0]) rotate([0,90,0]) cylinder(r=3.1,h=12);
  }
}

module fullBlade() {
      bladeQuarter();
      mirror([0,1,0]) bladeQuarter();
      mirror([0,0,1]) bladeQuarter();
      mirror([0,1,0]) mirror([0,0,1]) bladeQuarter();
}

module bladeQuarter() {
  translate([25,0,0]) {
    bladeTip();
    rotate([0,-90,0]) linear_extrude(height = 25) projection(cut=true) rotate([0,90,0]) bladeTip();
  }
}

module bladeTip() {
  scale([1.75,1.3,1]) intersection() {
    cube([100,20,5]);
    translate([0,-5,-995]) scale([1,0.2,1]) sphere(r=1000);
  }
}