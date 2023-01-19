stemIR=2;
stemOR=0.5;
baseR=3.75;
$fn=32;




cylinder(r1=baseR, r2=baseR-0.25,h=0.96);
translate([0,0,0.96]) stem();
translate([0,0,0.96+stemOR*2]) plug();

module plug() {
  scale([1,1,1.5]) intersection() {
    sphere(r=stemIR);
    cylinder(r=stemIR,h=stemIR);
  }
}

module stem() {
  difference() {
    cylinder(r=stemIR,h=stemOR*2);
    translate([0,0,stemOR]) torus(stemIR,stemOR);
  }
}


module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}
