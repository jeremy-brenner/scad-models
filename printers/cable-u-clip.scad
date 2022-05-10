$fn=32;

linear_extrude(height=3.5) cableUClip();

//cableU();

module cableUClip() {
  difference() {
      union() {
        translate([-5,-6]) square([10,4]);
        translate([-6,-3.75]) square([12,1.75]);
      }
      circle(r = 5);      
      translate([6,-3.75]) rotate([0,0,30]) square([10,10]);
      mirror([1,0]) translate([6,-3.75]) rotate([0,0,30]) square([10,10]);
  }
}





module cableU() {
  difference() {
      union() {
        circle(r = 6.5);
        translate([-6.5,-5.5]) square([13,5.5]);
      }
      circle(r = 5);
      translate([-5,-20]) square([10,20]);
      translate([-50,-4]) square([100,2]);
    }
}