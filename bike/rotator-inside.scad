$fn=64;

rotatorInside();

module rotatorInside() {
  rt = 2;
  h = 11;
  or = 20;
  ir = or-rt;

  ring(or,ir,h);
  pip(or);
  rotate([0,0,90]) pip(or);
  rotate([0,0,180]) pip(or);
  rotate([0,0,270]) pip(or);

  bar();
  rotate([0,0,90]) bar();


}

module cut(or) {
  translate([0,0,2]) {
    rotate([0,0,-21]) translate([5,5,0]) cube([or,or,1]);
    rotate([0,0,-21]) translate([5,5,5]) cube([or,or,1]);
    rotate([0,0,-6]) translate([-0.5,0,0]) cube([1,or,6]);
  }
}

module ring(or,ir,h) {
  difference() {
    union() { 
      translate([0,0,0.5]) cylinder(r=or, h=h-0.5);
      cylinder(r1=or-0.5, r2=or,h=0.5);
    }
    translate([0,0,-0.05]) cylinder(r=ir, h=h+0.1);

    cut(or);
    rotate([0,0,90]) cut(or);
    rotate([0,0,180]) cut(or);
    rotate([0,0,270]) cut(or);
  }
}

module pip(or) {
  translate([or+0.75,0,3]) {
    difference() {
      union() {
        cylinder(r=1.5,h=4);
        translate([-2.25,-1.5,0]) cube([2.25,3,4]);
      }
      rotate([0,0,60]) translate([-1.5,-3.8,-0.5]) cube([3,3,5]);
    }
  }
}

module bar() {
  holew=4;
  difference() {
    translate([-1.5/2,-38/2,0]) cube([1.5,38,11]);
    translate([-1,15,2]) cube([2,holew,6]);
    translate([-1,-15-holew,2]) cube([2,holew,6]);
  }
}
